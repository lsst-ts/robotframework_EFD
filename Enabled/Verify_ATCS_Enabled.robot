*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    atcs

*** Variables ***

*** Test Cases ***
#ATAOS
Verify ATAOS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATAOS

Verify ATAOS SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATAOS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATDome
Verify ATDome Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDome

Verify ATDome SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATDome    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATDomeTrajectory
Verify ATDomeTrajectory Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory

Verify ATDomeTrajectory SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATHexapod
Verify ATHexapod Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATHexapod

Verify ATHexapod SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATMCS
Verify ATMCS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATMCS

Verify ATMCS SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATMCS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATPneumatics
Verify ATPneumatics Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPneumatics

Verify ATPneumatics SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATPneumatics    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATPtg
Verify ATPtg Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPtg

Verify ATPtg SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATPtg    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
