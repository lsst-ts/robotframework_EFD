*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify Authorize Shutdown
    [Tags]    obsys1
    Verify Shutdown Process    Authorize
    Verify Time Delta    Authorize    ${topic_1}    ${topic_2}    ${time_window}

Verify ScriptQueue:1 Shutdown
    [Tags]    obsys1
    Verify Shutdown Process    ScriptQueue    1
    Verify Time Delta    ScriptQueue    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify ScriptQueue:2 Shutdown
    [Tags]    obsys1
    Verify Shutdown Process    ScriptQueue    index=2
    Verify Time Delta    ScriptQueue    ${topic_1}    ${topic_2}    ${time_window}    index=2

Verify Watcher Shutdown
    [Tags]    obsys1
    Verify Shutdown Process    Watcher
    Verify Time Delta    Watcher    ${topic_1}    ${topic_2}    ${time_window}
