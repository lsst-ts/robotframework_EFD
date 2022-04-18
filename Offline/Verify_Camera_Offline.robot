*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***
${offdet_topic}    logevent_offlineDetailedState
@{offdet_fields}    "private_sndStamp"    "substate"
${time_window}    10

*** Test Cases ***
Verify ATCamera Offline
    [Tags]    latiss
    Verify Summary State    ${STATES}[offline]    ATCamera

Verify ATCamera OfflineDetailedStates
    [Tags]    comcam    detailed_states
    Log Many    ATCamera    ${offdet_topic}   ${offdet_fields}
    ${output}=    Get Recent Samples    ATCamera    ${offdet_topic}   ${offdet_fields}    2
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${first}=    Get Line    ${output}    1
    @{first_event}=    Split String    ${first}
    Log Many    ${first_event}
    ${second}=    Get Line    ${output}    2
    @{second_event}=    Split String    ${second}
    Log Many    ${second_event}
    Log Many    First Substate: ${first_event}[4]
    Should Be Equal    ${first_event}[4]    1
    Log Many    Second Substate: ${second_event}[4]
    Should Be Equal    ${second_event}[4]    2

Verify ATCamera OfflineDetailedStates timing
    [Tags]    latiss    detailed_states    timing
    Verify Time Delta    ATCamera    logevent_summaryState    ${offdet_topic}    ${time_window}

Verify CCCamera Offline
    [Tags]    comcam
    Verify Summary State    ${STATES}[offline]    CCCamera

Verify CCCamera OfflineDetailedStates
    [Tags]    comcam
    Log Many    CCCamera    ${offdet_topic}   ${offdet_fields}
    ${output}=    Get Recent Samples    CCCamera    ${offdet_topic}   ${offdet_fields}    2
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${first}=    Get Line    ${output}    1
    @{first_event}=    Split String    ${first}
    Log Many    ${first_event}
    ${second}=    Get Line    ${output}    2
    @{second_event}=    Split String    ${second}
    Log Many    ${second_event}
    Log    First Substate: ${first_event}[4]
    Should Be Equal    ${first_event}[4]    1
    Log    Second Substate: ${second_event}[4]
    Should Be Equal    ${second_event}[4]    2

Verify CCCamera OfflineDetailedStates timing
    [Tags]    comcam    detailed_states    timing
    Verify Time Delta    CCCamera    logevent_summaryState    ${offdet_topic}    ${time_window}
