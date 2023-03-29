*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    latiss

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATOODS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATOODS

Verify ATOODS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATOODS  

Verify ATCamera Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATCamera

Verify ATCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATCamera

Verify ATCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify ATHeaderService Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATHeaderService

Verify ATHeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATHeaderService

Verify ATSpectrograph Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATSpectrograph

Verify ATSpectrograph ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATSpectrograph

Verify ATSpectrograph ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    logevent_configurationApplied    ${time_window}
