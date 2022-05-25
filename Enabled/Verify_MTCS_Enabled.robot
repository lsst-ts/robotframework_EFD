*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify MTMount Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTMount

Verify MTPtg Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTPtg

Verify MTDome Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTDome

Verify MTDomeTrajectory Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTDomeTrajectory

Verify MTAOS Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTAOS

Verify MTHexapod:1 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTHexapod:1

Verify MTHexapod:2 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTHexapod:2

Verify MTRotator Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTRotator

Verify MTM1M3 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTM1M3

Verify MTM2 Enabled
    [Tags]    mtcs
    Verify Summary State    ${STATES}[enabled]    MTM2
