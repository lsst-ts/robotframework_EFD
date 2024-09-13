*** Settings ***
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}    ${env_efd}
Library    Process
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    Process
Library    String

*** Variables ***
@{failed_script_states}      9    10    11

*** Keywords ***
Execute Integration Test
    [Documentation]    This keyword executes the given integration test `inttest_script` with the given, optional,
    ...    script arguments `script_args` and waits for all the child scripts to complete.
    ...    It returns the `script_indexes` and `script_states` as lists.
    [Arguments]    ${inttest_script}    @{script_args}
    ${result}=    Run Process    ${inttest_script}    @{script_args}
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error
    ${indexes}=    Get Line    ${result.stdout}   -2
    ${string}=    Strip String    ${indexes}    characters=[]
    @{script_indexes}=    Split String    ${string}    separator=,${SPACE}
    ${states}=    Get Line    ${result.stdout}   -1
    ${string}=    Strip String    ${states}    characters=[]
    @{script_states}=    Split String    ${string}    separator=,${SPACE}
    RETURN    ${script_indexes}    ${script_states}

Verify Scripts Completed Successfully
    [Documentation]    The keyword requires two arguments, the list of `script_indexes` for each script, 
    ...    and the list of associated `script_states` for each script. It then iterates over the lists to 
    ...    retrieve script metadata and verify each script completed as DONE (Script.ScriptState enum value 8).  
    ...    If checking on the `shutdown` test, the very last script is TERMINATED (Script.ScriptState enum value 7).
    [Arguments]    ${script_indexes}    ${script_states}    ${shutdown}=${False}
    ${num_scripts}=    Get Length    ${script_indexes}
    ${num_states}=    Get Length    ${script_states}
    Should Be Equal    ${num_scripts}    ${num_states}
    # There is a ~0.03s delay before the very last event is sent; it populates the timestampProcessEnd field. 
    # So wait for 'Get Script Metadata' to succeed.
    Run Keyword If    ${shutdown}    Log    This is the Shutdown test.
    FOR    ${i}    IN RANGE    ${num_scripts}
        Get Script Metadata    ${script_indexes}[${i}]
        IF    ${shutdown} and ${i + 1} == ${num_scripts}    # Only for the last script of the Shutdown process.
            Run Keyword And Continue On Failure    Should Be Equal As Integers    ${script_states}[${i}]    7    values=True    msg=Script index ${script_indexes}[${i}]
        ELSE
            Run Keyword And Continue On Failure    Should Be Equal As Integers    ${script_states}[${i}]    8    values=True    msg=Script index ${script_indexes}[${i}]
        END
    END

Report If Failed
    [Documentation]    This keyword creates or updates the `STATE_FAILED` file that is used in the `Check if Failed` keyword.
    [Arguments]    ${script_indexes}    ${script_states}
    # See if the STATE_FAILED file exists. It is stored in the ${EXECDIR}/Reports folder, as that is persistent across ArgoCD Workflows.
    ${exists}=    Run Process    ls     ${EXECDIR}/Reports/STATE_FAILED
    # If a script failed, either create or update the STATE_FAILED file accordingly.
    IF    '10' in ${script_states} or '11' in ${script_states}
        Run Keyword If    ${exists.rc} != 0    Create File    ${EXECDIR}/Reports/STATE_FAILED    Failure in scripts: ${script_indexes} states: ${script_states}\n
        Run Keyword IF    ${exists.rc} == 0    Append To File    ${EXECDIR}/Reports/STATE_FAILED    Failure in scripts: ${script_indexes} states: ${script_states}\n
    END

Check If Failed
    [Documentation]    This keyword checks if the `STATE_FAILED` file contains the word `Failure`, meaning that some number of CSCs failed
    ...    the State transitions tests. Since this is the case, the remaining tests are unlikely to succeed, so this stops 
    ...    any further test execution.
    # If the STATE_FAILED file exists, get the contents. The file is stored in the ${EXECDIR}/Reports folder, as that is persistent across ArgoCD Workflows.
    ${exists}=    Run Process    ls     ${EXECDIR}/Reports/STATE_FAILED
    ${state_failed}=    Run Keyword If    ${exists.rc} == 0    Get File    ${EXECDIR}/Reports/STATE_FAILED
    # If the STATE_FAILED file contains the word 'Failure' halt any further test execution.
    Run Keyword If    "Failure" in """${state_failed}"""    Fatal Error    msg="One or more CSCs failed the State transitions."

Check If Script Failed
    [Documentation]    This keyword checks if any of the scripts failed.  The keyword takes the list of `script_states` and checks if any of values
    ...    match those in the `failed_script_states` list defined here in the Common_Keywords.robot library.
    [Arguments]    ${script_states}
    Run Keyword If    any(x in ${failed_script_states} for x in ${script_states})    Fatal Error    msg="Imaging script failed; skipping remaining tests."

Get Script Metadata
    [Documentation]    Capture script metadata, like script index and start time. Ensure script finished successfully.
    [Arguments]    ${script_index}
    ${dataframe}=    Influxdb Query    ScriptQueue    logevent_script    isStandard,path,scriptSalIndex,timestampProcessStart,timestampProcessEnd,scriptState    where_clause=WHERE scriptSalIndex=${script_index} AND timestampProcessEnd>0
    Log Many    ${dataframe.isStandard.values}[0]    ${dataframe.path.values}[0]    ${dataframe.scriptSalIndex.values}[0]    ${dataframe.timestampProcessStart.values}[0]    ${dataframe.timestampProcessEnd.values}[0]    ${dataframe.scriptState.values}[0]
    # Convert start and end times to the proper format.
    ${script_start}=    Convert Date    ${dataframe.timestampProcessStart.values}[0]    result_format=datetime
    ${script_start}=    Evaluate    $script_start.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    ${script_end}=    Convert Date    ${dataframe.timestampProcessEnd.values}[0]    result_format=datetime
    ${script_end}=    Evaluate    $script_end.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    # Log the metadata.
    Log Many    isStandard= ${dataframe.isStandard.values}    path= ${dataframe.path.values}    scriptIndex= ${dataframe.scriptSalIndex.values}    script_start= ${script_start}    script_end= ${script_end}
    Set Suite Variable    ${script_start}
    Set Suite Variable    ${script_end}

Compare Numbers
    [Documentation]    Given two numbers, test if they are equal within a given tolerance.
    [Arguments]    ${actual}    ${expected}    ${tolerance}
    ${actual}=    Evaluate    abs(${actual})
    ${expected}=    Evaluate    abs(${expected})
    ${lower}=    Evaluate    ${expected} - ${tolerance}
    ${upper}=    Evaluate    ${expected} + ${tolerance}
    Should Be True    ${lower} < ${actual} < ${upper}

Verify Telescope Parked
    [Documentation]    Verify the given telescope is in the appropriate parked position.
    [Arguments]    ${telescope}
    [Tags]    robot:continue-on-failure
    IF    "${telescope}" == "auxtel"
        Verify Topic Attribute    ATPtg    logevent_currentTarget    ["targetName",]    ["Park position",]
        #Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ["inPosition",]    ["True",]
        #Verify Topic Attribute    ATMCS    logevent_azimuthInPosition    ["inPosition",]    ["True",]
        #Verify Topic Attribute    ATMCS    logevent_elevationInPosition    ["inPosition",]    ["True",]
        Verify Topic Attribute    ATMCS    logevent_target    ["azimuth",]    ["0",]
        Verify Topic Attribute    ATMCS    logevent_target    ["elevation",]    ["80",]
        ${dataframe}=    Get Recent Samples    ATMCS    mount_AzEl_Encoders    ["azimuthCalculatedAngle0", "elevationCalculatedAngle0",]    1    None
        Compare Numbers    ${dataframe.azimuthCalculatedAngle0.values}[0]    0    0.5
        Compare Numbers    ${dataframe.elevationCalculatedAngle0.values}[0]    80    0.5
    ELSE IF    "${telescope}" == "maintel"
        Verify Topic Attribute    MTPtg    logevent_currentTarget    ["targetName",]    ["Park position",]
        Verify Topic Attribute    MTMount    logevent_target    ["azimuth",]    ["0",]
        Verify Topic Attribute    MTMount    logevent_target    ["elevation",]    ["80",]
        ${dataframe}=    Get Recent Samples    MTMount    azimuth    ["actualPosition", "demandPosition", "actualTorque", "actualVelocity", "demandVelocity",]    1    None
        Compare Numbers    ${dataframe.actualPosition.values}[0]    0    0.5
        Compare Numbers    ${dataframe.actualTorque.values}[0]    0    0.5
        Compare Numbers    ${dataframe.actualVelocity.values}[0]    0    0.5
        Verify Topic Attribute    MTMount    azimuth    ["demandPosition",]    ["0",]
        Verify Topic Attribute    MTMount    azimuth    ["demandVelocity",]    ["0",]
        ${dataframe}=    Get Recent Samples    MTMount    elevation    ["actualPosition", "demandPosition", "actualTorque", "actualVelocity", "demandVelocity",]    1    None
        Compare Numbers    ${dataframe.actualPosition.values}[0]    80    0.5
        Compare Numbers    ${dataframe.actualTorque.values}[0]    0    0.5
        Compare Numbers    ${dataframe.actualVelocity.values}[0]    0    0.5
        Verify Topic Attribute    MTMount    elevation    ["demandPosition",]    ["80",]
        Verify Topic Attribute    MTMount    elevation    ["demandVelocity",]    ["0",]
    ELSE
        Log    "AttributeError: expecting one of [auxtel, maintel]."
    END

Verify Dome Parked
    [Documentation]    Verify the dome for the given telescope is in the appropriate parked position.
    [Arguments]    ${telescope}
    [Tags]    robot:continue-on-failure
    IF    "${telescope}" == "auxtel"
        Verify Topic Attribute    ATDome    logevent_mainDoorState    ["state",]    ["1",]    #CLOSED
        Verify Topic Attribute    ATDome    logevent_dropoutDoorState    ["state",]    ["1",]    #CLOSED
        ${dataframe}=    Get Recent Samples    ATDome    position    ["azimuthPosition",]    1    None
        Compare Numbers    ${dataframe.azimuthPosition.values}[0]    285    0.5
        ${dataframe}=    Get Recent Samples    ATDome    logevent_azimuthState    ["homed", "homeSwitch",]    1    None
        Should Be True    ${dataframe.homed.values}[0]
        Log    ${dataframe.homeSwitch.values}[0]
    ELSE IF    "${telescope}" == "maintel"
        Log    "Pending"
    ELSE
        Log    "AttributeError: expecting one of [auxtel, maintel]."
    END

Verify Image in OODS
    [Documentation]    To give the `OODS` time to ingest all the images, this compound keyword verifies the given `last_image` is present in the EFD.
    [Arguments]    ${OODS}    ${last_image}
    ${dataframe}=    Get Recent Samples    ${OODS}    logevent_imageInOODS    ["camera", "description", "obsid",]    1    None
    Should Be Equal As Strings    ${dataframe.obsid.values}[0]    ${last_image}

Set EFD Values
    [Documentation]    Define the BigCamera specific variable values.
    IF    "${env_efd}" == "tucson_teststand_efd"
        Set Suite Variable    \${BigCamera}    CCCamera
        Set Suite Variable    \${OODS}    CCOODS
        Set Suite Variable    \${HeaderService}    CCHeaderService
        Set Suite Variable    \${OcpsIndex}    2
        IF    "Standby" in "${SUITE NAME}"
            Set Suite Variable    \${camera_salver}    ${cccamera_salver}
            Set Suite Variable    \${camera_xmlver}    ${cccamera_xmlver}
            Set Suite Variable    \${headerservice_salver}    ${ccheaderservice_salver}
            Set Suite Variable    \${headerservice_xmlver}    ${ccheaderservice_xmlver}
            Set Suite Variable    \${ocps_salver}    ${ocps2_salver}
            Set Suite Variable    \${ocps_xmlver}    ${ocps2_xmlver}
            Set Suite Variable    \${oods_salver}    ${ccoods_salver}
            Set Suite Variable    \${oods_xmlver}    ${ccoods_xmlver}
        END
    ELSE IF    "${env_efd}" == "base_efd"
        Set Suite Variable    \${BigCamera}    MTCamera
        Set Suite Variable    \${OODS}    MTOODS
        Set Suite Variable    \${HeaderService}    MTHeaderService
        Set Suite Variable    \${OcpsIndex}    3
        IF    "Standby" in "${SUITE NAME}"
            Set Suite Variable    \${camera_salver}    ${mtcamera_salver}
            Set Suite Variable    \${camera_xmlver}    ${mtcamera_xmlver}
            Set Suite Variable    \${oods_salver}    ${mtoods_salver}
            Set Suite Variable    \${oods_xmlver}    ${mtoods_xmlver}
            Set Suite Variable    \${headerservice_salver}    ${mtheaderservice_salver}
            Set Suite Variable    \${headerservice_xmlver}    ${mtheaderservice_xmlver}
            Set Suite Variable    \${ocps_salver}    ${ocps3_salver}
            Set Suite Variable    \${ocps_xmlver}    ${ocps3_xmlver}
        END
    ELSE
        Fail    msg="Please set the env_efd variable; allowed values are ['tucson_teststand_efd', 'base_efd']"
    END
    @{bigcamera_cscs}=    Create List    ${BigCamera}    ${OODS}    ${HeaderService}
    Set Suite Variable    @{bigcamera_cscs}
