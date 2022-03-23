*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify ATAOS Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATAOS

Verify ATDome Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATDome

Verify ATDomeTrajectory Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATDomeTrajectory

Verify ATHexapod Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATHexapod

Verify ATMCS Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATMCS

Verify ATPneumatics Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATPneumatics

Verify ATPtg Disabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[disabled]    ATPtg
