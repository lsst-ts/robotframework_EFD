*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify ATMonochromator Disabled
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[disabled]    ATMonochromator

Verify FiberSpectrograph:3 Disabled
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[disabled]    FiberSpectrograph:3
