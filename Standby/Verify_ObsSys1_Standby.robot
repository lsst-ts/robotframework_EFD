*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys1

*** Variables ***
${authorize_salver}    ${SALVersion}
${authorize_xmlver}    ${XMLVersion}
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

Verify Authorize SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Authorize    csc_salver=${authorize_salver}    csc_xmlver=${authorize_xmlver}

Verify Authorize SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Authorize    logevent_summaryState    logevent_softwareVersions

#ScriptQueue:1
Verify ScriptQueue:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:1    True

Verify ScriptQueue:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ScriptQueue    index=1    csc_salver=${scriptqueue1_salver}    csc_xmlver=${scriptqueue1_xmlver}

Verify ScriptQueue:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_summaryState    logevent_softwareVersions    index=1

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
    Verify Time Delta    ScriptQueue    logevent_summaryState    logevent_softwareVersions    index=2

Verify ScriptQueue:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=2

#Watcher
Verify Watcher Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Watcher    True

Verify Watcher SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    Watcher    csc_salver=${watcher_salver}    csc_xmlver=${watcher_xmlver}

Verify Watcher SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    logevent_summaryState    logevent_softwareVersions

Verify Watcher ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Watcher

Verify Watcher ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Watcher    logevent_summaryState    logevent_configurationsAvailable
