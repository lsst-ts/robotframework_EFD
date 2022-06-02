*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Library     DateTime
Force Tags    at_light_cal    skipped

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATMonochromator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATMonochromator

Verify ATMonochromator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATMonochromator

Verify ATMonochromator ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify FiberSpectrograph:3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    FiberSpectrograph:3

Verify FiberSpectrograph:3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    FiberSpectrograph    3

Verify FiberSpectrograph:3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    FiberSpectrograph    logevent_summaryState    logevent_configurationApplied    ${time_window}    3
