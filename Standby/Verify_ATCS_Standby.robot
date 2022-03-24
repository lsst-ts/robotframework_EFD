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
${swv_topic}    logevent_softwareVersions
@{swv_fields}    "private_sndStamp"    "cscVersion"    "openSpliceVersion"    "salVersion"   "xmlVersion"
${sv_topic}    logevent_settingVersions
@{sv_fields}    "private_sndStamp"    "recommendedSettingsLabels"    "recommendedSettingsVersion"    "settingsUrl"
${time_window}    10

*** Test Cases ***
Verify ATAOS Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATAOS
    ${ataos_standby_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATAOS
    Set Suite Variable    ${ataos_standby_event_time}

Verify ATAOS SettingVersions
    [Tags]    atcs
    Verify SettingVersions    ATAOS

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

Verify ATDome SettingVersions
    [Tags]    atcs
    Verify SettingVersions    ATDome

Verify ATDomeTrajectory Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory

Verify ATDomeTrajectory SettingVersions
    [Tags]    atcs
    Verify SettingVersions    ATDomeTrajectory

Verify ATHexapod Standby
    [Tags]    atcs
    Verify Summary State    ${STATES}[standby]    ATHexapod

Verify ATHexapod SettingVersions
    [Tags]    atcs
    Verify SettingVersions    ATHexapod

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

