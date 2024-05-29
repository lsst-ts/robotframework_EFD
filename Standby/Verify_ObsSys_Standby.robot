*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys

*** Variables ***
${scheduler1_salver}    ${SALVersion}
${scheduler1_xmlver}    ${XMLVersion}
${scheduler2_salver}    ${SALVersion}
${scheduler2_xmlver}    ${XMLVersion}
${scheduler3_salver}    ${SALVersion}
${scheduler3_xmlver}    ${XMLVersion}
${scriptqueue1_salver}    ${SALVersion}
${scriptqueue1_xmlver}    ${XMLVersion}
${scriptqueue2_salver}    ${SALVersion}
${scriptqueue2_xmlver}    ${XMLVersion}
${scriptqueue3_salver}    ${SALVersion}
${scriptqueue3_xmlver}    ${XMLVersion}
${watcher_salver}    ${SALVersion}
${watcher_xmlver}    ${XMLVersion}
${test42_salver}    ${SALVersion}
${test42_xmlver}    ${XMLVersion}

*** Test Cases ***
#Scheduler:1
Verify Scheduler:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 SoftwareVersions
    [Tags]    software_versions    CAP-1044
    Verify Software Versions    Scheduler    index=1    csc_salver=${scheduler1_salver}    csc_xmlver=${scheduler1_xmlver}

Verify Scheduler:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_softwareVersions    logevent_summaryState    index=1

Verify Scheduler:1 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-1033
    Verify ConfigurationsAvailable    Scheduler    index=1

Verify Scheduler:1 ConfigurationsAvailable timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_configurationsAvailable    logevent_summaryState    index=1

#Scheduler:2
Verify Scheduler:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 SoftwareVersions
    [Tags]    software_versions    CAP-1044
    Verify Software Versions    Scheduler    index=2    csc_salver=${scheduler2_salver}    csc_xmlver=${scheduler2_xmlver}

Verify Scheduler:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_softwareVersions    logevent_summaryState    index=2

Verify Scheduler:2 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-1033
    Verify ConfigurationsAvailable    Scheduler    index=2

Verify Scheduler:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Scheduler    logevent_configurationsAvailable    logevent_summaryState    index=2

#Scheduler:3
Verify Scheduler:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:3

Verify Scheduler:3 SoftwareVersions
    [Tags]    software_versions    CAP-1044
    Verify Software Versions    Scheduler    index=3    csc_salver=${scheduler2_salver}    csc_xmlver=${scheduler2_xmlver}

Verify Scheduler:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_softwareVersions    logevent_summaryState    index=3

Verify Scheduler:3 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-1033
    Verify ConfigurationsAvailable    Scheduler    index=3

Verify Scheduler:3 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Scheduler    logevent_configurationsAvailable    logevent_summaryState    index=3

#ScriptQueue:1
Verify ScriptQueue:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:1    True

Verify ScriptQueue:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=1    csc_salver=${scriptqueue1_salver}    csc_xmlver=${scriptqueue1_xmlver}

Verify ScriptQueue:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_softwareVersions    logevent_summaryState    index=1

Verify ScriptQueue:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=1

#ScriptQueue:2
Verify ScriptQueue:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:2    True

Verify ScriptQueue:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=2    csc_salver=${scriptqueue2_salver}    csc_xmlver=${scriptqueue2_xmlver}

Verify ScriptQueue:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_softwareVersions    logevent_summaryState    index=2

Verify ScriptQueue:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=2

#ScriptQueue:3
Verify ScriptQueue:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:3    True

Verify ScriptQueue:3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=3    csc_salver=${scriptqueue3_salver}    csc_xmlver=${scriptqueue3_xmlver}

Verify ScriptQueue:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_softwareVersions    logevent_summaryState    index=3

Verify ScriptQueue:3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=3

#Watcher
Verify Watcher Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Watcher    True

Verify Watcher SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Watcher    csc_salver=${watcher_salver}    csc_xmlver=${watcher_xmlver}

Verify Watcher SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    logevent_softwareVersions    logevent_summaryState

Verify Watcher ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Watcher

Verify Watcher ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Watcher    logevent_configurationsAvailable    logevent_summaryState

#Test:42
Verify Test:42 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Test:42

Verify Test:42 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Test    index=42    csc_salver=${test42_salver}    csc_xmlver=${test42_xmlver}

Verify Test:42 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Test    logevent_softwareVersions    logevent_summaryState    index=42

Verify Test:42 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Test    index=42
