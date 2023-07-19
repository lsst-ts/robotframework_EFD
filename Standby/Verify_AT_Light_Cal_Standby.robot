*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    at_light_cal    skipped

*** Variables ***
${atmonochromator_salver}    ${SALVersion}
${atmonochromator_xmlver}    ${XMLVersion}
${fiberspectrograph_salver}    ${SALVersion}
${fiberspectrograph_xmlver}    ${XMLVersion}
${time_window}    10

*** Test Cases ***
#ATMonochromator
Verify ATMonochromator Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMonochromator

Verify ATMonochromator SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATMonochromator    csc_salver=${atmonochromator_salver}    csc_xmlver=${atmonochromator_xmlver}

Verify ATMonochromator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATMonochromator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMonochromator

Verify ATMonochromator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#FiberSpectrograph:3
Verify FiberSpectrograph:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    FiberSpectrograph:3
    
Verify FiberSpectrograph:3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    FiberSpectrograph    index=3    csc_salver=${fiberspectrograph_salver}    csc_xmlver=${fiberspectrograph_xmlver}

Verify FiberSpectrograph:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    logevent_softwareVersions    ${time_window}    3

Verify FiberSpectrograph:3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    FiberSpectrograph    3

Verify FiberSpectrograph:3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    FiberSpectrograph    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    3
