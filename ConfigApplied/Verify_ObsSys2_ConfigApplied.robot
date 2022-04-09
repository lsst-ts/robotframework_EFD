*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    obsys2
    Verify ConfigurationApplied    Scheduler    index=1

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    obsys2
    Verify ConfigurationApplied    Scheduler    index=2

Verify OCPS:1 ConfigurationApplied Event
    [Tags]    obsys2
    Verify ConfigurationApplied    OCPS    index=1

Verify OCPS:2 ConfigurationApplied Event
    [Tags]    obsys2
    Verify ConfigurationApplied    OCPS    index=2
