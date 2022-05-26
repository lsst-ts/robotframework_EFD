*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Library    DateTime
Force Tags    latiss

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATOODS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATOODS

Verify ATOODS SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATOODS  

Verify ATOODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATOODS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATOODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATOODS

Verify ATCamera Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATCamera
    
Verify ATCamera SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATCamera

Verify ATCamera SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATCamera

Verify ATCamera ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify ATHeaderService Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHeaderService

Verify ATHeaderService SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATHeaderService

Verify ATHeaderService SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHeaderService    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATHeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHeaderService

Verify ATSpectrograph Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATSpectrograph

Verify ATSpectrograph SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATSpectrograph

Verify ATSpectrograph SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATSpectrograph ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATSpectrograph

Verify ATSpectrograph ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    logevent_configurationsAvailable    ${time_window}
