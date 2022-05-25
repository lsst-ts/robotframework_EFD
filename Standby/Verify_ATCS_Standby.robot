*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Force Tags    atcs
Suite Setup    Log Many    ${STATES}[standby]

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATAOS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATAOS

Verify ATAOS SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATAOS

Verify ATAOS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATAOS

Verify ATAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATAOS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify ATDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDome

Verify ATDome SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATDome

Verify ATDome SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATDome ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDome

Verify ATDome ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDome    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify ATDomeTrajectory Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory

Verify ATDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATDomeTrajectory

Verify ATDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify ATHexapod Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHexapod

Verify ATHexapod SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATHexapod

Verify ATHexapod SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATHexapod ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHexapod

Verify ATHexapod ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

Verify ATMCS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMCS

Verify ATMCS SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATMCS

Verify ATMCS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATMCS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMCS

Verify ATPneumatics Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPneumatics

Verify ATPneumatics SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATPneumatics

Verify ATPneumatics SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATPneumatics ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATPneumatics

Verify ATPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPtg

Verify ATPtg SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ATPtg

Verify ATPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATPtg ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATPtg
