*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    eas_ae

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify DSM:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DSM:1    auto_enable=True

Verify DSM:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DSM    1

Verify DSM:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DSM:2    auto_enable=True

Verify DSM:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DSM    2
