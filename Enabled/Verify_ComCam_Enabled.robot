*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify CCOODS Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    CCOODS

Verify CCCamera Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    CCCamera

Verify CCHeaderService Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    CCHeaderService
