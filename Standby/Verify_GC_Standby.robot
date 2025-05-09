*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    gc

*** Variables ***
${genericcamera_xmlver}    ${XMLVersion}
${gcheaderservice_xmlver}    ${XMLVersion}

*** Test Cases ***
# GenericCamera
Verify GenericCamera:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    GenericCamera:1

Verify GenericCamera:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    GenericCamera    index=1    csc_xmlver=${genericcamera_xmlver}

Verify GenericCamera:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    GenericCamera:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify GenericCamera:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    GenericCamera    index=1

Verify GenericCamera:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    GenericCamera:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# GCHeaderService
Verify GCHeaderService:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    GCHeaderService:1
 
Verify GCHeaderService:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    GCHeaderService    index=1    csc_xmlver=${gcheaderservice_xmlver}

Verify GCHeaderService:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    GCHeaderService:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify GCHeaderService:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    GCHeaderService    index=1
