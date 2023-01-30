*** Settings ***
Library     String
Library     DateTime

*** Keywords ***
Get Script Metadata
    [Documentation]    Capture script metadat, like script index and start time. Ensure script finished successfully.
    ${dataframe}=    Get Recent Samples    ScriptQueue    logevent_script    ["isStandard", "path", "scriptSalIndex", "timestampProcessStart", "timestampProcessEnd", "scriptState",]    1    None
    ${script_start}=    Convert Date    ${dataframe.timestampProcessStart.values}[0]    result_format=datetime
    ${script_start}=    Evaluate    $script_start.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    ${script_end}=    Convert Date    ${dataframe.timestampProcessEnd.values}[0]    result_format=datetime
    ${script_end}=    Evaluate    $script_end.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    Log Many    isStandard= ${dataframe.isStandard.values}    path= ${dataframe.path.values}    scriptIndex= ${dataframe.scriptSalIndex.values}    script_start= ${script_start}    script_end= ${script_end}
    Set Suite Variable    ${script_start}
    Set Suite Variable    ${script_end}
    Should Be Equal As Integers    ${dataframe.scriptState.values}[0]    8

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
