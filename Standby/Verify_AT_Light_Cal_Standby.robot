*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***

*** Test Cases ***
Verify ATMonochromator Standby
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[standby]    ATMonochromator

Verify ATMonochromator ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATMonochromator

Verify FiberSpectrograph:3 Standby
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[standby]    FiberSpectrograph:3

Verify FiberSpectrograph:3 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    FiberSpectrograph    3
