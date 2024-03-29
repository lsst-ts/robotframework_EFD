*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    obssys

*** Variables ***

*** Test Cases ***
#Authorize
Verify Authorize Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Authorize

Verify Authorize SummaryState timing
    [Tags]    timing
    Verify Time Delta    Authorize    command_enable    logevent_summaryState

#Scheduler:1
Verify Scheduler:1 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:1

Verify Scheduler:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Scheduler    command_enable    logevent_summaryState    index=1

#Scheduler:2
Verify Scheduler:2 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:2

Verify Scheduler:2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Scheduler    command_enable    logevent_summaryState    index=2

#ScriptQueue:1
Verify ScriptQueue:1 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:1

Verify ScriptQueue:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ScriptQueue    command_enable    logevent_summaryState    index=1

#ScriptQueue:2
Verify ScriptQueue:2 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:2

Verify ScriptQueue:2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ScriptQueue    command_enable    logevent_summaryState    index=2

#Watcher
Verify Watcher Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Watcher

Verify Watcher SummaryState timing
    [Tags]    timing
    Verify Time Delta    Watcher    command_enable    logevent_summaryState

#Test:42
Verify Test:42 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Test    index=42

Verify Test:42 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Test    command_enable    logevent_summaryState    index=42
