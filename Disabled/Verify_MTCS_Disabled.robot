*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify MTMount Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTMount

Verify MTPtg Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTPtg

Verify MTDome Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTDome

Verify MTDomeTrajectory Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory

Verify MTAOS Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTAOS

Verify MTHexapod:1 Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1

Verify MTHexapod:2 Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2

Verify MTRotator Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTM1M3 Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTM1M3

Verify MTM2 Disabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[disabled]    MTM2
