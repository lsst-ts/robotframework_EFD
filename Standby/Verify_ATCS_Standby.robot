*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby
Suite Setup    Log Many    ${STATES}[standby]

*** Variables ***

*** Test Cases ***
Verify ATAOS Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATAOS
    ${ataos_standby_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATAOS
    Set Suite Variable    ${ataos_standby_event_time}

Verify ATAOS ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATAOS

Verify ATAOS Standby timing
    [Tags]    atcs
    ${ataos_standby_event_time}=    Convert Time    ${ataos_standby_event_time}    number
    ${ataos_softwareversions_event_time}=    Convert Time    ${ataos_softwareversions_event_time}    number
    ${delta}=    Subtract Time from Time    ${ataos_standby_event_time}    ${ataos_softwareversions_event_time}
    ${delta}=    Subtract Time from Time    ${ataos_softwareversions_event_time}    ${ataos_standby_event_time}
    Should Be True    ${delta} < ${time_window}

Verify ATDome Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATDome

Verify ATDome ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATDome

Verify ATDomeTrajectory Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATDomeTrajectory

Verify ATHexapod Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATHexapod

Verify ATHexapod ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATHexapod

Verify ATMCS Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATMCS
    ${atmcs_standby_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATMCS
    Set Suite Variable    ${atmcs_standby_event_time}

Verify ATPneumatics Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATPneumatics
    ${atpneu_standby_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATPneumatics
    Set Suite Variable    ${atpnue_standby_event_time}

Verify ATPtg Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATPtg
    ${atptg_standby_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATPtg
    Set Suite Variable    ${atptg_standby_event_time}

