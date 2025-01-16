*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtcs

*** Variables ***
${lasertracker_salver}    ${SALVersion}
${lasertracker_xmlver}    ${XMLVersion}
${mtaircompressor1_salver}    ${SALVersion}
${mtaircompressor1_xmlver}    ${XMLVersion}
${mtaircompressor2_salver}    ${SALVersion}
${mtaircompressor2_xmlver}    ${XMLVersion}
${mtmount_salver}    ${SALVersion}
${mtmount_xmlver}    ${XMLVersion}
${mtptg_salver}    ${SALVersion}
${mtptg_xmlver}    ${XMLVersion}
${mtdome_salver}    ${SALVersion}
${mtdome_xmlver}    ${XMLVersion}
${mtdometrajectory_salver}    ${SALVersion}
${mtdometrajectory_xmlver}    ${XMLVersion}
${mtaos_salver}    ${SALVersion}
${mtaos_xmlver}    ${XMLVersion}
${mthexapod1_salver}    ${SALVersion}
${mthexapod1_xmlver}    ${XMLVersion}
${mthexapod2_salver}    ${SALVersion}
${mthexapod2_xmlver}    ${XMLVersion}
${mtrotator_salver}    ${SALVersion}
${mtrotator_xmlver}    ${XMLVersion}
${mtm1m3_salver}    ${SALVersion}
${mtm1m3_xmlver}    ${XMLVersion}
${mtm1m3ts_salver}    ${SALVersion}
${mtm1m3ts_xmlver}    ${XMLVersion}
${mtm2_salver}    ${SALVersion}
${mtm2_xmlver}    ${XMLVersion}
${mtvms1_salver}    ${SALVersion}
${mtvms1_xmlver}    ${XMLVersion}
@{in_position_field}    inPosition
@{in_position}    False

*** Test Cases ***
# LaserTracker:1
Verify LaserTracker:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LaserTracker:1

Verify LaserTracker:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    LaserTracker    index=1    csc_salver=${lasertracker_salver}    csc_xmlver=${lasertracker_xmlver}

Verify LaserTracker:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LaserTracker:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify LaserTracker:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LaserTracker    index=1

Verify LaserTracker:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LaserTracker:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTAirCompressor:1
Verify MTAirCompressor:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAirCompressor:1    auto_enable=True

Verify MTAirCompressor:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTAirCompressor    index=1    csc_salver=${mtaircompressor1_salver}    csc_xmlver=${mtaircompressor1_xmlver}

Verify MTAirCompressor:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAirCompressor:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAirCompressor    index=1

Verify MTAirCompressor:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAirCompressor:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTAirCompressor:2
Verify MTAirCompressor:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAirCompressor:2    auto_enable=True

Verify MTAirCompressor:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTAirCompressor    index=2    csc_salver=${mtaircompressor2_salver}    csc_xmlver=${mtaircompressor2_xmlver}

Verify MTAirCompressor:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAirCompressor:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAirCompressor    index=2

Verify MTAirCompressor:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAirCompressor:2    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTMount
Verify MTMount Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTMount

Verify MTMount Axes NOT InPosition
    [Tags]    standby
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}

Verify MTMount SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTMount    csc_salver=${mtmount_salver}    csc_xmlver=${mtmount_xmlver}

Verify MTMount SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTMount ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTMount

Verify MTMount ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTMount    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTPtg
Verify MTPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTPtg

Verify MTPtg SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTPtg    csc_salver=${mtptg_salver}    csc_xmlver=${mtptg_xmlver}

Verify MTPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTPtg    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTPtg ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTPtg

# MTDome
Verify MTDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTDome

Verify MTDome SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTDome    csc_salver=${mtdome_salver}    csc_xmlver=${mtdome_xmlver}

Verify MTDome SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTDome ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTDome

Verify MTDome ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTDome    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTDomeTrajectory
Verify MTDomeTrajectory Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTDomeTrajectory

Verify MTDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTDomeTrajectory    csc_salver=${mtdometrajectory_salver}    csc_xmlver=${mtdometrajectory_xmlver}

Verify MTDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTDomeTrajectory    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTAOS
Verify MTAOS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAOS

Verify MTAOS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTAOS    csc_salver=${mtaos_salver}    csc_xmlver=${mtaos_xmlver}

Verify MTAOS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAOS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAOS

Verify MTAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAOS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTHexapod:1
Verify MTHexapod:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTHexapod:1

Verify MTHexapod:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTHexapod    index=1    csc_salver=${mthexapod1_salver}    csc_xmlver=${mthexapod1_xmlver}

Verify MTHexapod:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTHexapod:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTHexapod    index=1

Verify MTHexapod:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTHexapod:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTHexapod:2
Verify MTHexapod:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTHexapod:2

Verify MTHexapod:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTHexapod    index=2    csc_salver=${mthexapod2_salver}    csc_xmlver=${mthexapod2_xmlver}

Verify MTHexapod:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTHexapod:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTHexapod    index=2

Verify MTHexapod:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTHexapod:2    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTRotator
Verify MTRotator Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTRotator

Verify MTRotator SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTRotator    csc_salver=${mtrotator_salver}    csc_xmlver=${mtrotator_xmlver}

Verify MTRotator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTRotator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTRotator

Verify MTRotator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTRotator    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTM1M3
Verify MTM1M3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM1M3

Verify MTM1M3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTM1M3    csc_salver=${mtm1m3_salver}    csc_xmlver=${mtm1m3_xmlver}

Verify MTM1M3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTM1M3 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-872
    Verify ConfigurationsAvailable    MTM1M3

Verify MTM1M3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM1M3    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTM1M3TS
Verify MTM1M3TS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM1M3TS
    
Verify MTM1M3TS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTM1M3TS    csc_salver=${mtm1m3ts_salver}    csc_xmlver=${mtm1m3ts_xmlver}
    
Verify MTM1M3TS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3TS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify MTM1M3TS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTM1M3TS
    
Verify MTM1M3TS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM1M3TS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTM2
Verify MTM2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM2

Verify MTM2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTM2    csc_salver=${mtm2_salver}    csc_xmlver=${mtm2_xmlver}

Verify MTM2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTM2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTM2

Verify MTM2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM2    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# MTVMS:1
Verify MTVMS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTVMS:1

Verify MTVMS:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTVMS:1    csc_salver=${mtvms1_salver}    csc_xmlver=${mtvms1_xmlver}

Verify MTVMS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTVMS:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTVMS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTVMS    index=1

Verify MTVMS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTVMS:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
