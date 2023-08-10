*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obsys2

*** Variables ***
${scheduler1_salver}    ${SALVersion}
${scheduler1_xmlver}    ${XMLVersion}
${scheduler2_salver}    ${SALVersion}
${scheduler2_xmlver}    ${XMLVersion}
${time_window}    10

*** Test Cases ***
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

#Scheduler:1
Verify Scheduler:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 SoftwareVersions
    [Tags]    software_versions 
    Verify Software Versions    Scheduler    index=1    csc_salver=${scheduler1_salver}    csc_xmlver=${scheduler1_xmlver}

Verify Scheduler:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=1

Verify Scheduler:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    index=1

Verify Scheduler:1 ConfigurationsAvailable timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=1

#Scheduler:2
Verify Scheduler:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 SoftwareVersions
    [Tags]    software_versions 
    Verify Software Versions    Scheduler    index=2    csc_salver=${scheduler2_salver}    csc_xmlver=${scheduler2_xmlver}

Verify Scheduler:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=2

Verify Scheduler:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    index=2

Verify Scheduler:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=2
