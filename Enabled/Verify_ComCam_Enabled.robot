*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify CCArchiver Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    CCArchiver

Verify CCCamera Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    CCCamera

Verify CCHeaderService Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    CCHeaderService
