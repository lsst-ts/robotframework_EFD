*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Offline
    [Tags]    eas
    Verify Summary State    ${STATES}[offline]    DIMM:1

Verify DIMM:2 Offline
    [Tags]    eas
    Verify Summary State    ${STATES}[offline]    DIMM:2

Verify WeatherStation:1 Offline
    [Tags]    eas
    Verify Summary State    ${STATES}[offline]    WeatherStation:1
