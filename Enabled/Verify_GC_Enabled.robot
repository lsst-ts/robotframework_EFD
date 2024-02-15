*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
# GenericCamera:1
Verify GenericCamera:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GenericCamera:1

Verify GenericCamera:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    GenericCamera    command_enabled    logevent_summaryState    index=1

# GCHeaderService:1
Verify GCHeaderService:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GCHeaderService:1

Verify GCHeaderService:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    GCHeaderService    command_enabled    logevent_summaryState    index=1
