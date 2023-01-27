*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    stress_test

*** Variables ***
${remotes}    22
${clients}    50
${num_msgs}   5000

*** Test Cases ***
Verify Script LogMessages
    [Tags]
    ${dataframe}=    Get Recent Samples    Script    logevent_logMessage    ["name", "message"]    4    None
    Should Be Equal As Strings    ${dataframe.message.values}[3]    Configure started
    Should Be Equal As Strings    ${dataframe.message.values}[2]    Waiting for ${remotes} remotes to be ready
    Should Be Equal As Strings    ${dataframe.message.values}[1]    Waiting for ${clients} Manager Clients to be ready
    Should Be Equal As Strings    ${dataframe.message.values}[0]    LOVE stress test result: mean_latency_ms= num_messages=${num_msgs}
