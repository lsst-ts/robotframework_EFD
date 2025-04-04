*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    obssys

*** Variables ***

*** Test Cases ***
#OCPS:101
Verify OCPS:101 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    OCPS:101

Verify OCPS:101 SummaryState timing
    [Tags]    timing
    Verify Time Delta    OCPS:101    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Scheduler:1
Verify Scheduler:1 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:1

Verify Scheduler:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Scheduler:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Scheduler:2
Verify Scheduler:2 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:2

Verify Scheduler:2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Scheduler:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Scheduler:3
Verify Scheduler:3 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:3

Verify Scheduler:3 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Scheduler:3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ScriptQueue:1
Verify ScriptQueue:1 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:1

#ScriptQueue:2
Verify ScriptQueue:2 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:2

#ScriptQueue:3
Verify ScriptQueue:3 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:3

#Watcher
Verify Watcher Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Watcher

Verify Watcher SummaryState timing
    [Tags]    timing
    Verify Time Delta    Watcher    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Test:42
Verify Test:42 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Test:42

Verify Test:42 SummaryState timing
    [Tags]    timing
    Verify Time Delta    Test:42    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
