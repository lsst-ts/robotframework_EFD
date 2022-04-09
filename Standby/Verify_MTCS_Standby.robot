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

Verify MTMount ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTMount

Verify MTPtg Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTPtg

Verify MTDome Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTDome

Verify MTDome ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTDome

Verify MTDomeTrajectory Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTDomeTrajectory

Verify MTAOS Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTAOS

Verify MTAOS ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTAOS

Verify MTHexapod:1 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTHexapod:1

Verify MTHexapod:1 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTHexapod    1

Verify MTHexapod:2 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTHexapod:2

Verify MTHexapod:2 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTHexapod    2

Verify MTRotator Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTRotator

Verify MTRotator ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTRotator

Verify MTM1M3 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTM1M3

Verify MTM1M3 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTM1M3

Verify MTM2 Standby
    [Tags]    mtcs
    Verify Summary State    ${STATES}[standby]    MTM2

Verify MTM2 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    MTM2
