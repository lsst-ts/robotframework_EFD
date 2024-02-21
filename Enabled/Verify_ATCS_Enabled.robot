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
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    command_enabled    logevent_summaryState

#ATDome
Verify ATDome Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDome

Verify ATDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    command_enabled    logevent_summaryState

#ATDomeTrajectory
Verify ATDomeTrajectory Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory

Verify ATDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    command_enabled    logevent_summaryState

#ATHexapod
Verify ATHexapod Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATHexapod

Verify ATHexapod SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    command_enabled    logevent_summaryState

#ATMCS
Verify ATMCS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATMCS

Verify ATMCS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    command_enabled    logevent_summaryState

#ATPneumatics
Verify ATPneumatics Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPneumatics

Verify ATPneumatics SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    command_enabled    logevent_summaryState

#ATPtg
Verify ATPtg Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPtg

Verify ATPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    command_enabled    logevent_summaryState
