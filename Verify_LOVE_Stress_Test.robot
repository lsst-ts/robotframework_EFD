*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Force Tags    love_stress_test

*** Variables ***
${remotes}    26
${clients}    50
${num_msgs}   5000

*** Test Cases ***
Execute LOVE Stress Test
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    love_stress_test
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify Script LogMessages
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    Script    logevent_logMessage    ["message",]    6    None
    Log    ${dataframe}
    Should Be Equal As Strings    ${dataframe.message.values}[5]    Configure started
    Should Be Equal As Strings    ${dataframe.message.values}[4]    Waiting for ${remotes} remotes to be ready
    Should Be Equal As Strings    ${dataframe.message.values}[3]    Waiting for ${clients} Manager Clients to be ready
    Should Match Regexp    ${dataframe.message.values}[2]    Received \\d*/${num_msgs} messages
    Should Match Regexp    ${dataframe.message.values}[1]    LOVE stress test result: mean_latency_ms=\\d*\\.?\\d* num_messages=\\d*
    Should Be Equal As Strings    ${dataframe.message.values}[0]    Setting final state to <ScriptState.DONE: 8>
    Set Suite Variable    ${latency_string}    ${dataframe.message.values}[1]

Verify mean_latency is Less than One Second
    [Tags]
    Set Test Variable    ${latency_threshold}    1000    # 1000ms == 1s
    Log    ${latency_string}
    @{words}=    Split String    ${latency_string}    =
    @{string}=    Split String    ${words}[1]    ${SPACE}
    Set Test Variable    ${mean_latency}    ${string}[0]
    Should Be True    ${mean_latency} < ${latency_threshold}
