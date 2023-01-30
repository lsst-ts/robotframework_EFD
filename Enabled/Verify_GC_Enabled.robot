*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify GenericCamera:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GenericCamera:1

Verify GCHeaderService:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GCHeaderService:1
