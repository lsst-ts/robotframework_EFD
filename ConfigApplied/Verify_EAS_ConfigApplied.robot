*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify DIMM:1 ConfigurationApplied Event
    [Tags]    eas
    Verify ConfigurationApplied    DIMM    index=1

Verify WeatherStation:1 ConfigurationApplied Event
    [Tags]    eas
    Verify ConfigurationApplied    WeatherStation    index=1
