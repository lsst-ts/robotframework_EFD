*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    obsys2

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify Scheduler:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    1

Verify Scheduler:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    ${time_window}    1

Verify Scheduler:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    2

Verify Scheduler:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    ${time_window}    2

Verify OCPS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    OCPS:1

Verify OCPS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    1

Verify OCPS:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationApplied    ${time_window}    1

Verify OCPS:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    OCPS:2

Verify OCPS:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    2

Verify OCPS:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationApplied    ${time_window}    2
