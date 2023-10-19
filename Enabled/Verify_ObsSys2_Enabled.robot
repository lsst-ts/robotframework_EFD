*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify Scheduler:1 Enabled
    [Tags]    obssys2
    Verify Summary State    ${STATES}[enabled]    Scheduler:1

Verify Scheduler:2 Enabled
    [Tags]    obssys2
    Verify Summary State    ${STATES}[enabled]    Scheduler:2
