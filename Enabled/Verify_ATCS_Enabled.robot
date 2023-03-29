*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    atcs

*** Variables ***

*** Test Cases ***
Verify ATAOS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATAOS

Verify ATDome Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDome

Verify ATDomeTrajectory Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory

Verify ATHexapod Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATHexapod

Verify ATMCS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATMCS

Verify ATPneumatics Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPneumatics

Verify ATPtg Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ATPtg
