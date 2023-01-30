*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify DSM:1 Enabled
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[enabled]    DSM:1

Verify DSM:2 Enabled
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[enabled]    DSM:2
