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
Verify ATOODS Standby
    [Tags]    latiss
    Verify Summary State    ${STATES}[standby]    ATOODS

Verify ATCamera Standby
    [Tags]    latiss
    Verify Summary State    ${STATES}[standby]    ATCamera

Verify ATCamera ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATCamera

Verify ATHeaderService Standby
    [Tags]    latiss
    Verify Summary State    ${STATES}[standby]    ATHeaderService

Verify ATSpectrograph Standby
    [Tags]    latiss
    Verify Summary State    ${STATES}[standby]    ATSpectrograph

Verify ATSpectrograph ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    ATSpectrograph
