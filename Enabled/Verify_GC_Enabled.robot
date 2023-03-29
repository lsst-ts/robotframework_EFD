*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Execute GenCam Disabled to Enabled
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    gencam_disabled_enabled.py
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify GenericCamera:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GenericCamera:1

Verify GCHeaderService:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GCHeaderService:1
