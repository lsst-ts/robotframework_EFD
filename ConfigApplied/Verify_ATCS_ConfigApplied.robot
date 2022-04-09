*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify ATAOS ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATAOS

Verify ATDome ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATDome

Verify ATDomeTrajectory ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATDomeTrajectory

Verify ATHexapod ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATHexapod

Verify ATMCS ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATMCS

Verify ATPneumatics ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATPneumatics

Verify ATPtg ConfigurationApplied Event
    [Tags]    atcs
    Verify ConfigurationApplied    ATPtg
