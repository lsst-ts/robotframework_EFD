*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify ATAOS Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATAOS

Verify ATDome Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATDome

Verify ATDomeTrajectory Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory

Verify ATHexapod Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATHexapod

Verify ATMCS Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATMCS

Verify ATPneumatics Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATPneumatics

Verify ATPtg Enabled
    [Tags]    atcs
    Verify Summary State    ${STATES}[enabled]    ATPtg
