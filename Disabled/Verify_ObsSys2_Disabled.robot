*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    obsys2

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify Scheduler:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=1

Verify Scheduler:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

Verify Scheduler:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=2

Verify Scheduler:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=2

Verify OCPS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    OCPS:1

Verify OCPS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    index=1

Verify OCPS:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

Verify OCPS:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    OCPS:2

Verify OCPS:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    index=2

Verify OCPS:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=2
