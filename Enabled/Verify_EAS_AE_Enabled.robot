*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
#DSM:1
Verify DSM:1 Enabled
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[enabled]    DSM:1

Verify DSM:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DSM    command_enabled    logevent_summaryState    index=1

#DSM:2
Verify DSM:2 Enabled
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[enabled]    DSM:2

Verify DSM:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DSM    command_enabled    logevent_summaryState    index=2

#WeatherForecast
Verify WeatherForecast Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    WeatherForecast

Verify WeatherForecast SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    WeatherForecast    command_enabled    logevent_summaryState
