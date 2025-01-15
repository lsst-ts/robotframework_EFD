*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    calibration

*** Variables ***
${cbp_salver}    ${SALVersion}
${cbp_xmlver}    ${XMLVersion}
${electrometer101_salver}    ${SALVersion}
${electrometer101_xmlver}    ${XMLVersion}
${electrometer102_salver}    ${SALVersion}
${electrometer102_xmlver}    ${XMLVersion}
${electrometer201_salver}    ${SALVersion}
${electrometer201_xmlver}    ${XMLVersion}
${LEDProjector_salver}    ${SALVersion}
${LinearStage101_xmlver}    ${XMLVersion}
${LinearStage101_salver}    ${SALVersion}
${LinearStage102_xmlver}    ${XMLVersion}
${LinearStage102_salver}    ${SALVersion}
${LinearStage103_xmlver}    ${XMLVersion}
${LinearStage103_salver}    ${SALVersion}
${LinearStage104_xmlver}    ${XMLVersion}
${LinearStage104_salver}    ${SALVersion}

*** Test Cases ***
# CBP
Verify CBP Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    CBP

Verify CBP SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    CBP    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify CBP SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    CBP    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify CBP ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    CBP

Verify CBP ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    CBP    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:101
Verify Electrometer:101 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Electrometer:101

Verify Electrometer:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Electrometer    index=101

Verify Electrometer:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Electrometer:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:102
Verify Electrometer:102 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Electrometer:102

Verify Electrometer:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:102 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:102    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:102 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Electrometer    index=102

Verify Electrometer:102 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Electrometer:102    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# Electrometer:201
Verify Electrometer:201 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Electrometer:201

Verify Electrometer:201 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:201 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Electrometer:201    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Electrometer:201 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Electrometer    index=201

Verify Electrometer:201 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Electrometer:201    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LEDProjector
Verify LEDProjector Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LEDProjector

Verify LEDProjector SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LEDProjector    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LEDProjector SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LEDProjector    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LEDProjector ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LEDProjector

Verify LEDProjector ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LEDProjector    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:101
Verify LinearStage:101 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LinearStage:101
 
Verify LinearStage:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:101 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:101    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:101 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LinearStage    index=101

Verify LinearStage:101 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LinearStage:101    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:102
Verify LinearStage:102 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LinearStage:102
   
Verify LinearStage:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:102 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:102    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:102 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LinearStage    index=102

Verify LinearStage:102 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LinearStage:102    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:103
Verify LinearStage:103 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LinearStage:103
    
Verify LinearStage:103 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:103    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify LinearStage:103 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:103    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:103 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LinearStage    index=103

Verify LinearStage:103 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LinearStage:103    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# LinearStage:104
Verify LinearStage:104 Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LinearStage:104
    
Verify LinearStage:104 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:104 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LinearStage:104    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LinearStage:104 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LinearStage    index=104

Verify LinearStage:104 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LinearStage:104    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# TunableLaser
Verify TunableLaser Enabled
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LinearStage

Verify TunableLaser SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    TunableLaser    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify TunableLaser SoftwareVersions timing    
    [Tags]    software_versions    timing
    Verify Time Delta    TunableLaser    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify TunableLaser ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LinearStage
    
Verify TunableLaser ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    TunableLaser    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
