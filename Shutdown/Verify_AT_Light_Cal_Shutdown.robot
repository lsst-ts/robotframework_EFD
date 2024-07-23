*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    skipped

*** Test Cases ***
Verify ATMonochromator Shutdown
    [Tags]    at_light_cal
    Verify Shutdown Process    ATMonochromator

Verify FiberSpectrograph:3 Shutdown
    [Tags]    at_light_cal
    Verify Shutdown Process    FiberSpectrograph    index=3
