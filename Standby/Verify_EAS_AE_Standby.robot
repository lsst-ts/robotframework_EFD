*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    standby

*** Variables ***
${time_window}    10

*** Test Cases ***
# DSM:1
Verify DSM:1 Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    DSM:1    auto_enable=True

Verify DSM:1 SoftwareVersions
    [Tags]    eas_ae    software_versions
    Verify SoftwareVersions    DSM    1

Verify DSM:1 SoftwareVersions timing
    [Tags]    eas_ae    software_versions    timing
    Verify Time Delta    DSM    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify DSM:1 ConfigurationsAvailable Event
    [Tags]    eas_ae    config_available
    Verify ConfigurationsAvailable    DSM    index=1

# DSM:2
Verify DSM:2 Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    DSM:2    auto_enable=True
    
Verify DSM:2 SoftwareVersions
    [Tags]    eas_ae    software_versions
    Verify SoftwareVersions    DSM    2

Verify DSM:2 SoftwareVersions timing
    [Tags]    eas_ae    software_versions    timing
    Verify Time Delta    DSM    logevent_summaryState    logevent_softwareVersions    ${time_window}    2

Verify DSM:2 ConfigurationsAvailable Event
    [Tags]    eas_ae    config_available
    Verify ConfigurationsAvailable    DSM    index=2

# WeatherForecast
Verify WeatherForecast Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    WeatherForecast    auto_enable=True

Verify WeatherForecast SoftwareVersions
    [Tags]    eas_ae    software_versions
    Verify SoftwareVersions    WeatherForecast

Verify WeatherForecast SoftwareVersions timing
    [Tags]    eas_ae    software_versions    timing
    Verify Time Delta    WeatherForecast    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify WeatherForecast ConfigurationsAvailable Event
    [Tags]    eas_ae    config_available
    Verify ConfigurationsAvailable    WeatherForecast
