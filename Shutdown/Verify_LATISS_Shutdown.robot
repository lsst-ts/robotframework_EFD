*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Test Cases ***
Verify ATCamera Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATCamera

Verify ATHeaderService Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATHeaderService

Verify OCPS:1 Shutdown
    [Tags]    obsys2
    Verify Shutdown Process    OCPS    index=1

Verify ATOODS Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATOODS

Verify ATSpectrograph Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATSpectrograph
