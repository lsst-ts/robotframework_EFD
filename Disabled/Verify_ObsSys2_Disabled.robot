*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify Scheduler:1 Disabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[disabled]    Scheduler:1

Verify Scheduler:2 Disabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[disabled]    Scheduler:2

Verify OCPS:1 Disabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[disabled]    OCPS:1

Verify OCPS:2 Disabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[disabled]    OCPS:2
