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
    [Tags]    at_light_cal    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#FiberSpectrograph:3
Verify FiberSpectrograph:3 Enabled
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[enabled]    FiberSpectrograph:3

Verify FiberSpectrograph:3 SummaryState timing
    [Tags]    at_light_cal    timing
    Verify Time Delta    FiberSpectrograph:3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
