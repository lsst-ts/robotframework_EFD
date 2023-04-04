*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify WeatherStation:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    WeatherStation:1
