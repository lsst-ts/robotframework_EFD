*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Force Tags    enabled    skipped

*** Variables ***

*** Test Cases ***
Verify ATMonochromator Enabled
    [Tags]    at_light_cal
    Log    ${STATES}[enabled]
    Verify Summary State    ${STATES}[enabled]    ATMonochromator

Verify FiberSpectrograph:3 Enabled
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[enabled]    FiberSpectrograph:3
