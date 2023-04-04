*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    obsys1

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify Authorize Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Authorize    auto_enable=True

Verify Authorize ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Authorize

Verify Authorize ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Authorize    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify ScriptQueue:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:1    auto_enable=True

Verify ScriptQueue:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    1

Verify ScriptQueue:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:2    auto_enable=True

Verify ScriptQueue:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    2

Verify Watcher Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Watcher    auto_enable=True

Verify Watcher ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Watcher

Verify Watcher ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Watcher    logevent_summaryState    logevent_configurationApplied    ${time_window}
