*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    comcam

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify CCOODS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CCOODS

Verify CCOODS SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    CCOODS

Verify CCOODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CCOODS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify CCOODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    CCOODS

Verify CCCamera Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CCCamera
    
Verify CCCamera SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    CCCamera

Verify CCCamera SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CCCamera    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify CCCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    CCCamera

Verify CCCamera ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    CCCamera    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify CCHeaderService Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CCHeaderService

Verify CCHeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify CCHeaderService    CCCamera

Verify CCHeaderService SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    CCHeaderService

Verify CCHeaderService SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CCHeaderService    logevent_summaryState    logevent_softwareVersions    ${time_window}
