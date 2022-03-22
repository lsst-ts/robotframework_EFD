*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***

*** Test Cases ***
Verify MTMount Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTMount

Verify MTPtg Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTPtg

Verify MTDome Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTDome

Verify MTDomeTrajectory Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTDomeTrajectory

Verify MTAOS Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTAOS

Verify MTHexapod:1 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTHexapod:1

Verify MTHexapod:2 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTHexapod:2

Verify MTRotator Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTRotator

Verify MTM1M3 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTM1M3

Verify MTM2 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTM2
