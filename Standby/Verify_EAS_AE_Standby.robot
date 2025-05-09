*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    standby

*** Variables ***
${dsm1_xmlver}    ${XMLVersion}
${dsm2_xmlver}    ${XMLVersion}
${weatherforecast_xmlver}    ${XMLVersion}

*** Test Cases ***
# DSM:1
Verify DSM:1 Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    DSM:1    auto_enable=True

Verify DSM:1 SoftwareVersions
    [Tags]    eas_ae    software_versions
    Verify Software Versions    DSM    index=1    csc_xmlver=${dsm1_xmlver}

Verify DSM:1 SoftwareVersions timing
    [Tags]    eas_ae    software_versions    timing
    Verify Time Delta    DSM:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DSM:1 ConfigurationsAvailable Event
    [Tags]    eas_ae    config_available
    Verify ConfigurationsAvailable    DSM    index=1

# DSM:2
Verify DSM:2 Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    DSM:2    auto_enable=True
    
Verify DSM:2 SoftwareVersions
    [Tags]    eas_ae    software_versions
    Verify Software Versions    DSM    index=2    csc_xmlver=${dsm2_xmlver}

Verify DSM:2 SoftwareVersions timing
    [Tags]    eas_ae    software_versions    timing
    Verify Time Delta    DSM:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DSM:2 ConfigurationsAvailable Event
    [Tags]    eas_ae    config_available
    Verify ConfigurationsAvailable    DSM    index=2

# WeatherForecast
Verify WeatherForecast Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    WeatherForecast    auto_enable=True

Verify WeatherForecast SoftwareVersions
    [Tags]    eas_ae    software_versions
    Verify Software Versions    WeatherForecast    csc_xmlver=${weatherforecast_xmlver}

Verify WeatherForecast SoftwareVersions timing
    [Tags]    eas_ae    software_versions    timing
    Verify Time Delta    WeatherForecast    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify WeatherForecast ConfigurationsAvailable Event
    [Tags]    eas_ae    config_available
    Verify ConfigurationsAvailable    WeatherForecast
