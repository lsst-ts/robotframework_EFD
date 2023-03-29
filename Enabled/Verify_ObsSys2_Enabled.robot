*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Execute ObsSys2 Disabled to Enabled
    [Tags]    
    ${scripts}    ${states}=    Execute Integration Test    obssys2_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

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
