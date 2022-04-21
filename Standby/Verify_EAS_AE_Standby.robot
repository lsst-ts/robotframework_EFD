*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify DSM:1 Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    DSM:1    True

Verify DSM:1 SoftwareVersions
    [Tags]    eas_ae
    Verify SoftwareVersions    DSM    1

Verify DSM:1 SoftwareVersions timing
    [Tags]    eas_ae    timing
    Verify Time Delta    DSM    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify DSM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DSM    index=1

Verify DSM:2 Standby
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[standby]    DSM:2    True
    
Verify DSM:2 SoftwareVersions
    [Tags]    eas_ae
    Verify SoftwareVersions    DSM    2

Verify DSM:2 SoftwareVersions timing
    [Tags]    eas_ae    timing
    Verify Time Delta    DSM    logevent_summaryState    logevent_softwareVersions    ${time_window}    2

Verify DSM:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DSM    index=2
