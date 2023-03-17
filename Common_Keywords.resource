*** Settings ***
Library    Process
Library    Collections
Library    String
Library    DateTime

*** Variables ***
@{completed}    ${8}    ${9}    ${10}

*** Variables ***
@{completed}    ${8}    ${9}    ${10}

*** Keywords ***
Execute Integration Test
    [Documentation]    This keyword executes the given integration test `inttest_script` and waits for all the child scripts to complete.
    ...    The `count_interval` argument should be a list of 2-tuples, where each tuple is the number of retries and the duration of the retry
    ...    for the child script.
    [Arguments]    ${inttest_script}
    ${result}=    Run Process    ${inttest_script}
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error
    ${indexes}=    Get Line    ${result.stdout}   -2
    ${string}=    Strip String    ${indexes}    characters=[]
    @{scripts}=    Split String    ${string}    separator=,${SPACE}
    ${states}=    Get Line    ${result.stdout}   -1
    ${string}=    Strip String    ${states}    characters=[]
    @{states}=    Split String    ${string}    separator=,${SPACE}
    RETURN    ${scripts}    ${states}

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
    [Documentation]    This keyword monitors the ScriptQueue_logevent_script scriptState field for one of
    ...    DONE = 8, STOPPED = 9 or FAILED = 10.
    ...    The keyword requires three arguments, the `path` of the script, as returned by the
    ...    ScriptQueue_logevent_script path field, the `interval` in seconds to wait between checks, and
    ...    the number of `retries` before stopping.
    [Arguments]    ${script_indexes}    ${script_states}
    ${num_scripts}=    Get Length    ${script_indexes}
    ${num_states}=    Get Length    ${script_states}
    Should Be Equal    ${num_scripts}    ${num_states}
    FOR    ${i}    IN RANGE    ${num_scripts}
        Get Script Metadata    ${script_indexes}[${i}]
        Should Be Equal As Integers    ${script_states}[${i}]    8    values=True    msg=Script index ${script_indexes}[${i}]
        Run Keyword If    ${script_states}[${i}] != 8    Fatal Error
    END
