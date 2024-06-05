*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    offline
Suite Setup    Set EFD Values

*** Variables ***
${offdet_topic}    logevent_offlineDetailedState
@{offdet_fields}    "private_sndStamp"    "substate"

*** Test Cases ***
#ATCamera
Verify ATCamera Offline
    [Tags]    latiss
    Verify Summary State    ${STATES}[offline]    ATCamera

Verify ATCamera SoftwareVersions
    [Tags]    latiss    software_versions
    Verify Software Versions    ATCamera

Verify ATCamera SoftwareVersions timing
    [Tags]    latiss    software_versions    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_softwareVersions

Verify ATCamera OfflineDetailedStates
    [Tags]    latiss    detailed_states
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
    Should Be Equal    ${first_event}[4]    1    # AVAILABLE
    Log Many    Second Substate: ${second_event}[4]
    Should Be Equal    ${second_event}[4]    2    # PUBLISH_ONLY

Verify ATCamera OfflineDetailedStates timing
    [Tags]    latiss    detailed_states    timing
    Verify Time Delta    ATCamera    logevent_summaryState   ${offdet_topic}

#BigCamera
Verify BigCamera Offline
    [Tags]    bigcamera
    Verify Summary State    ${STATES}[offline]    ${BigCamera}

Verify BigCamera SoftwareVersions
    [Tags]    bigcamera    software_versions
    Verify Software Versions    ${BigCamera}

Verify BigCamera SoftwareVersions timing
    [Tags]    bigcamera    software_versions    timing
    Verify Time Delta    ${BigCamera}    logevent_summaryState    logevent_softwareVersions

Verify BigCamera OfflineDetailedStates
    [Tags]    bigcamera
    Log Many    ${BigCamera}    ${offdet_topic}   ${offdet_fields}
    ${output}=    Get Recent Samples    ${BigCamera}    ${offdet_topic}   ${offdet_fields}    2
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
    Should Be Equal    ${first_event}[4]    1    # AVAILABLE
    Log    Second Substate: ${second_event}[4]
    Should Be Equal    ${second_event}[4]    2    # PUBLISH_ONLY

Verify BigCamera OfflineDetailedStates timing
    [Tags]    bigcamera    detailed_states    timing
    Verify Time Delta    ${BigCamera}    ${offdet_topic}    logevent_summaryState
