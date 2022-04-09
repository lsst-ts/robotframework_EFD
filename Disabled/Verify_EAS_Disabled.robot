*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Disabled
    [Tags]    eas
    Verify Summary State    ${STATES}[disabled]    DIMM:1

Verify WeatherStation:1 Disabled
    [Tags]    eas
    Verify Summary State    ${STATES}[disabled]    WeatherStation:1
