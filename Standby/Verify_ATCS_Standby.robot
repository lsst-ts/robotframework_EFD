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

Verify ATAOS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATAOS    csc_salver=${ataos_salver}    csc_xmlver=${ataos_xmlver}

Verify ATAOS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATAOS

Verify ATAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATAOS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATDome
Verify ATDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDome

Verify ATDome SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATDome    csc_salver=${atdome_salver}    csc_xmlver=${atdome_xmlver}

Verify ATDome SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATDome ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDome

Verify ATDome ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDome    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATDomeTrajectory
Verify ATDomeTrajectory Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory

Verify ATDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATDomeTrajectory    csc_salver=${atdometrajectory_salver}    csc_xmlver=${atdometrajectory_xmlver}

Verify ATDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDomeTrajectory    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATHexapod
Verify ATHexapod Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHexapod

Verify ATHexapod SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATHexapod    csc_salver=${athexapod_salver}    csc_xmlver=${athexapod_xmlver}

Verify ATHexapod SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATHexapod ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHexapod

Verify ATHexapod ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATHexapod    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATMCS
Verify ATMCS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMCS

Verify ATMCS SoftwareVersions
    [Tags]    software_versions    DM-39357
    Verify Software Versions    ATMCS    csc_salver=${atmcs_salver}    csc_xmlver=${atmcs_xmlver}

Verify ATMCS SoftwareVersions timing
    [Tags]    software_versions    timing    DM-39357
    Verify Time Delta    ATMCS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATMCS ConfigurationsAvailable Event
    [Tags]    config_available    DM-44733
    Verify ConfigurationsAvailable    ATMCS

Verify ATMCS ConfigurationsAvailable timing
    [Tags]    config_available    timing    DM-44733
    Verify Time Delta    ATMCS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATPneumatics
Verify ATPneumatics Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPneumatics

Verify ATPneumatics SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATPneumatics    csc_salver=${atpneumatics_salver}    csc_xmlver=${atpneumatics_xmlver}

Verify ATPneumatics SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATPneumatics ConfigurationsAvailable Event
    [Tags]    config_available    DM-44734
    Verify ConfigurationsAvailable    ATPneumatics

Verify ATPneumatics ConfigurationsAvailable timing
    [Tags]    config_available    timing    DM-44734
    Verify Time Delta    ATMCS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATPtg
Verify ATPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPtg

Verify ATPtg SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATPtg    csc_salver=${atptg_salver}    csc_xmlver=${atptg_xmlver}

Verify ATPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATPtg ConfigurationsAvailable Event
    [Tags]    config_available
    # Non-configurable: dataframe empty, no timing test.
    Verify ConfigurationsAvailable    ATPtg
