*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***

*** Test Cases ***
Verify MTMount Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTMount

Verify MTPtg Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTPtg

Verify MTDome Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTDome

Verify MTDomeTrajectory Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTDomeTrajectory

Verify MTAOS Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTAOS

Verify MTHexapod:1 Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTHexapod:1

Verify MTHexapod:2 Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTHexapod:2

Verify MTRotator Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTRotator

Verify MTM1M3 Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTM1M3

Verify MTM2 Offline
    [Tags]    mtcs
    Verify Summary State    ${STATES}[offline]    MTM2
