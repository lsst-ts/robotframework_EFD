*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    mtcs

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify MTMount Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTMount

Verify MTMount ConfigurationApplied Event 
    [Tags]    config_applied
    Verify ConfigurationApplied    MTMount

Verify MTMount ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTMount    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify MTPtg Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTPtg

Verify MTPtg ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTPtg

Verify MTDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDome

Verify MTDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDome

Verify MTDome ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDome    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify MTDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDomeTrajectory    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify MTAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAOS

Verify MTAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAOS

Verify MTAOS ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTAOS    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify MTHexapod:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1

Verify MTHexapod:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    1

Verify MTHexapod:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_configurationApplied    ${time_window}    1

Verify MTHexapod:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2

Verify MTHexapod:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    2

Verify MTHexapod:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_configurationApplied    ${time_window}    2

Verify MTRotator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTRotator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTRotator

Verify MTRotator ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTRotator    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify MTM1M3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM1M3

Verify MTM1M3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM1M3

Verify MTM1M3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM1M3    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify MTM2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM2

Verify MTM2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM2

Verify MTM2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM2    logevent_summaryState    logevent_configurationApplied    ${time_window}
