*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     Collections
Library     String
Force Tags    love_stress_test
Suite Setup    Check If Failed

*** Variables ***
${remotes}    26
${clients}    50
${num_msgs}   5000

*** Test Cases ***
Execute LOVE Stress Test
    [Tags]    execute
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    "bts"    "tts"
    ${scripts}    ${states}=    Execute Integration Test    love_stress_test    ${test_env}
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

Execute LOVE Stress Test on Kubernetes
    [Tags]    execute    k8s
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    "bts"    "tts"
    ${scripts}    ${states}=    Execute Integration Test    love_stress_test    ${test_env}    --k8s
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify Script LogMessages on Kubernetes
    [Tags]    robot:continue-on-failure    k8s
    ${dataframe}=    Get Recent Samples    Script    logevent_logMessage    ["message",]    6    None
    Log    ${dataframe}
    Should Be Equal As Strings    ${dataframe.message.values}[5]    Configure started
    Should Be Equal As Strings    ${dataframe.message.values}[4]    Waiting for ${remotes} remotes to be ready
    Should Be Equal As Strings    ${dataframe.message.values}[3]    Waiting for ${clients} Manager Clients to be ready
    Should Match Regexp    ${dataframe.message.values}[2]    Received \\d*/${num_msgs} messages
    Should Match Regexp    ${dataframe.message.values}[1]    LOVE stress test result: mean_latency_ms=\\d*\\.?\\d* num_messages=\\d*
    Should Be Equal As Strings    ${dataframe.message.values}[0]    Setting final state to <ScriptState.DONE: 8>
    Set Suite Variable    ${latency_string}    ${dataframe.message.values}[1]

Verify mean_latency is Less than One Second on Kubernetes
    [Tags]    k8s
    Set Test Variable    ${latency_threshold}    1000    # 1000ms == 1s
    Log    ${latency_string}
    @{words}=    Split String    ${latency_string}    =
    @{string}=    Split String    ${words}[1]    ${SPACE}
    Set Test Variable    ${mean_latency}    ${string}[0]
    Should Be True    ${mean_latency} < ${latency_threshold}
