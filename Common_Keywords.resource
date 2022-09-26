*** Keywords ***
Get Script Metadata
    [Documentation]    Capture script metadat, like script index and start time. Ensure script finished successfully.
    ${dataframe}=    Get Recent Samples    ScriptQueue    logevent_script    ["isStandard", "path", "scriptSalIndex", "timestampProcessStart", "scriptState",]    1    None
    ${script_start}=    Convert Date    ${dataframe.timestampProcessStart.values}[0]    result_format=datetime
    ${script_start}=    Evaluate    $script_start.replace(tzinfo=datetime.timezone.utc)    modules=datetime
    Log Many    isStandard= ${dataframe.isStandard.values}    path= ${dataframe.path.values}    scriptIndex= ${dataframe.scriptSalIndex.values}    script_start= ${script_start}
    Set Suite Variable    ${script_start}
    Should Be Equal As Integers    ${dataframe.scriptState.values}[0]    8

Compare Numbers
    [Documentation]    Given two numbers, test if they are equal within a given tolerance.
    [Arguments]    ${actual}    ${expected}    ${tolerance}
    ${actual}=    Evaluate    abs(${actual})
    ${expected}=    Evaluate    abs(${expected})
    ${lower}=    Evaluate    ${expected} - ${tolerance}
    ${upper}=    Evaluate    ${expected} + ${tolerance}
    Should Be True    ${lower} < ${actual} < ${upper}

