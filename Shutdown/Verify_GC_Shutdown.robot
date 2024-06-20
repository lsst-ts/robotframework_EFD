*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Test Cases ***
Verify GenericCamera:1 Shutdown
    [Tags]    gc
    Verify Shutdown Process    GenericCamera    index=1

Verify GCHeaderService:1 Shutdown
    [Tags]    gc
    Verify Shutdown Process    GCHeaderService    index=1
