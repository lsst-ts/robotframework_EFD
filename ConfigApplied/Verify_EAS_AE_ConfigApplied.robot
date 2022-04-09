*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify DSM:1 ConfigurationApplied Event
    [Tags]    eas_ae
    Verify ConfigurationApplied    DSM    index=1

Verify DSM:2 ConfigurationApplied Event
    [Tags]    eas_ae
    Verify ConfigurationApplied    DSM    index=2
