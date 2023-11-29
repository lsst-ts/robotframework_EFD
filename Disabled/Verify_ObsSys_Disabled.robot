*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys

*** Test Cases ***
#Authorize
Verify Authorize Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Authorize    auto_enable=True

Verify Authorize ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Authorize

Verify Authorize ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Authorize    logevent_summaryState    logevent_configurationApplied

#Scheduler:1
Verify Scheduler:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=1

Verify Scheduler:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    index=1

#Scheduler:2
Verify Scheduler:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=2

Verify Scheduler:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationApplied    index=2

#ScriptQueue1
Verify ScriptQueue:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:1    auto_enable=True

Verify ScriptQueue:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    1

#ScriptQueue2
Verify ScriptQueue:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:2    auto_enable=True

Verify ScriptQueue:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    2

#Watcher
Verify Watcher Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Watcher    auto_enable=True

Verify Watcher ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Watcher

Verify Watcher ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    Watcher    logevent_summaryState    logevent_configurationApplied
