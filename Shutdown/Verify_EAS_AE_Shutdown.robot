*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Test Cases ***
Verify DSM:1 Shutdown
    [Tags]    eas_ae
    Verify Shutdown Process    DSM    index=1

Verify DSM:2 Shutdown
    [Tags]    eas_ae
    Verify Shutdown Process    DSM    index=2

Verify WeatherForecast Shutdown
    [Tags]    eas
    Verify Shutdown Process    WeatherForecast
