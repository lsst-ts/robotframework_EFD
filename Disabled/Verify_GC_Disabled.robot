*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    gc

*** Variables ***
${time_window}    10

*** Test Cases ***
Execute GenCam Standby to Disabled
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    gencam_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify GenericCamera:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    GenericCamera:1

Verify GenericCamera:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    GenericCamera    1

Verify GenericCamera:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    GenericCamera    logevent_summaryState    logevent_configurationApplied    ${time_window}    1

Verify GCHeaderService:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    GCHeaderService:1

Verify GCHeaderService:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    GCHeaderService    1
