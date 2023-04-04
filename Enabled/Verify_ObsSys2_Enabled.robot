*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify Scheduler:1 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    Scheduler:1

Verify Scheduler:2 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    Scheduler:2

Verify OCPS:1 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    OCPS:1

Verify OCPS:2 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    OCPS:2
