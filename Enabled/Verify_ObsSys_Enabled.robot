*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    obssys

*** Variables ***

*** Test Cases ***
Verify Authorize Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Authorize

Verify Scheduler:1 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:1

Verify Scheduler:2 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Scheduler:2

Verify ScriptQueue:1 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:1

Verify ScriptQueue:2 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:2

Verify Watcher Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    Watcher
