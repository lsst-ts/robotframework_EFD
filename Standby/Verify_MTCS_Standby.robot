*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    mtcs

*** Variables ***
@{in_position_field}    inPosition
@{in_position}    False
${time_window}    10

*** Test Cases ***
Verify MTMount Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTMount

Verify MTMount Axes NOT InPosition
    [Tags]    standby
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}

Verify MTMount SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTMount

Verify MTMount SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTMount    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTMount ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTMount

Verify MTMount ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTMount    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify MTPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTPtg

Verify MTPtg SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTPtg

Verify MTPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTPtg    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTPtg ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTPtg

Verify MTDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTDome

Verify MTDome SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTDome

Verify MTDome SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDome    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTDome ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTDome

Verify MTDome ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTDome    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify MTDomeTrajectory Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTDomeTrajectory

Verify MTDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTDomeTrajectory

Verify MTDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTDomeTrajectory    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTDomeTrajectory

Verify MTDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTDomeTrajectory    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify MTAOS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTAOS

Verify MTAOS SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTAOS

Verify MTAOS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTAOS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTAOS

Verify MTAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTAOS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify MTHexapod:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTHexapod:1

Verify MTHexapod:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTHexapod    1

Verify MTHexapod:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify MTHexapod:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTHexapod    1

Verify MTHexapod:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

Verify MTHexapod:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTHexapod:2

Verify MTHexapod:2 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTHexapod    2

Verify MTHexapod:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_softwareVersions    ${time_window}    2

Verify MTHexapod:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTHexapod    2

Verify MTHexapod:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTHexapod    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    2

Verify MTRotator Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTRotator

Verify MTRotator SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTRotator

Verify MTRotator SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTRotator    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTRotator ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTRotator

Verify MTRotator ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTRotator    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify MTM1M3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM1M3

Verify MTM1M3 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTM1M3

Verify MTM1M3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM1M3    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTM1M3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTM1M3

Verify MTM1M3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM1M3    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify MTM2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    MTM2

Verify MTM2 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    MTM2

Verify MTM2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    MTM2    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify MTM2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    MTM2

Verify MTM2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    MTM2    logevent_summaryState    logevent_configurationsAvailable    ${time_window}
