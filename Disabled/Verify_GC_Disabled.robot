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
    Verify Time Delta    GenericCamera    command_disable    logevent_summaryState    index=1

Verify GenericCamera:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    GenericCamera    index=1

Verify GenericCamera:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    GenericCamera    command_disable    logevent_configurationApplied    index=1

#GCHeaderService:1
Verify GCHeaderService:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    GCHeaderService:1

Verify GCHeaderService:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    GCHeaderService    command_disable    logevent_summaryState    index=1

Verify GCHeaderService:1 ConfigurationApplied Event
    [Tags]    config_applied
    # Non-configurable: dataframe empty, no timing test.
    Verify ConfigurationApplied    GCHeaderService    index=1
