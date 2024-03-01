*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    skipped

*** Variables ***

*** Test Cases ***
#ATMonochromator
Verify ATMonochromator Enabled
    [Tags]    at_light_cal
    Log    ${STATES}[enabled]
    Verify Summary State    ${STATES}[enabled]    ATMonochromator

Verify ATMonochromator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    command_enable    logevent_summaryState

#FiberSpectrograph:3
Verify FiberSpectrograph:3 Enabled
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[enabled]    FiberSpectrograph:3

Verify FiberSpectrograph:3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    FiberSpectrograph    command_enable    logevent_summaryState    index=3
