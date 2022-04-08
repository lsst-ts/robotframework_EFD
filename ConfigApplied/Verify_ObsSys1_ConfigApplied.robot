*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify ScriptQueue:1 ConfigurationApplied Event
    [Tags]    obsys1
    Verify ConfigurationApplied    ScriptQueue    index=1

Verify ScriptQueue:2 ConfigurationApplied Event
    [Tags]    obsys1
    Verify ConfigurationApplied    ScriptQueue    index=2

Verify Watcher ConfigurationApplied Event
    [Tags]    obsys1
    Verify ConfigurationApplied    Watcher
