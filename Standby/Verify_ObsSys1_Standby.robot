*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Force Tags    obsys1

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ScriptQueue:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:1    True

Verify ScriptQueue:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ScriptQueue    1

Verify ScriptQueue:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify ScriptQueue:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=1

Verify ScriptQueue:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ScriptQueue:2    True

Verify ScriptQueue:2 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ScriptQueue    2

Verify ScriptQueue:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    logevent_summaryState    logevent_softwareVersions    ${time_window}    2

Verify ScriptQueue:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ScriptQueue    index=2

Verify Watcher Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Watcher    True

Verify Watcher SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    Watcher

Verify Watcher SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify Watcher ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Watcher

Verify Watcher ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Watcher    logevent_summaryState    logevent_configurationsAvailable    ${time_window}
