*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    eas

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify DIMM:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:1

Verify DIMM:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    1

Verify DIMM:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationApplied    ${time_window}    1
