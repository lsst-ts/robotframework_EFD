*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify Authorize Enabled
    [Tags]    obssys1
    Verify Summary State    ${STATES}[enabled]    Authorize

Verify ScriptQueue:1 Enabled
    [Tags]    obssys1
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:1

Verify ScriptQueue:2 Enabled
    [Tags]    obssys1
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:2

Verify Watcher Enabled
    [Tags]    obssys1
    Verify Summary State    ${STATES}[enabled]    Watcher
