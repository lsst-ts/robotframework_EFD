*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***

*** Test Cases ***
Verify Scheduler:1 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:2 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify OCPS:1 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    OCPS:1

Verify OCPS:2 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    OCPS:2
