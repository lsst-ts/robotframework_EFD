*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify ATOODS Disabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[disabled]    ATOODS

Verify ATCamera Disabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[disabled]    ATCamera

Verify ATHeaderService Disabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[disabled]    ATHeaderService

Verify ATSpectrograph Disabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[disabled]    ATSpectrograph
