*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    latiss

*** Variables ***
${atcamera_salver}    ${SALVersion}
${atcamera_xmlver}    ${XMLVersion}
${atheaderservice_salver}    ${SALVersion}
${atheaderservice_xmlver}    ${XMLVersion}
${ocps1_salver}    ${SALVersion}
${ocps1_xmlver}    ${XMLVersion}
${atoods_salver}    ${SALVersion}
${atoods_xmlver}    ${XMLVersion}
${atspectrograph_salver}    ${SALVersion}
${atspectrograph_xmlver}    ${XMLVersion}
${time_window}    10

*** Test Cases ***
#ATCamera
Verify ATCamera Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATCamera
    
Verify ATCamera SoftwareVersions
    [Tags]    latiss    software_versions
    Verify Software Versions    ATCamera    csc_salver=${atcamera_salver}    csc_xmlver=${atcamera_xmlver}

Verify ATCamera SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATCamera

Verify ATCamera ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#ATHeaderService
Verify ATHeaderService Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHeaderService

Verify ATHeaderService SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATHeaderService    csc_salver=${atheaderservice_salver}    csc_xmlver=${atheaderservice_xmlver}

Verify ATHeaderService SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHeaderService    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATHeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHeaderService

#OCPS:1
Verify OCPS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:1

Verify OCPS:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    OCPS    index=1    csc_salver=${ocps1_salver}    csc_xmlver=${ocps1_xmlver}

Verify OCPS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=1

Verify OCPS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    index=1

Verify OCPS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

#ATOODS
Verify ATOODS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATOODS

Verify ATOODS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATOODS      csc_salver=${atoods_salver}    csc_xmlver=${atoods_xmlver}

Verify ATOODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATOODS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATOODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATOODS

#ATSpectrograph
Verify ATSpectrograph Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATSpectrograph

Verify ATSpectrograph SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATSpectrograph    csc_salver=${atspectrograph_salver}    csc_xmlver=${atspectrograph_xmlver}

Verify ATSpectrograph SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATSpectrograph ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATSpectrograph

Verify ATSpectrograph ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    logevent_configurationsAvailable    ${time_window}
