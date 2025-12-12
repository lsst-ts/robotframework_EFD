# -*- coding: robot -*-
*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    maintel_csc_end_of_night


*** Test Cases ***
Execute MainTel CSC End of Night script
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_csc_end_of_night
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTCS CSCs Ending States
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[standby]     MTAOS
    Verify Summary State    ${STATES}[disabled]    MTDome
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2
    Verify Summary State    ${STATES}[enabled]     MTM1M3
    Verify Summary State    ${STATES}[enabled]     MTM2
    Verify Summary State    ${STATES}[disabled]    MTMount
    Verify Summary State    ${STATES}[enabled]     MTPtg
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTCamera CSCs Ending States
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[enabled]     MTCamera
    Verify Summary State    ${STATES}[enabled]     MTOODS
    Verify Summary State    ${STATES}[enabled]     MTHeaderService
