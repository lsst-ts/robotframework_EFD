*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***

*** Test Cases ***
Verify ScriptQueue:1 Offline
    [Tags]    obsys1
    Verify Summary State    ${STATES}[offline]    ScriptQueue:1

Verify ScriptQueue:2 Offline
    [Tags]    obsys1
    Verify Summary State    ${STATES}[offline]    ScriptQueue:2

Verify ScriptQueue:2 SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ScriptQueue    2

Verify Watcher Offline
    [Tags]    obsys1
    Verify Summary State    ${STATES}[offline]    Watcher
