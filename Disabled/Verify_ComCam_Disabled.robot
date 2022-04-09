*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify CCOODS Disabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[disabled]    CCOODS

Verify CCCamera Disabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[disabled]    CCCamera

Verify CCHeaderService Disabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[disabled]    CCHeaderService
