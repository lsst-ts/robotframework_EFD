*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    atcs

*** Variables ***
${ataos_salver}    ${SALVersion}
${ataos_xmlver}    ${XMLVersion}
${atdome_salver}    ${SALVersion}
${atdome_xmlver}    ${XMLVersion}
${atdometrajectory_salver}    ${SALVersion}
${atdometrajectory_xmlver}    ${XMLVersion}
${athexapod_salver}    ${SALVersion}
${athexapod_xmlver}    ${XMLVersion}
${atmcs_salver}    ${SALVersion}
${atmcs_xmlver}    ${XMLVersion}
${atpneumatics_salver}    ${SALVersion}
${atpneumatics_xmlver}    ${XMLVersion}
${atptg_salver}    ${SALVersion}
${atptg_xmlver}    ${XMLVersion}

*** Test Cases ***
#ATAOS
Verify ATAOS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATAOS

Verify ATAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    command_standby    logevent_summaryState

Verify ATAOS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATAOS    csc_salver=${ataos_salver}    csc_xmlver=${ataos_xmlver}

Verify ATAOS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    command_standby    logevent_softwareVersions

Verify ATAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATAOS

Verify ATAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATAOS    command_standby    logevent_configurationsAvailable

#ATDome
Verify ATDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDome

Verify ATDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    command_standby    logevent_summaryState

Verify ATDome SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATDome    csc_salver=${atdome_salver}    csc_xmlver=${atdome_xmlver}

Verify ATDome SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    command_standby    logevent_softwareVersions

Verify ATDome ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDome

Verify ATDome ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDome    command_standby    logevent_configurationsAvailable

#ATDomeTrajectory
Verify ATDomeTrajectory Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory

Verify ATDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    command_standby    logevent_summaryState

Verify ATDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATDomeTrajectory    csc_salver=${atdometrajectory_salver}    csc_xmlver=${atdometrajectory_xmlver}

Verify ATDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    command_standby    logevent_softwareVersions

Verify ATDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDomeTrajectory    command_standby    logevent_configurationsAvailable

#ATHexapod
Verify ATHexapod Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHexapod

Verify ATHexapod SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    command_standby    logevent_summaryState

Verify ATHexapod SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATHexapod    csc_salver=${athexapod_salver}    csc_xmlver=${athexapod_xmlver}

Verify ATHexapod SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    command_standby    logevent_softwareVersions

Verify ATHexapod ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHexapod

Verify ATHexapod ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATHexapod    command_standby    logevent_configurationsAvailable

#ATMCS
Verify ATMCS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMCS

Verify ATMCS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    command_standby    logevent_summaryState

Verify ATMCS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATMCS    csc_salver=${atmcs_salver}    csc_xmlver=${atmcs_xmlver}

Verify ATMCS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    command_standby    logevent_softwareVersions

Verify ATMCS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMCS

Verify ATMCS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATMCS    command_standby    logevent_configurationsAvailable

#ATPneumatics
Verify ATPneumatics Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPneumatics

Verify ATPneumatics SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    command_standby    logevent_summaryState

Verify ATPneumatics SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATPneumatics    csc_salver=${atpneumatics_salver}    csc_xmlver=${atpneumatics_xmlver}

Verify ATPneumatics SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    command_standby    logevent_softwareVersions

Verify ATPneumatics ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATPneumatics

Verify ATPneumatics ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATPneumatics    command_standby    logevent_configurationsAvailable

#ATPtg
Verify ATPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPtg

Verify ATPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    command_standby    logevent_summaryState

Verify ATPtg SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATPtg    csc_salver=${atptg_salver}    csc_xmlver=${atptg_xmlver}

Verify ATPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    command_standby    logevent_softwareVersions

Verify ATPtg ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATPtg

Verify ATPtg ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATPtg    command_standby    logevent_configurationsAvailable
