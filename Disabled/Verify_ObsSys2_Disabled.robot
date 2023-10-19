*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys2

*** Variables ***
${time_window}    10

*** Test Cases ***
#Scheduler:1
Verify Scheduler:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    1

Verify Scheduler:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    ${time_window}    1

#Scheduler:2
Verify Scheduler:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    2

Verify Scheduler:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=2
