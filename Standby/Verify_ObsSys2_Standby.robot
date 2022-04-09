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
Verify Scheduler:1 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    Scheduler    1

Verify Scheduler:2 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    Scheduler    2

Verify OCPS:1 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    OCPS:1

Verify OCPS:1 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    OCPS    1

Verify OCPS:2 Standby
    [Tags]    obsys2
    Verify Summary State    ${STATES}[standby]    OCPS:2

Verify OCPS:2 ConfigurationsAvailable
    [Tags]    atcs
    Verify ConfigurationsAvailable    OCPS    2
