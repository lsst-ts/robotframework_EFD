# -*- coding: robot -*-
*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    auxtel_enable_atcs

*** Variables ***
@{states_expected}      8
${time_window}          10

*** Test Cases ***
Execute AuxTel Enable ATCS
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    auxtel_enable_atcs
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify AuxTel CSCs Enabled
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[enabled]    ATMCS
    Verify Summary State    ${STATES}[enabled]    ATPtg
    Verify Summary State    ${STATES}[enabled]    ATDome
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory
    Verify Summary State    ${STATES}[enabled]    ATAOS
    Verify Summary State    ${STATES}[enabled]    ATPneumatics
    Verify Summary State    ${STATES}[enabled]    ATHexapod
