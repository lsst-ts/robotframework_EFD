*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    at_light_cal    skipped

*** Variables ***
${atmonochromator_salver}    ${SALVersion}
${atmonochromator_xmlver}    ${XMLVersion}
${fiberspectrograph_salver}    ${SALVersion}
${fiberspectrograph_xmlver}    ${XMLVersion}

*** Test Cases ***
#ATMonochromator
Verify ATMonochromator Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMonochromator

Verify ATMonochromator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    command_standby    logevent_summaryState

Verify ATMonochromator SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATMonochromator    csc_salver=${atmonochromator_salver}    csc_xmlver=${atmonochromator_xmlver}

Verify ATMonochromator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    command_standby    logevent_softwareVersions

Verify ATMonochromator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMonochromator

Verify ATMonochromator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATMonochromator    command_standby    logevent_configurationsAvailable

#FiberSpectrograph:3
Verify FiberSpectrograph:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    FiberSpectrograph:3
    
Verify FiberSpectrograph:3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    FiberSpectrograph:3    command_standby    logevent_summaryState

Verify FiberSpectrograph:3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    FiberSpectrograph    index=3    csc_salver=${fiberspectrograph_salver}    csc_xmlver=${fiberspectrograph_xmlver}

Verify FiberSpectrograph:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    command_standby    logevent_softwareVersions    index=3

Verify FiberSpectrograph:3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    FiberSpectrograph    index=3

Verify FiberSpectrograph:3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    FiberSpectrograph    command_standby    logevent_configurationsAvailable    index=3
