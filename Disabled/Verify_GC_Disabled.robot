*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    gc

*** Test Cases ***
#GenericCamera:1
Verify GenericCamera:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    GenericCamera:1

Verify GenericCamera:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    GenericCamera:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify GenericCamera:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    GenericCamera    index=1

Verify GenericCamera:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    GenericCamera:1    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#GCHeaderService:1
Verify GCHeaderService:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    GCHeaderService:1

Verify GCHeaderService:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    GCHeaderService:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify GCHeaderService:1 ConfigurationApplied Event
    [Tags]    config_applied
    # Non-configurable: dataframe empty, no timing test.
    Verify ConfigurationApplied    GCHeaderService    index=1
