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
${mtm2_salver}    ${SALVersion}
${mtm2_xmlver}    ${XMLVersion}
@{in_position_field}    inPosition
@{in_position}    False

*** Test Cases ***
#LaserTracker:1
Verify LaserTracker:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    LaserTracker:1

Verify LaserTracker:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    LaserTracker:1    command_standby    logevent_summaryState

Verify LaserTracker:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    LaserTracker    index=1    csc_salver=${lasertracker_salver}    csc_xmlver=${lasertracker_xmlver}

Verify LaserTracker:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    LaserTracker    command_standby    logevent_softwareVersions    index=1

Verify LaserTracker:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    LaserTracker    index=1

Verify LaserTracker:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    LaserTracker    command_standby    logevent_configurationsAvailable    index=1

#MTAirCompressor:1
Verify MTAirCompressor:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAirCompressor:1    auto_enable=True

Verify MTAirCompressor:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor:1    command_standby    logevent_summaryState

Verify MTAirCompressor:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTAirCompressor    index=1    csc_salver=${mtaircompressor1_salver}    csc_xmlver=${mtaircompressor1_xmlver}

Verify MTAirCompressor:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor    command_standby    logevent_softwareVersions    index=1

Verify MTAirCompressor:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAirCompressor    index=1

Verify MTAirCompressor:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAirCompressor    command_standby    logevent_configurationsAvailable    index=1

#MTAirCompressor:2
Verify MTAirCompressor:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAirCompressor:2    auto_enable=True

Verify MTAirCompressor:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor:2    command_standby    logevent_summaryState

Verify MTAirCompressor:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTAirCompressor    index=2    csc_salver=${mtaircompressor2_salver}    csc_xmlver=${mtaircompressor2_xmlver}

Verify MTAirCompressor:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAirCompressor    command_standby    logevent_softwareVersions    index=2

Verify MTAirCompressor:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAirCompressor    index=2

Verify MTAirCompressor:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAirCompressor    command_standby    logevent_configurationsAvailable    index=2

#MTMount
Verify MTMount Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTMount

Verify MTMount SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    command_standby    logevent_summaryState

Verify MTMount Axes NOT InPosition
    [Tags]    standby
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}

Verify MTMount SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTMount    csc_salver=${mtmount_salver}    csc_xmlver=${mtmount_xmlver}

Verify MTMount SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    command_standby    logevent_softwareVersions

Verify MTMount ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTMount

Verify MTMount ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTMount    command_standby    logevent_configurationsAvailable

# MTPtg
Verify MTPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTPtg

Verify MTPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTPtg    command_standby    logevent_summaryState

Verify MTPtg SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTPtg    csc_salver=${mtptg_salver}    csc_xmlver=${mtptg_xmlver}

Verify MTPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTPtg    command_standby    logevent_softwareVersions

Verify MTPtg ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTPtg

# MTDome
Verify MTDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTDome

Verify MTDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    command_standby    logevent_summaryState

Verify MTDome SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTDome    csc_salver=${mtdome_salver}    csc_xmlver=${mtdome_xmlver}

Verify MTDome SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    command_standby    logevent_softwareVersions

Verify MTDome ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTDome

Verify MTDome ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTDome    command_standby    logevent_configurationsAvailable

#MTDomeTrajectory
Verify MTDomeTrajectory Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTDomeTrajectory

Verify MTDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    command_standby    logevent_summaryState

Verify MTDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTDomeTrajectory    csc_salver=${mtdometrajectory_salver}    csc_xmlver=${mtdometrajectory_xmlver}

Verify MTDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    command_standby    logevent_softwareVersions

Verify MTDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTDomeTrajectory    command_standby    logevent_configurationsAvailable

# MTAOS
Verify MTAOS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAOS

Verify MTAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAOS    command_standby    logevent_summaryState

Verify MTAOS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTAOS    csc_salver=${mtaos_salver}    csc_xmlver=${mtaos_xmlver}

Verify MTAOS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAOS    command_standby    logevent_softwareVersions

Verify MTAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAOS

Verify MTAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAOS    command_standby    logevent_configurationsAvailable

# MTHexapod:1
Verify MTHexapod:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTHexapod:1

Verify MTHexapod:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod:1    command_standby    logevent_summaryState

Verify MTHexapod:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTHexapod    index=1    csc_salver=${mthexapod1_salver}    csc_xmlver=${mthexapod1_xmlver}

Verify MTHexapod:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    command_standby    logevent_softwareVersions    index=1

Verify MTHexapod:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTHexapod    index=1

Verify MTHexapod:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTHexapod    command_standby    logevent_configurationsAvailable    index=1

# MTHexapod:2
Verify MTHexapod:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTHexapod:2

Verify MTHexapod:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod:2    command_standby    logevent_summaryState

Verify MTHexapod:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTHexapod    index=2    csc_salver=${mthexapod2_salver}    csc_xmlver=${mthexapod2_xmlver}

Verify MTHexapod:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    command_standby    logevent_softwareVersions    index=2

Verify MTHexapod:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTHexapod    index=2

Verify MTHexapod:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTHexapod    command_standby    logevent_configurationsAvailable    index=2

# MTRotator
Verify MTRotator Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTRotator

Verify MTRotator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    command_standby    logevent_summaryState

Verify MTRotator SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTRotator    csc_salver=${mtrotator_salver}    csc_xmlver=${mtrotator_xmlver}

Verify MTRotator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    command_standby    logevent_softwareVersions

Verify MTRotator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTRotator

Verify MTRotator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTRotator    command_standby    logevent_configurationsAvailable

# MTM1M3
Verify MTM1M3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM1M3

Verify MTM1M3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    command_standby    logevent_summaryState

Verify MTM1M3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTM1M3    csc_salver=${mtm1m3_salver}    csc_xmlver=${mtm1m3_xmlver}

Verify MTM1M3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    command_standby    logevent_softwareVersions

Verify MTM1M3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTM1M3

Verify MTM1M3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM1M3    command_standby    logevent_configurationsAvailable

# MTM2
Verify MTM2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM2

Verify MTM2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    command_standby    logevent_summaryState

Verify MTM2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    MTM2    csc_salver=${mtm2_salver}    csc_xmlver=${mtm2_xmlver}

Verify MTM2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    command_standby    logevent_softwareVersions

Verify MTM2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTM2

Verify MTM2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM2    command_standby    logevent_configurationsAvailable
