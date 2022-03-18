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
Verify DSM:1 Offline
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[disabled]    DSM:1    True

Verify DSM:2 Offline
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[offline]    DSM:2    True
