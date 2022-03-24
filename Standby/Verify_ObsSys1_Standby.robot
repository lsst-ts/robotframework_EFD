*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***

*** Test Cases ***
Verify ScriptQueue:1 Standby
    [Tags]    obsys1
    Verify Summary State    ${STATES}[standby]    ScriptQueue:1

Verify ScriptQueue:2 Standby
    [Tags]    obsys1
    Verify Summary State    ${STATES}[standby]    ScriptQueue:2

Verify Watcher Standby
    [Tags]    obsys1
    Verify Summary State    ${STATES}[standby]    Watcher
