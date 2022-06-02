*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify ATOODS Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATOODS

Verify ATCamera Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATCamera

Verify ATHeaderService Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATHeaderService

Verify ATSpectrograph Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATSpectrograph
