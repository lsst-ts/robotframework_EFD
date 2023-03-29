*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Execute EAS Disabled to Enabled
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    eas_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify DIMM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify WeatherStation:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    WeatherStation:1
