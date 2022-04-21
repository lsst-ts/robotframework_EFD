*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    at_light_cal    skipped

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATMonochromator Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMonochromator

Verify ATMonochromator SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATMonochromator

Verify ATMonochromator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATMonochromator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMonochromator

Verify ATMonochromator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify FiberSpectrograph:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    FiberSpectrograph:3
    
Verify FiberSpectrograph:3 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    FiberSpectrograph    3

Verify FiberSpectrograph:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_softwareVersions    ${time_window}    3

Verify FiberSpectrograph:3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    FiberSpectrograph    3

Verify FiberSpectrograph:3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    FiberSpectrograph    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    3
