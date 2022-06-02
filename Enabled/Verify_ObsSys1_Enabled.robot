*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify ScriptQueue:1 Enabled
    [Tags]    obsys1
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:1    True

Verify ScriptQueue:2 Enabled
    [Tags]    obsys1
    Verify Summary State    ${STATES}[enabled]    ScriptQueue:2    True

Verify Watcher Enabled
    [Tags]    obsys1
    Verify Summary State    ${STATES}[enabled]    Watcher    True
