*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify MTMount ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTMount

Verify MTPtg ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTPtg

Verify MTDome ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTDome

Verify MTDomeTrajectory ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTDomeTrajectory

Verify MTAOS ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTAOS

Verify MTHexapod:1 ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTHexapod    index=1

Verify MTHexapod:2 ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTHexapod    index=2

Verify MTRotator ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTRotator

Verify MTM1M3 ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTM1M3

Verify MTM2 ConfigurationApplied Event
    [Tags]    mtcs
    Verify ConfigurationApplied    MTM2
