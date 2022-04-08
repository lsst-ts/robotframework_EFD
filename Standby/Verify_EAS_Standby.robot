*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Standby
    [Tags]    eas
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    DIMM    1

Verify DIMM:2 Standby
    [Tags]    eas
    Verify Summary State    ${STATES}[standby]    DIMM:2

Verify DIMM:2 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    DIMM    2

Verify WeatherStation:1 Standby
    [Tags]    eas
    Verify Summary State    ${STATES}[standby]    WeatherStation:1

Verify WeatherStation:1 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    WeatherStation    1
