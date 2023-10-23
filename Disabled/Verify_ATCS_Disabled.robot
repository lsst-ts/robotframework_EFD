*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    atcs

*** Test Cases ***
Verify ATAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATAOS

Verify ATAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATAOS

Verify ATAOS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATAOS    logevent_summaryState    logevent_configurationApplied

Verify ATDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDome

Verify ATDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATDome

Verify ATDome ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATDome    logevent_summaryState    logevent_configurationApplied

Verify ATDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    logevent_configurationApplied

Verify ATHexapod Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATHexapod

Verify ATHexapod ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATHexapod

Verify ATHexapod ConfigurationApplied Event timing 
    [Tags]    config_applied    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    logevent_configurationApplied

Verify ATMCS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATMCS

Verify ATMCS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATMCS

Verify ATPneumatics Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATPneumatics

Verify ATPneumatics ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATPneumatics

Verify ATPtg Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATPtg

Verify ATPtg ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATPtg
