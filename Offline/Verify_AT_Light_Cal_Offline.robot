*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    offline

*** Variables ***

*** Test Cases ***
Verify ATMonochromator Offline
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[offline]    ATMonochromator

Verify ATMonochromator SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATMonochromator

Verify FiberSpectrograph:3 Offline
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[offline]    FiberSpectrograph:3

Verify FiberSpectrograph SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    FiberSpectrograph    3
