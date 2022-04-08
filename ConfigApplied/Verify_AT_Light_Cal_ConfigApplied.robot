*** Settings ***
Library    QueryEfd
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource
Force Tags    config_applied

*** Test Cases ***
Verify ATMonochromator ConfigurationApplied Event
    [Tags]    at_light_cal
    Verify ConfigurationApplied    ATMonochromator

Verify FiberSpectrograph:3 ConfigurationApplied Event
    [Tags]    at_light_cal
    Verify ConfigurationApplied    FiberSpectrograph    index=3
