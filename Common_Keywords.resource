*** Settings ***
Library    Process
Library    Collections
Library    String
Library    DateTime

*** Keywords ***
Execute Integration Test
    [Documentation]    This keyword executes the given integration test `inttest_script` and waits for all the child scripts to complete.
    ...    It returns the `script_indexes` and `script_states` as lists.
    [Arguments]    ${inttest_script}
    ${result}=    Run Process    ${inttest_script}
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error
    ${indexes}=    Get Line    ${result.stdout}   -2
    ${string}=    Strip String    ${indexes}    characters=[]
    @{script_indexes}=    Split String    ${string}    separator=,${SPACE}
    ${states}=    Get Line    ${result.stdout}   -1
    ${string}=    Strip String    ${states}    characters=[]
    @{script_states}=    Split String    ${string}    separator=,${SPACE}
    RETURN    ${script_indexes}    ${script_states}

Get Script Metadata
    [Documentation]    Capture script metadata, like script index and start time. Ensure script finished successfully.
    [Arguments]    ${script_index}
    ${dataframe}=    Influxdb Query    ScriptQueue    logevent_script    isStandard,path,scriptSalIndex,timestampProcessStart,timestampProcessEnd,scriptState    where_clause=WHERE scriptSalIndex=${script_index}
    Log Many    ${dataframe.isStandard.values}[0]    ${dataframe.path.values}[0]    ${dataframe.scriptSalIndex.values}[0]    ${dataframe.timestampProcessStart.values}[0]    ${dataframe.timestampProcessEnd.values}[0]    ${dataframe.scriptState.values}[0]
    # Convert start and end times to the proper format.
    ${script_start}=    Convert Date    ${dataframe.timestampProcessStart.values}[0]    result_format=datetime
    ${script_start}=    Evaluate    $script_start.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    ${script_end}=    Convert Date    ${dataframe.timestampProcessEnd.values}[0]    result_format=datetime
    ${script_end}=    Evaluate    $script_end.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    # Log the metadata.
    Log Many    isStandard= ${dataframe.isStandard.values}    path= ${dataframe.path.values}    scriptIndex= ${dataframe.scriptSalIndex.values}    script_start= ${script_start}    script_end= ${script_end}
    # Define start and end time variables for testing runtime.
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

Verify Script Runtime
    [Documentation]    Intended to run after the script is complete, given the script start and end timestamps, respectively,
    ...    this keyword will test if the actual runtime is less than the estimated duration of the script.
    [Arguments]    ${start_time}    ${end_time}
    # Get the estimated duration from the duration attribute of the most recent Script.logevent_metadata topic.
    ${dataframe}=    Get Recent Samples    Script    logevent_metadata    ["*",]    1    None
    ${est_duration}=    Set Variable    ${dataframe.duration.values}[0]
    # Set boundry times with a 20% tolerance.
    ${lower_limit}=    Evaluate    ${est_duration} * 0.8
    ${upper_limit}=    Evaluate    ${est_duration} * 1.2
    # Compare runtime to expected duration.
    ${runtime}=    Subtract Date From Date    ${end_time}    ${start_time}    result_format=number
    Should Be True    ${lower_limit} < ${runtime} < ${upper_limit}

Verify Scripts Completed Successfully
    [Documentation]    The keyword requires two arguments, the list of `script_indexes` for each script, 
    ...    and the list of associated `script_states` for each script. It then iterates over the lists to 
    ...    retrieve script metadata and verify each script completed as DONE (enum value 8).  
    [Arguments]    ${script_indexes}    ${script_states}
    ${num_scripts}=    Get Length    ${script_indexes}
    ${num_states}=    Get Length    ${script_states}
    Should Be Equal    ${num_scripts}    ${num_states}
    FOR    ${i}    IN RANGE    ${num_scripts}
        Get Script Metadata    ${script_indexes}[${i}]
        Should Be Equal As Integers    ${script_states}[${i}]    8    values=True    msg=Script index ${script_indexes}[${i}]
    END
