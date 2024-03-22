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
    Verify Time Delta    ATAOS    command_enable    logevent_summaryState

#ATDome
Verify ATDome Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDome

Verify ATDome SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATDome    command_enable    logevent_summaryState

#ATDomeTrajectory
Verify ATDomeTrajectory Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory

Verify ATDomeTrajectory SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATDomeTrajectory    command_enable    logevent_summaryState

#ATHexapod
Verify ATHexapod Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATHexapod

Verify ATHexapod SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATHexapod    command_enable    logevent_summaryState

#ATMCS
Verify ATMCS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATMCS

Verify ATMCS SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATMCS    command_enable    logevent_summaryState

#ATPneumatics
Verify ATPneumatics Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPneumatics

Verify ATPneumatics SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATPneumatics    command_enable    logevent_summaryState

#ATPtg
Verify ATPtg Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPtg

Verify ATPtg SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATPtg    command_enable    logevent_summaryState
