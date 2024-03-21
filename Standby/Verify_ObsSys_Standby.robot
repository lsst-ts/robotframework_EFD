*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys

*** Variables ***
${authorize_salver}    ${SALVersion}
${authorize_xmlver}    ${XMLVersion}
${scheduler1_salver}    ${SALVersion}
${scheduler1_xmlver}    ${XMLVersion}
${scheduler2_salver}    ${SALVersion}
${scheduler2_xmlver}    ${XMLVersion}
${scriptqueue1_salver}    ${SALVersion}
${scriptqueue1_xmlver}    ${XMLVersion}
${scriptqueue2_salver}    ${SALVersion}
${scriptqueue2_xmlver}    ${XMLVersion}
${watcher_salver}    ${SALVersion}
${watcher_xmlver}    ${XMLVersion}

*** Test Cases ***
#Authorize
Verify Authorize Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Authorize    True

Verify Authorize SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Authorize    command_standby    logevent_summaryState

Verify Authorize SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Authorize    csc_salver=${authorize_salver}    csc_xmlver=${authorize_xmlver}

Verify Authorize SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Authorize    command_standby    logevent_softwareVersions

#Scheduler:1
Verify Scheduler:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:1    command_standby    logevent_summaryState

Verify Scheduler:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Scheduler    index=1    csc_salver=${scheduler1_salver}    csc_xmlver=${scheduler1_xmlver}

Verify Scheduler:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    command_standby    logevent_softwareVersions    index=1

Verify Scheduler:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    index=1

Verify Scheduler:1 ConfigurationsAvailable timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    command_standby    logevent_configurationsAvailable    index=1

#Scheduler:2
Verify Scheduler:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:2    command_standby    logevent_summaryState

Verify Scheduler:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Scheduler    index=2    csc_salver=${scheduler2_salver}    csc_xmlver=${scheduler2_xmlver}

Verify Scheduler:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    command_standby    logevent_softwareVersions    index=2

Verify Scheduler:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    index=2

Verify Scheduler:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Scheduler    command_standby    logevent_configurationsAvailable    index=2

#ScriptQueue:1
Verify ScriptQueue:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:1    True

Verify ScriptQueue:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue:1    command_standby    logevent_summaryState

Verify ScriptQueue:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=1    csc_salver=${scriptqueue1_salver}    csc_xmlver=${scriptqueue1_xmlver}

Verify ScriptQueue:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    command_standby    logevent_softwareVersions    index=1

Verify ScriptQueue:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=1

#ScriptQueue:2
Verify ScriptQueue:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:2    True

Verify ScriptQueue:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue:2    command_standby    logevent_summaryState

Verify ScriptQueue:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=2    csc_salver=${scriptqueue2_salver}    csc_xmlver=${scriptqueue2_xmlver}

Verify ScriptQueue:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    command_standby    logevent_softwareVersions    index=2

Verify ScriptQueue:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=2

#Watcher
Verify Watcher Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Watcher    True

Verify Watcher SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    command_standby    logevent_summaryState

Verify Watcher SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Watcher    csc_salver=${watcher_salver}    csc_xmlver=${watcher_xmlver}

Verify Watcher SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    command_standby    logevent_softwareVersions

Verify Watcher ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Watcher

Verify Watcher ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Watcher    command_standby    logevent_configurationsAvailable
