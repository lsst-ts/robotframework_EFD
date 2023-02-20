*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    eas

*** Variables ***
${time_window}    10

*** Test Cases ***
# DIMM
Verify DIMM:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    DIMM    1

Verify DIMM:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify DIMM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    1

Verify DIMM:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

# WeatherStation
Verify WeatherStation:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    WeatherStation:1
 
Verify WeatherStation:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    WeatherStation    1

Verify WeatherStation:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    WeatherStation    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify WeatherStation:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    WeatherStation    1

Verify WeatherStation:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    WeatherStation    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1
