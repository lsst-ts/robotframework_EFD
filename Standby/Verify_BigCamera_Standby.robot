*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    standby    bigcamera
Suite Setup   Set EFD Values

*** Variables ***
${cccamera_salver}    ${SALVersion}
${cccamera_xmlver}    ${XMLVersion}
${ccoods_salver}    ${SALVersion}
${ccoods_xmlver}    ${XMLVersion}
${ccheaderservice_salver}    ${SALVersion}
${ccheaderservice_xmlver}    ${XMLVersion}
${mtcamera_salver}    ${SALVersion}
${mtcamera_xmlver}    ${XMLVersion}
${mtoods_salver}    ${SALVersion}
${mtoods_xmlver}    ${XMLVersion}
${mtheaderservice_salver}    ${SALVersion}
${mtheaderservice_xmlver}    ${XMLVersion}
${ocps2_salver}    ${SALVersion}
${ocps2_xmlver}    ${XMLVersion}
${ocps3_salver}    ${SALVersion}
${ocps3_xmlver}    ${XMLVersion}

*** Test Cases ***
#BigCamera
Verify BigCamera Standby
    [Tags]
    Verify Summary State    ${STATES}[standby]    ${BigCamera}
    
Verify BigCamera SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${BigCamera}    command_standby    logevent_summaryState

Verify BigCamera SoftwareVersions Event
    [Tags]    software_versions
    Verify Software Versions    ${BigCamera}    csc_salver=${camera_salver}    csc_xmlver=${camera_xmlver}

Verify BigCamera SoftwareVersions Event timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${BigCamera}    command_standby    logevent_softwareVersions

Verify BigCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ${BigCamera}

Verify BigCamera ConfigurationsAvailable Event timing
    [Tags]    config_available    timing
    Verify Time Delta    ${BigCamera}    command_standby    logevent_configurationsAvailable

#OODS
Verify OODS Standby
    [Tags]
    Verify Summary State    ${STATES}[standby]    ${OODS}

Verify OODS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${OODS}    command_standby    logevent_summaryState

Verify OODS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ${OODS}    csc_salver=${oods_salver}    csc_xmlver=${oods_xmlver}

Verify OODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${OODS}    command_standby    logevent_softwareVersions

Verify OODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ${OODS}

#HeaderService
Verify HeaderService Standby
    [Tags]
    Verify Summary State    ${STATES}[standby]    ${HeaderService}

Verify HeaderService SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${HeaderService}    command_standby    logevent_summaryState

Verify HeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ${HeaderService}

Verify HeaderService SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ${HeaderService}    csc_salver=${headerservice_salver}    csc_xmlver=${headerservice_xmlver}

Verify HeaderService SoftwareVersions Event timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${HeaderService}    command_standby    logevent_softwareVersions

#OCPS:2||3
Verify OCPS:2||3 Standby
    [Tags]
    Verify Summary State    ${STATES}[standby]    OCPS:${OcpsIndex}

Verify OCPS:2||3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    command_standby    logevent_summaryState    index=${OcpsIndex}

Verify OCPS:2||3 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    OCPS    index=${OcpsIndex}    csc_salver=${ocps_salver}    csc_xmlver=${ocps_xmlver}

Verify OCPS:2||3 SoftwareVersions Event timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    command_standby    logevent_softwareVersions    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationsAvailable Event timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS    command_standby    logevent_configurationsAvailable    index=${OcpsIndex}
