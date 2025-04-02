*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys

*** Variables ***
${ocps101_xmlver}    ${XMLVersion}
${scheduler1_xmlver}    ${XMLVersion}
${scheduler2_xmlver}    ${XMLVersion}
${scheduler3_xmlver}    ${XMLVersion}
${scriptqueue1_xmlver}    ${XMLVersion}
${scriptqueue2_xmlver}    ${XMLVersion}
${scriptqueue3_xmlver}    ${XMLVersion}
${watcher_xmlver}    ${XMLVersion}
${test42_xmlver}    ${XMLVersion}

*** Test Cases ***
#OCPS:101
Verify OCPS:101 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:101
    
Verify OCPS:101 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    OCPS    index=1    csc_xmlver=${ocps1_xmlver}
    
Verify OCPS:101 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS:101    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify OCPS:101 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    index=101
    
Verify OCPS:101 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS:101    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Scheduler:1
Verify Scheduler:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    Scheduler:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:1 SoftwareVersions
    [Tags]    software_versions    CAP-1044
    Verify Software Versions    Scheduler    index=1    csc_xmlver=${scheduler1_xmlver}

Verify Scheduler:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:1 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-1033
    Verify ConfigurationsAvailable    Scheduler    index=1

#Scheduler:2
Verify Scheduler:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    Scheduler:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:2 SoftwareVersions
    [Tags]    software_versions    CAP-1044
    Verify Software Versions    Scheduler    index=2    csc_xmlver=${scheduler2_xmlver}

Verify Scheduler:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:2 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-1033
    Verify ConfigurationsAvailable    Scheduler    index=2

#Scheduler:3
Verify Scheduler:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:3

Verify Scheduler:3 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    Scheduler:3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:3 SoftwareVersions
    [Tags]    software_versions    CAP-1044
    Verify Software Versions    Scheduler    index=3    csc_xmlver=${scheduler3_xmlver}

Verify Scheduler:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:3    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:3 ConfigurationsAvailable Event
    [Tags]    config_available    CAP-1033
    Verify ConfigurationsAvailable    Scheduler    index=3

#ScriptQueue:1
Verify ScriptQueue:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:1    True

Verify ScriptQueue:1 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    ScriptQueue:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ScriptQueue:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=1    csc_xmlver=${scriptqueue1_xmlver}

Verify ScriptQueue:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ScriptQueue:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=1

#ScriptQueue:2
Verify ScriptQueue:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:2    True

Verify ScriptQueue:2 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    ScriptQueue:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ScriptQueue:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=2    csc_xmlver=${scriptqueue2_xmlver}

Verify ScriptQueue:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ScriptQueue:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=2

#ScriptQueue:3
Verify ScriptQueue:3 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:3    True

Verify ScriptQueue:3 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    ScriptQueue:3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ScriptQueue:3 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=3    csc_xmlver=${scriptqueue3_xmlver}

Verify ScriptQueue:3 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue:3    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ScriptQueue:3 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=3

#Watcher
Verify Watcher Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Watcher    True

Verify Watcher SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    Watcher  logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Watcher SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Watcher    csc_xmlver=${watcher_xmlver}

Verify Watcher SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Watcher ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Watcher

Verify Watcher ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Watcher    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Test:42
Verify Test:42 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Test:42

Verify Test:42 SummaryState timing
    [Tags]    standby    timing
    Verify Time Delta    Test:42    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Test:42 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Test    index=42    csc_xmlver=${test42_xmlver}

Verify Test:42 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Test:42    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Test:42 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Test    index=42

Verify Test:42 ConfigurationsAvailable Event timing
    [Tags]    config_available    timing
    Verify Time Delta    Test:42    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
