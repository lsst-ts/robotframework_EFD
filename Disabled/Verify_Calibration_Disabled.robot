*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    calibration

*** Test Cases ***
# CBP
Verify CBP Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    CBP

Verify CBP SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    CBP    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify CBP ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    CBP

Verify CBP ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    CBP    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:101
Verify Electrometer:101 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Electrometer:101

Verify Electrometer:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:101 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Electrometer    index=101

Verify Electrometer:101 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Electrometer    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:102
Verify Electrometer:102 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Electrometer:102

Verify Electrometer:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:102 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Electrometer    index=102

Verify Electrometer:102 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Electrometer:102    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:103
Verify Electrometer:103 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Electrometer:103

Verify Electrometer:103 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:103    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:103 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Electrometer    index=103

Verify Electrometer:103 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Electrometer:103    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:201
Verify Electrometer:201 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Electrometer:201

Verify Electrometer:201 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:201 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Electrometer    index=201

Verify Electrometer:201 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Electrometer:201    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LEDProjector
Verify LEDProjector Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LEDProjector

Verify LEDProjector SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LEDProjector    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LEDProjector ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LEDProjector

Verify LEDProjector ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LEDProjector    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:101
Verify LinearStage:101 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LinearStage:101
 
Verify LinearStage:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:101 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LinearStage    index=101
    
Verify LinearStage:101 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LinearStage:101    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:102
Verify LinearStage:102 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LinearStage:102
   
Verify LinearStage:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:102 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LinearStage    index=102
    
Verify LinearStage:102 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LinearStage:102    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:103
Verify LinearStage:103 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LinearStage:103
    
Verify LinearStage:103 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:103    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify LinearStage:103 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LinearStage    index=103
    
Verify LinearStage:103 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LinearStage:103    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:104
Verify LinearStage:104 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    LinearStage:104
    
Verify LinearStage:104 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify LinearStage:104 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    LinearStage    index=104
    
Verify LinearStage:104 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    LinearStage:104    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTReflector
Verify MTReflector Disabled    
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    MTReflector

Verify MTReflector SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTReflector    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTReflector ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    MTReflector

Verify MTReflector ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    MTReflector    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# TunableLaser
Verify TunableLaser Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    TunableLaser

Verify TunableLaser SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    TunableLaser    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify TunableLaser ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    TunableLaser

Verify TunableLaser ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    TunableLaser    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
