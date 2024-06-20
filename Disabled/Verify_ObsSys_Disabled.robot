*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obssys

*** Test Cases ***
#Scheduler:1
Verify Scheduler:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=1

Verify Scheduler:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler:1    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Scheduler:2
Verify Scheduler:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify Scheduler:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=2

Verify Scheduler:2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler:2    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Scheduler:3
Verify Scheduler:3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Scheduler:3

Verify Scheduler:3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler:3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Scheduler:3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Scheduler    index=3

Verify Scheduler:3 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Scheduler:3    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ScriptQueue:1
##Auto-Enabled: no timing tests
Verify ScriptQueue:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:1    auto_enable=True

Verify ScriptQueue:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    index=1

#ScriptQueue:2
##Auto-Enabled: no timing tests
Verify ScriptQueue:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:2    auto_enable=True

Verify ScriptQueue:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    index=2

#ScriptQueue:3
##Auto-Enabled: no timing tests
Verify ScriptQueue:3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:3    auto_enable=True

Verify ScriptQueue:3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ScriptQueue    index=3

#Watcher
Verify Watcher Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Watcher

Verify Watcher SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Watcher    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Watcher ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Watcher

Verify Watcher ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Watcher    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Test:42
Verify Test:42 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    Test:42

Verify Test:42 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    Test:42    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify Test:42 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    Test    index=42

Verify Test:42 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    Test:42    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
