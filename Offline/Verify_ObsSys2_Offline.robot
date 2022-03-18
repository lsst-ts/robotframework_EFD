*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***

*** Test Cases ***
Verify Scheduler:1 Offline
    [Tags]    obsys2
    Verify Summary State    ${STATES}[offline]    Scheduler:1

Verify Scheduler:2 Offline
    [Tags]    obsys2
    Verify Summary State    ${STATES}[offline]    Scheduler:2

Verify Scheduler:2 SoftwareVersions
    [Tags]    obsys2 
    Verify SoftwareVersions    Scheduler    2

Verify OCPS:1 Offline
    [Tags]    obsys2
    Verify Summary State    ${STATES}[offline]    OCPS:1

Verify OCPS:2 Offline
    [Tags]    obsys2
    Verify Summary State    ${STATES}[offline]    OCPS:2
