*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtcs

*** Test Cases ***
#LaserTracker
Verify LaserTracker:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LaserTracker:1

Verify LaserTracker:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LaserTracker    command_disabled    logevent_summaryState    index=1

Verify LaserTracker:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LaserTracker    index=1

Verify LaserTracker:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LaserTracker    command_disabled    logevent_configurationApplied    index=1

#MTAirCompressor:1
Verify MTAirCompressor:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAirCompressor:1    auto_enable=True

Verify MTAirCompressor:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor    command_disabled    logevent_summaryState    index=2

Verify MTAirCompressor:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAirCompressor    index=1

Verify MTAirCompressor:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTAirCompressor    command_disabled    logevent_configurationApplied    index=1

#MTAirCompressor:2
Verify MTAirCompressor:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAirCompressor:2    auto_enable=True

Verify MTAirCompressor:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor    command_disabled    logevent_summaryState    index=2

Verify MTAirCompressor:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAirCompressor    index=2

Verify MTAirCompressor:2 ConfigurationApplied Event timing   
    [Tags]    config_applied    timing
    Verify Time Delta    MTAirCompressor    command_disabled    logevent_configurationApplied    index=1

#MTMount
Verify MTMount Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTMount

Verify MTMount SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    command_disabled    logevent_summaryState

Verify MTMount ConfigurationApplied Event 
    [Tags]    config_applied
    Verify ConfigurationApplied    MTMount

Verify MTMount ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTMount    command_disabled    logevent_configurationApplied 

#MTPtg
Verify MTPtg Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTPtg

Verify MTPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTPtg    command_disabled    logevent_summaryState

Verify MTPtg ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTPtg

#MTDome
Verify MTDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDome

Verify MTDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    command_disabled    logevent_summaryState

Verify MTDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDome

Verify MTDome ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDome    command_disabled    logevent_configurationApplied

#MTDomeTrajectory
Verify MTDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory

Verify MTDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    command_disabled    logevent_summaryState

Verify MTDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDomeTrajectory    command_disabled    logevent_configurationApplied

#MTAOS
Verify MTAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAOS

Verify mTAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    mTAOS    command_disabled    logevent_summaryState

Verify MTAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAOS

Verify MTAOS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTAOS    command_disabled    logevent_configurationApplied

#MTHexapod:1
Verify MTHexapod:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1

Verify MTHexapod:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    command_disabled    logevent_summaryState    index=1

Verify MTHexapod:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    index=1

Verify MTHexapod:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod    command_disabled    logevent_configurationApplied    index=1

#MTHexapod:2
Verify MTHexapod:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2

Verify MTHexapod:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    command_disabled    logevent_summaryState    index=2

Verify MTHexapod:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    index=2

Verify MTHexapod:2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod    command_disabled    logevent_configurationApplied    index=2

#MTRotator
Verify MTRotator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTRotator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    command_disabled    logevent_summaryState

Verify MTRotator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTRotator

Verify MTRotator ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTRotator    command_disabled    logevent_configurationApplied

#MTM1M3
Verify MTM1M3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM1M3

Verify MTM1M3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    command_disabled    logevent_summaryState

Verify MTM1M3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM1M3

Verify MTM1M3 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM1M3    command_disabled    logevent_configurationApplied

#MTM2
Verify MTM2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM2

Verify MTM2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    command_disabled    logevent_summaryState

Verify MTM2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM2

Verify MTM2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM2    command_disabled    logevent_configurationApplied
