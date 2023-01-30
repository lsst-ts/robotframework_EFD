*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    gc

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify GenericCamera:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    GenericCamera:1

Verify GenericCamera:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    GenericCamera    1

Verify GenericCamera:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    GenericCamera    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify GenericCamera:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    GenericCamera    1

Verify GenericCamera:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    GenericCamera    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

Verify GCHeaderService:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    GCHeaderService:1
 
Verify GCHeaderService:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    GCHeaderService    1

Verify GCHeaderService:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    GCHeaderService    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify GCHeaderService:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    GCHeaderService    1
