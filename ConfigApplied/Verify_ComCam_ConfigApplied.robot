*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify CCOODS ConfigurationApplied Event
    [Tags]    comcam
    Verify ConfigurationApplied    CCOODS

Verify CCCamera ConfigurationApplied Event
    [Tags]    comcam
    Verify ConfigurationApplied    CCCamera

Verify CCHeaderService ConfigurationApplied Event
    [Tags]    comcam
    Verify ConfigurationApplied    CCHeaderService
