*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    atcs

*** Test Cases ***
#ATAOS
Verify ATAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATAOS

Verify ATAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    command_disable    logevent_summaryState

Verify ATAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATAOS

Verify ATAOS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATAOS    command_disable    logevent_configurationApplied

#ATDome
Verify ATDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDome

Verify ATDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    command_disable    logevent_summaryState

Verify ATDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATDome

Verify ATDome ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATDome    command_disable    logevent_configurationApplied

#ATDomeTrajectory
Verify ATDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDomeTrajectory

Verify ATDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    command_disable    logevent_summaryState

Verify ATDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATDomeTrajectory    command_disable    logevent_configurationApplied

#ATHexapod
Verify ATHexapod Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATHexapod

Verify ATHexapod SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    command_disable    logevent_summaryState

Verify ATHexapod ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATHexapod

Verify ATHexapod ConfigurationApplied Event timing 
    [Tags]    config_applied    timing
    Verify Time Delta    ATHexapod    command_disable    logevent_configurationApplied

#ATMCS
Verify ATMCS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATMCS

Verify ATMCS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    command_disable    logevent_summaryState
    
Verify ATMCS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATMCS

Verify ATMCS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATMCS    command_disable    logevent_configurationApplied

#ATPneumatics
Verify ATPneumatics Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATPneumatics

Verify ATPneumatics SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    command_disable    logevent_summaryState
    
Verify ATPneumatics ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATPneumatics

Verify ATPneumatics ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATPneumatics    command_disable    logevent_configurationApplied

#ATPtg
Verify ATPtg Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATPtg

Verify ATPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    command_disable    logevent_summaryState
    
Verify ATPtg ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATPtg

Verify ATPtg ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATPtg    command_disable    logevent_configurationApplied
