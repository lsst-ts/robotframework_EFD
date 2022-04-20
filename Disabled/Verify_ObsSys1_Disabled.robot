*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    obsys1

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ScriptQueue:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:1

Verify ScriptQueue:1 ConfigurationApplied Event
    [Tags]    obsys1
    Verify ConfigurationApplied    ScriptQueue    index=1

Verify ScriptQueue:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:2

Verify ScriptQueue:2 ConfigurationApplied Event
    [Tags]    obsys1
    Verify ConfigurationApplied    ScriptQueue    index=2

Verify Watcher Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Watcher

Verify Watcher ConfigurationApplied Event
    [Tags]    obsys1
    Verify ConfigurationApplied    Watcher

Verify Watcher ConfigurationApplied timing
    [Tags]    obsys1
    Verify Time Delta    Watcher    logevent_summaryState    logevent_configurationApplied    ${time_window}
