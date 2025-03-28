*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    calibration

*** Test Cases ***
# CBP
Verify CBP Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    CBP

Verify CBP SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    CBP    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:101
Verify Electrometer:101 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    Electrometer:101

Verify Electrometer:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:102
Verify Electrometer:102 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    Electrometer:102

Verify Electrometer:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:103
Verify Electrometer:103 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    Electrometer:103

Verify Electrometer:103 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:103    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:201
Verify Electrometer:201 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    Electrometer:201

Verify Electrometer:201 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LEDProjector
Verify LEDProjector Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    LEDProjector

Verify LEDProjector SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LEDProjector    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:101
Verify LinearStage:101 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    LinearStage:101
 
Verify LinearStage:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:102
Verify LinearStage:102 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    LinearStage:102
   
Verify LinearStage:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:103
Verify LinearStage:103 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    LinearStage:103
    
Verify LinearStage:103 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:103    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# LinearStage:104
Verify LinearStage:104 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    LinearStage:104
    
Verify LinearStage:104 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# TunableLaser
Verify TunableLaser Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    TunableLaser
    
Verify TunableLaser SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    TunableLaser    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
