*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    at_light_cal    skipped

*** Test Cases ***
Verify ATMonochromator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATMonochromator

Verify ATMonochromator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATMonochromator

Verify ATMonochromator ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATMonochromator    logevent_configurationApplied    logevent_summaryState

Verify FiberSpectrograph:3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    FiberSpectrograph:3

Verify FiberSpectrograph:3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    FiberSpectrograph    3

Verify FiberSpectrograph:3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    FiberSpectrograph    logevent_configurationApplied    logevent_summaryState    3
