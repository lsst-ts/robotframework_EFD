*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    standby
Suite Setup   Set EFD Values

*** Variables ***
${cccamera_xmlver}    ${XMLVersion}
${ccoods_xmlver}    ${XMLVersion}
${ccheaderservice_xmlver}    ${XMLVersion}
${mtcamera_xmlver}    ${XMLVersion}
${mtoods_xmlver}    ${XMLVersion}
${mtheaderservice_xmlver}    ${XMLVersion}
${ocps2_xmlver}    ${XMLVersion}
${ocps3_xmlver}    ${XMLVersion}

*** Test Cases ***
#BigCamera
Verify BigCamera Standby
    [Tags]
    Set Tags    ${BigCamera}
    Verify Summary State    ${STATES}[standby]    ${BigCamera}
    
Verify BigCamera SoftwareVersions Event
    [Tags]    software_versions
    Set Tags    ${BigCamera}
    Verify Software Versions    ${BigCamera}    csc_xmlver=${camera_xmlver}

Verify BigCamera SoftwareVersions Event timing
    [Tags]    software_versions    timing
    Set Tags    ${BigCamera}
    Verify Time Delta    ${BigCamera}    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify BigCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Set Tags    ${BigCamera}
    Verify ConfigurationsAvailable    ${BigCamera}

Verify BigCamera ConfigurationsAvailable Event timing
    [Tags]    config_available    timing
    Set Tags    ${BigCamera}
    Verify Time Delta    ${BigCamera}    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#OODS
Verify OODS Standby
    [Tags]
    Set Tags    ${OODS}
    Verify Summary State    ${STATES}[standby]    ${OODS}

Verify OODS SoftwareVersions
    [Tags]    software_versions
    Set Tags    ${OODS}
    Verify Software Versions    ${OODS}    csc_xmlver=${oods_xmlver}

Verify OODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Set Tags    ${OODS}
    Verify Time Delta    ${OODS}    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify OODS ConfigurationsAvailable Event
    [Tags]    config_available
    Set Tags    ${OODS}
    Verify ConfigurationsAvailable    ${OODS}

#HeaderService
Verify HeaderService Standby
    [Tags]
    Set Tags    ${HeaderService}
    Verify Summary State    ${STATES}[standby]    ${HeaderService}

Verify HeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Set Tags    ${HeaderService}
    Verify ConfigurationsAvailable    ${HeaderService}

Verify HeaderService SoftwareVersions
    [Tags]    software_versions
    Set Tags    ${HeaderService}
    Verify Software Versions    ${HeaderService}    csc_xmlver=${headerservice_xmlver}

Verify HeaderService SoftwareVersions Event timing
    [Tags]    software_versions    timing
    Set Tags    ${HeaderService}
    Verify Time Delta    ${HeaderService}    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#OCPS:2||3
Verify OCPS:2||3 Standby
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    Verify Summary State    ${STATES}[standby]    OCPS:${OcpsIndex}

Verify OCPS:2||3 SoftwareVersions
    [Tags]    software_versions
    Set Tags    OCPS:${OcpsIndex}
    Verify SoftwareVersions    OCPS    index=${OcpsIndex}    csc_xmlver=${ocps_xmlver}

Verify OCPS:2||3 SoftwareVersions Event timing
    [Tags]    software_versions    timing
    Set Tags    OCPS:${OcpsIndex}
    Verify Time Delta    OCPS:${OcpsIndex}    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify OCPS:2||3 ConfigurationsAvailable Event
    [Tags]    config_available
    Set Tags    OCPS:${OcpsIndex}
    Verify ConfigurationsAvailable    OCPS    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationsAvailable Event timing
    [Tags]    config_available    timing
    Set Tags    OCPS:${OcpsIndex}
    Verify Time Delta    OCPS:${OcpsIndex}    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
