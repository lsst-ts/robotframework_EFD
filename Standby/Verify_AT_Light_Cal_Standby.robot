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

Verify ATMonochromator SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATMonochromator    csc_salver=${atmonochromator_salver}    csc_xmlver=${atmonochromator_xmlver}

Verify ATMonochromator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATMonochromator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMonochromator

Verify ATMonochromator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATMonochromator    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#FiberSpectrograph:3
Verify FiberSpectrograph:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    FiberSpectrograph:3
    
Verify FiberSpectrograph:3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    FiberSpectrograph    index=3    csc_salver=${fiberspectrograph_salver}    csc_xmlver=${fiberspectrograph_xmlver}

Verify FiberSpectrograph:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator:3    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify FiberSpectrograph:3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    FiberSpectrograph    index=3

Verify FiberSpectrograph:3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    FiberSpectrograph:3    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
