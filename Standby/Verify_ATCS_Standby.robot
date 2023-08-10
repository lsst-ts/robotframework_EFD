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
${time_window}    10

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
    Verify Time Delta    ATAOS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATAOS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATAOS

Verify ATAOS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATAOS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#ATDome
Verify ATDome Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATDome

Verify ATDome SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATDome    csc_salver=${atdome_salver}    csc_xmlver=${atdome_xmlver}

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

#ATDomeTrajectory
Verify ATDomeTrajectory SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATDomeTrajectory    csc_salver=${atdometrajectory_salver}    csc_xmlver=${atdometrajectory_xmlver}

Verify ATDomeTrajectory SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATDomeTrajectory ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#ATHexapod
Verify ATHexapod Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATHexapod

Verify ATHexapod SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATHexapod    csc_salver=${athexapod_salver}    csc_xmlver=${athexapod_xmlver}

Verify ATHexapod SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATHexapod ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATHexapod

Verify ATHexapod ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#ATMCS
Verify ATMCS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATMCS

Verify ATMCS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATMCS    csc_salver=${atmcs_salver}    csc_xmlver=${atmcs_xmlver}

Verify ATMCS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATMCS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATMCS

#ATPneumatics
Verify ATPneumatics Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPneumatics

Verify ATPneumatics SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATPneumatics    csc_salver=${atpneumatics_salver}    csc_xmlver=${atpneumatics_xmlver}

Verify ATPneumatics SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATPneumatics ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATPneumatics

#ATPtg
Verify ATPtg Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ATPtg

Verify ATPtg SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ATPtg    csc_salver=${atptg_salver}    csc_xmlver=${atptg_xmlver}

Verify ATPtg SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify ATPtg ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ATPtg
