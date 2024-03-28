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

Verify Authorize SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Authorize    command_disable    logevent_summaryState

Verify Authorize ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Authorize

Verify Authorize ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Authorize    command_disable    logevent_configurationApplied

#Scheduler:1
Verify Scheduler:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    command_disable    logevent_summaryState    index=1

Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=1

Verify Scheduler:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    command_disable    logevent_configurationApplied    index=1

#Scheduler:2
Verify Scheduler:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify Scheduler:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    command_disable    logevent_summaryState    index=2

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=2

Verify Scheduler:2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler    command_disable    logevent_configurationApplied    index=2

#ScriptQueue1
Verify ScriptQueue:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:1    auto_enable=True

Verify ScriptQueue:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    command_disable    logevent_summaryState    index=1

Verify ScriptQueue:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    index=1

#ScriptQueue2
Verify ScriptQueue:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:2    auto_enable=True

Verify ScriptQueue:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ScriptQueue    command_disable    logevent_summaryState    index=2

Verify ScriptQueue:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    index=2

#Watcher
Verify Watcher Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Watcher

Verify Watcher SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    command_disable    logevent_summaryState

Verify Watcher ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Watcher

Verify Watcher ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Watcher    command_disable    logevent_configurationApplied

#Test:42
Verify Test:42 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Test:42

Verify Test:42 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Test    command_disable    logevent_summaryState    index=42

Verify Test:42 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Test    index=42

Verify Test:42 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Test    command_disable    logevent_configurationApplied    index=42
