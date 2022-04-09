*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***
${topic}    logevent_settingsApplied
@{fields}    "private_sndStamp"    "settingsVersion"
${time_window}    10

*** Test Cases ***
Verify ScriptQueue:1 Disabled
    [Tags]    obsys1
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:1

Verify ScriptQueue:2 Disabled
    [Tags]    obsys1
    Verify Summary State    ${STATES}[disabled]    ScriptQueue:2

Verify Watcher Disabled
    [Tags]    obsys1
    Verify Summary State    ${STATES}[disabled]    Watcher
    ${watcher_disabled_event_timestamp}=    Get Topic Sent Time    ${STATES}[disabled]    Watcher
    ${watcher_disabled_event_timestamp}=    Split String    ${watcher_disabled_event_timestamp}    T
    Set Suite Variable    ${watcher_disabled_event_time}    ${watcher_disabled_event_timestamp}[1]

Verify Watcher Disabled timing
    [Tags]    obsys1
    Verify Time Delta    Watcher    logevent_summaryState    ${topic}    ${time_window}
    ${watcher_disabled_event_time}=    Convert Time    ${watcher_disabled_event_time}    number
    ${watcher_settingsapplied_event_time}=    Convert Time    ${watcher_settingsapplied_event_time}    number
    ${delta}=    Subtract Time from Time    ${watcher_disabled_event_time}    ${watcher_settingsapplied_event_time}
    ${delta}=    Subtract Time from Time    ${watcher_settingsapplied_event_time}    ${watcher_disabled_event_time}
    Should Be True    ${delta} < ${time_window}
