*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    latiss

*** Variables ***
${atcamera_xmlver}    ${XMLVersion}
${atheaderservice_xmlver}    ${XMLVersion}
${ocps1_xmlver}    ${XMLVersion}
${atoods_xmlver}    ${XMLVersion}
${atspectrograph_xmlver}    ${XMLVersion}

*** Test Cases ***
#ATCamera
Verify ATCamera Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATCamera
    
Verify ATCamera SoftwareVersions
    [Tags]    latiss    software_versions
    Verify Software Versions    ATCamera    csc_xmlver=${atcamera_xmlver}

Verify ATCamera SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATCamera    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATCamera

Verify ATCamera ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATCamera    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATOODS
Verify ATOODS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATOODS

Verify ATOODS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATOODS      csc_xmlver=${atoods_xmlver}

Verify ATOODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATOODS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATOODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATOODS

#ATHeaderService
Verify ATHeaderService Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHeaderService

Verify ATHeaderService SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATHeaderService    csc_xmlver=${atheaderservice_xmlver}

Verify ATHeaderService SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHeaderService    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATHeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHeaderService

#OCPS:1
Verify OCPS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:1

Verify OCPS:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    OCPS    index=1    csc_xmlver=${ocps1_xmlver}

Verify OCPS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify OCPS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    index=1

Verify OCPS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATSpectrograph
Verify ATSpectrograph Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATSpectrograph

Verify ATSpectrograph SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATSpectrograph    csc_xmlver=${atspectrograph_xmlver}

Verify ATSpectrograph SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATSpectrograph    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATSpectrograph ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATSpectrograph

Verify ATSpectrograph ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATSpectrograph    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
