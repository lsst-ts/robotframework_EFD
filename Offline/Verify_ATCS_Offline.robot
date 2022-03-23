*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline
Suite Setup    Log Many    ${STATES}[offline]

*** Variables ***
${swv_topic}    logevent_softwareVersions
@{swv_fields}    "private_sndStamp"    "cscVersion"    "openSpliceVersion"    "salVersion"   "xmlVersion"
${sv_topic}    logevent_settingVersions
@{sv_fields}    "private_sndStamp"    "recommendedSettingsLabels"    "recommendedSettingsVersion"    "settingsUrl"
${time_window}    10

*** Test Cases ***
Verify ATAOS Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATAOS
    ${ataos_offline_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATAOS
    Set Suite Variable    ${ataos_offline_event_time}

Verify ATAOS SettingVersions
    [Tags]    obsys1
    ${output}=    Get Recent Samples    ATAOS    ${sv_topic}   ${sv_fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${line}=    Get Line    ${output}    1
    @{words}=    Split String    ${line}
    Log Many    ${words}    
    @{time}=    Split String    ${words}[3]    +
    Set Suite Variable    ${ataos_settingseversions_event_time}    ${time}[0]
    Should Not Be Empty    ${words}[4]
    Should Not Be Empty    ${words}[5]
    Should Not Be Empty    ${words}[6]

Verify ATAOS Offline timing
    [Tags]    obsys1
    ${ataos_offline_event_time}=    Convert Time    ${ataos_offline_event_time}    number
    ${ataos_softwareversions_event_time}=    Convert Time    ${ataos_softwareversions_event_time}    number
    ${delta}=    Subtract Time from Time    ${ataos_offline_event_time}    ${ataos_softwareversions_event_time}
    ${delta}=    Subtract Time from Time    ${ataos_softwareversions_event_time}    ${ataos_offline_event_time}
    Should Be True    ${delta} < ${time_window}

Verify ATDome Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATDome

Verify ATDomeTrajectory Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATDomeTrajectory

Verify ATHexapod Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATHexapod

Verify ATMCS Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATMCS
    ${atmcs_offline_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATMCS
    Set Suite Variable    ${atmcs_offline_event_time}

Verify ATPneumatics Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATPneumatics
    ${atpneu_offline_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATPneumatics
    Set Suite Variable    ${atpnue_offline_event_time}

Verify ATPtg Offline
    [Tags]    atcs
    Verify Summary State    ${STATES}[offline]    ATPtg
    ${atptg_offline_event_time}=    Get Topic Sent Time    "logevent_SummaryState"    ATPtg
    Set Suite Variable    ${atptg_offline_event_time}

