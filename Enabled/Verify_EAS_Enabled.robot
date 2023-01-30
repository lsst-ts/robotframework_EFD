*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify WeatherForecast Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    WeatherForecast

Verify WeatherStation:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    WeatherStation:1
