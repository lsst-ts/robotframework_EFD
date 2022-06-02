*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Library     DateTime
Force Tags    obsys2

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify Scheduler:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 SoftwareVersions
    [Tags]    software_versions 
    Verify SoftwareVersions    Scheduler    1

Verify Scheduler:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify Scheduler:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    1

Verify Scheduler:1 ConfigurationsAvailable timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

Verify Scheduler:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 SoftwareVersions
    [Tags]    software_versions 
    Verify SoftwareVersions    Scheduler    2

Verify Scheduler:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_softwareVersions    ${time_window}    2

Verify Scheduler:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    2

Verify Scheduler:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    2

Verify OCPS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:1

Verify OCPS:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    OCPS    1

Verify OCPS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify OCPS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    1

Verify OCPS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

Verify OCPS:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:2

Verify OCPS:2 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    OCPS    2

Verify OCPS:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_softwareVersions    ${time_window}    2

Verify OCPS:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    2

Verify OCPS:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    2
