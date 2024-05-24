*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    obssys

*** Variables ***
${topic_1}    command_disable
${topic_2}    logevent_summaryState

*** Test Cases ***
Verify Scheduler:1 Shutdown
    [Tags]
    Verify Shutdown Process    Scheduler    index=1
    Verify Time Delta    Scheduler    ${topic_1}    ${topic_2}    index=1

Verify Scheduler:2 Shutdown
    [Tags]
    Verify Shutdown Process    Scheduler    index=2
    Verify Time Delta    Scheduler    ${topic_1}    ${topic_2}    index=2

Verify Scheduler:3 Shutdown
    [Tags]
    Verify Shutdown Process    Scheduler    index=3
    Verify Time Delta    Scheduler    ${topic_1}    ${topic_2}    index=3

Verify ScriptQueue:1 Shutdown
    [Tags]
    Verify Shutdown Process    ScriptQueue    1
    Verify Time Delta    ScriptQueue    ${topic_1}    ${topic_2}    index=1

Verify ScriptQueue:2 Shutdown
    [Tags]
    Verify Shutdown Process    ScriptQueue    index=2
    Verify Time Delta    ScriptQueue    ${topic_1}    ${topic_2}    index=2

Verify ScriptQueue:3 Shutdown
    [Tags]
    Verify Shutdown Process    ScriptQueue    index=3
    Verify Time Delta    ScriptQueue    ${topic_1}    ${topic_2}    index=3

Verify Watcher Shutdown
    [Tags]
    Verify Shutdown Process    Watcher
    Verify Time Delta    Watcher    ${topic_1}    ${topic_2}
