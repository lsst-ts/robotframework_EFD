*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify ATOODS ConfigurationApplied Event
    [Tags]    latiss
    Verify ConfigurationApplied    ATOODS

Verify ATCamera ConfigurationApplied Event
    [Tags]    latiss
    Verify ConfigurationApplied    ATCamera

Verify ATHeaderService ConfigurationApplied Event
    [Tags]    latiss
    Verify ConfigurationApplied    ATHeaderService

Verify ATSpectrograph ConfigurationApplied Event
    [Tags]    latiss
    Verify ConfigurationApplied    ATSpectrograph
