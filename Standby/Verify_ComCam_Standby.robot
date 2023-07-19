*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    comcam

*** Variables ***
${cccamera_salver}    ${SALVersion}
${cccamera_xmlver}    ${XMLVersion}
${ccoods_salver}    ${SALVersion}
${ccoods_xmlver}    ${XMLVersion}
${ccheaderservice_salver}    ${SALVersion}
${ccheaderservice_xmlver}    ${XMLVersion}
${time_window}    10

*** Test Cases ***
#CCCamera
Verify CCCamera Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CCCamera
    
Verify CCCamera SoftwareVersions
    [Tags]    comcam    software_versions
    Verify Software Versions    CCCamera    csc_salver=${cccamera_salver}    csc_xmlver=${cccamera_xmlver}

Verify CCCamera SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CCCamera    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify CCCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    CCCamera

Verify CCCamera ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    CCCamera    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#CCOODS
Verify CCOODS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CCOODS

Verify CCOODS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    CCOODS    csc_salver=${ccoods_salver}    csc_xmlver=${ccoods_xmlver}

Verify CCOODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CCOODS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify CCOODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    CCOODS

#CCHeaderService
Verify CCHeaderService Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CCHeaderService

Verify CCHeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    CCHeaderService

Verify CCHeaderService SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    CCHeaderService    csc_salver=${ccheaderservice_salver}    csc_xmlver=${ccheaderservice_xmlver}

Verify CCHeaderService SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CCHeaderService    logevent_summaryState    logevent_softwareVersions    ${time_window}
