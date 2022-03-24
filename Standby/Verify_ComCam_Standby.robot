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
Verify CCArchiver Standby
    [Tags]    comcam
    Verify Summary State    ${STATES}[standby]    CCArchiver

Verify CCCamera Standby
    [Tags]    comcam
    Verify Summary State    ${STATES}[standby]    CCCamera

Verify CCHeaderService Standby
    [Tags]    comcam
    Verify Summary State    ${STATES}[standby]    CCHeaderService
