*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtcs

*** Test Cases ***
# LaserTracker
Verify LaserTracker:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LaserTracker:1

Verify LaserTracker:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LaserTracker:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LaserTracker:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LaserTracker    index=1

Verify LaserTracker:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LaserTracker:1    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTAirCompressor:1
##Auto-Enabled: no timing tests
Verify MTAirCompressor:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAirCompressor:1    auto_enable=True

Verify MTAirCompressor:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAirCompressor    index=1

# MTAirCompressor:2
##Auto-Enabled: no timing tests
Verify MTAirCompressor:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAirCompressor:2    auto_enable=True

Verify MTAirCompressor:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAirCompressor    index=2

# MTMount
Verify MTMount Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTMount

Verify MTMount SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTMount ConfigurationApplied Event 
    [Tags]    config_applied
    Verify ConfigurationApplied    MTMount

Verify MTMount ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTMount    logevent_configurationApplied     hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTPtg
Verify MTPtg Disabled
    [Tags]    mtptg    disabled
    Verify Summary State    ${STATES}[disabled]    MTPtg

Verify MTPtg SummaryState timing
    [Tags]    mtptg    software_versions    timing
    Verify Time Delta    MTPtg    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTPtg ConfigurationApplied Event
    [Tags]    mtptg    config_applied
    Verify ConfigurationApplied    MTPtg

# MTDome
Verify MTDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDome

Verify MTDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDome

Verify MTDome ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDome    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTDomeTrajectory
Verify MTDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory

Verify MTDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTDomeTrajectory    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTAOS
Verify MTAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTAOS

Verify MTAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAOS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTAOS

Verify MTAOS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTAOS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTHexapod:1
Verify MTHexapod:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1

Verify MTHexapod:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTHexapod:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    index=1

Verify MTHexapod:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod:1    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTHexapod:2
Verify MTHexapod:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2

Verify MTHexapod:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTHexapod:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTHexapod    index=2

Verify MTHexapod:2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTHexapod:2    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTRotator
Verify MTRotator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTRotator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTRotator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTRotator

Verify MTRotator ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTRotator    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTM1M3
Verify MTM1M3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM1M3

Verify MTM1M3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTM1M3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM1M3

Verify MTM1M3 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM1M3    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTM1M3TS
Verify MTM1M3TS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM1M3TS

Verify MTM1M3TS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3TS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify MTM1M3TS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM1M3TS
    
Verify MTM1M3TS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM1M3TS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTM2
Verify MTM2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTM2

Verify MTM2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTM2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTM2

Verify MTM2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTM2    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTVMS
Verify MTVMS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTVMS

Verify MTVMS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTVMS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTVMS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTVMS

Verify MTVMS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTVMS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
