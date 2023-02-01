*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    mtcs

*** Variables ***
${time_window}    10

*** Test Cases ***
#LaserTracker
Verify LaserTracker:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LaserTracker:1

Verify LaserTracker:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LaserTracker    index=1

Verify LaserTracker:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    LaserTracker    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

#MTAirCompressor:1
Verify MTAirCompressor:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAirCompressor:1    auto_enable=True

Verify MTAirCompressor:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAirCompressor    index=1

Verify MTAirCompressor:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTAirCompressor    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

#MTAirCompressor:2
Verify MTAirCompressor:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAirCompressor:2    auto_enable=True

Verify MTAirCompressor:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAirCompressor    index=2

Verify MTAirCompressor:2 ConfigurationApplied timing   
    [Tags]    config_applied    timing
    Verify Time Delta    MTAirCompressor    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

#MTMount
Verify MTMount Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTMount

Verify MTMount ConfigurationApplied Event 
    [Tags]    config_applied
    Verify ConfigurationApplied    MTMount

Verify MTMount ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTMount    logevent_summaryState    logevent_configurationApplied    ${time_window}

#MTPtg
Verify MTPtg Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTPtg

Verify MTPtg ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTPtg

#MTDome
Verify MTDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDome

Verify MTDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDome

Verify MTDome ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDome    logevent_summaryState    logevent_configurationApplied    ${time_window}

#MTDomeTrajectory
Verify MTDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDomeTrajectory    logevent_summaryState    logevent_configurationApplied    ${time_window}

#MTAOS
Verify MTAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAOS

Verify MTAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAOS

Verify MTAOS ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTAOS    logevent_summaryState    logevent_configurationApplied    ${time_window}

#MTHexapod:1
Verify MTHexapod:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1

Verify MTHexapod:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    index=1

Verify MTHexapod:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

#MTHexapod:2
Verify MTHexapod:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2

Verify MTHexapod:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    index=2

Verify MTHexapod:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=2

#MTRotator
Verify MTRotator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTRotator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTRotator

Verify MTRotator ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTRotator    logevent_summaryState    logevent_configurationApplied    ${time_window}

#MTM1M3
Verify MTM1M3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM1M3

Verify MTM1M3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM1M3

Verify MTM1M3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM1M3    logevent_summaryState    logevent_configurationApplied    ${time_window}

#MTM2
Verify MTM2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM2

Verify MTM2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM2

Verify MTM2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM2    logevent_summaryState    logevent_configurationApplied    ${time_window}
