*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    software_versions

*** Variables ***

*** Test Cases ***
Verify ScriptQueue:1 SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ScriptQueue    1

Verify ScriptQueue:2 SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ScriptQueue    2

Verify Watcher SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    Watcher
