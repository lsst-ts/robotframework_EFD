*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
#LaserTracker:1
Verify LaserTracker:1 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    LaserTracker:1

Verify LaserTracker:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LaserTracker    command_enable    logevent_summaryState    index=1

#MTAirCompressor:1
Verify MTAirCompressor:1 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTAirCompressor:1

Verify MTAirCompressor:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor    command_enable    logevent_summaryState    index=1

#MTAirCompressor:2
Verify MTAirCompressor:2 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTAirCompressor:2

Verify MTAirCompressor:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor    command_enable    logevent_summaryState    index=2

#MTMount
Verify MTMount Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTMount

Verify MTMount SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    command_enable    logevent_summaryState

#MTPtg
Verify MTPtg Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTPtg

Verify MTPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTPtg    command_enable    logevent_summaryState

#MTDome
Verify MTDome Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTDome

Verify MTDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    command_enable    logevent_summaryState

#MTDomeTrajectory
Verify MTDomeTrajectory Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTDomeTrajectory

Verify MTDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    command_enable    logevent_summaryState

#MTAOS
Verify MTAOS Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTAOS

Verify MTAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAOS    command_enable    logevent_summaryState

#MTHexapod:1
Verify MTHexapod:1 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTHexapod:1

Verify MTHexapod:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    command_enable    logevent_summaryState    index=1

#MTHexapod:2
Verify MTHexapod:2 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTHexapod:2

Verify MTHexapod:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    command_enable    logevent_summaryState    index=2

#MTRotator
Verify MTRotator Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTRotator

Verify MTRotator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    command_enable    logevent_summaryState

#MTM1M3
Verify MTM1M3 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTM1M3

Verify MTM1M3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    command_enable    logevent_summaryState

#MTM2
Verify MTM2 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTM2

Verify MTM2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    command_enable    logevent_summaryState
