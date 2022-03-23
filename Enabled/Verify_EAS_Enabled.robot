*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify DIMM:2 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:2

Verify WeatherStation:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    WeatherStation:1
