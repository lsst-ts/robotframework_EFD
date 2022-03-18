*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***
${offdet_topic}    logevent_offlineDetailedState
@{offdet_fields}    "private_sndStamp"    "substate"

*** Test Cases ***
Verify ATArchiver Offline
    [Tags]    latiss
    Verify Summary State    ${STATES}[offline]    ATArchiver

Verify ATArchiver SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATArchiver

Verify ATCamera Offline
    [Tags]    latiss
    Verify Summary State    ${STATES}[offline]    ATCamera

Verify ATCamera OfflineDetailedStates
    [Tags]    comcam
    Log Many    ATCamera    ${offdet_topic}   ${offdet_fields}
    ${output}=    Get Recent Samples    ATCamera    ${offdet_topic}   ${offdet_fields}    2
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${first}=    Get Line    ${output}    1
    @{first_event}=    Split String    ${first}
    Log Many    ${first_event}
    @{first_event_time}=    Split String    ${first_event}[3]    +
    ${second}=    Get Line    ${output}    2
    @{second_event}=    Split String    ${second}
    Log Many    ${second_event}
    @{second_event_time}=    Split String    ${second_event}[3]    +
    Set Suite Variable    ${cccamera_first_event_time}    ${first_event_time}[0]
    Set Suite Variable    ${cccamera_second_event_time}    ${second_event_time}[0]
    Log Many    First Substate: ${first_event}[4]
    Should Not Be Empty    ${first_event}[4]
    Log Many    Second Substate: ${second_event}[4]
    Should Not Be Empty    ${second_event}[4]

Verify ATHeaderService Offline
    [Tags]    latiss
    Verify Summary State    ${STATES}[offline]    ATHeaderService

Verify ATHeaderService SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATHeaderService

Verify ATSpectrograph Offline
    [Tags]    latiss
    Verify Summary State    ${STATES}[offline]    ATSpectrograph

Verify ATSpectrograph SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATSpectrograph
