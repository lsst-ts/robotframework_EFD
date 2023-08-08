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
Verify Scheduler:1 Shutdown
    [Tags]    obsys2
    Verify Shutdown Process    Scheduler    index=1
    Verify Time Delta    Scheduler    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify Scheduler:2 Shutdown
    [Tags]    obsys2
    Verify Shutdown Process    Scheduler    index=2
    Verify Time Delta    Scheduler    ${topic_1}    ${topic_2}    ${time_window}    index=2

Verify OCPS:1 Shutdown
    [Tags]    obsys2
    Verify Shutdown Process    OCPS    index=1
    Verify Time Delta    OCPS    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify OCPS:2 Shutdown
    [Tags]    obsys2
    Verify Shutdown Process    OCPS    index=2
    Verify Time Delta    OCPS    ${topic_1}    ${topic_2}    ${time_window}    index=2
