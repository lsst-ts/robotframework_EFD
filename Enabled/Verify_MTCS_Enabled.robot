*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtcs

*** Variables ***

*** Test Cases ***
#LaserTracker:1
Verify LaserTracker:1 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    LaserTracker:1

Verify LaserTracker:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    LaserTracker:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTAirCompressor:1
Verify MTAirCompressor:1 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTAirCompressor:1

Verify MTAirCompressor:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTAirCompressor:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTAirCompressor:2
Verify MTAirCompressor:2 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTAirCompressor:2

Verify MTAirCompressor:2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTAirCompressor:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTMount
Verify MTMount Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTMount

Verify MTMount SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTMount    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTPtg
Verify MTPtg Enabled
    [Tags]    mtptg    enabled
    Verify Summary State    ${STATES}[enabled]    MTPtg

Verify MTPtg SummaryState timing
    [Tags]    mtptg    timing
    Verify Time Delta    MTPtg    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTDome
Verify MTDome Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTDome

Verify MTDome SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTDome    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTDomeTrajectory
Verify MTDomeTrajectory Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTDomeTrajectory

Verify MTDomeTrajectory SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTDomeTrajectory    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTAOS
Verify MTAOS Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTAOS

Verify MTAOS SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTAOS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTHexapod:1
Verify MTHexapod:1 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTHexapod:1

Verify MTHexapod:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTHexapod:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTHexapod:2
Verify MTHexapod:2 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTHexapod:2

Verify MTHexapod:2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTHexapod:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTRotator
Verify MTRotator Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTRotator

Verify MTRotator SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTRotator    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTM1M3
Verify MTM1M3 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTM1M3

Verify MTM1M3 SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTM1M3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTM2
Verify MTM2 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    MTM2

Verify MTM2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    MTM2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
