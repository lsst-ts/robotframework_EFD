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
    [Tags]    timing
    Verify Time Delta    GenericCamera:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# GCHeaderService:1
Verify GCHeaderService:1 Enabled
    [Tags]    gc
    Verify Summary State    ${STATES}[enabled]    GCHeaderService:1

Verify GCHeaderService:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    GCHeaderService:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
