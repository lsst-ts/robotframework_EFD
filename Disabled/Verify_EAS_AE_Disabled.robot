*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    envsys_ae

*** Test Cases ***
#DSM:1
Verify DSM:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DSM:1    auto_enable=True

Verify DSM:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DSM    1

#DSM:2
Verify DSM:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DSM:2    auto_enable=True

Verify DSM:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DSM    2

#HVAC
Verify HVAC Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    HVAC    auto_enable=True

#WeatherForecast
Verify WeatherForecast Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    WeatherForecast    auto_enable=True

Verify WeatherForecast ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    WeatherForecast
