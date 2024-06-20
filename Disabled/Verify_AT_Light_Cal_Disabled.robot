*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    at_light_cal    skipped

*** Test Cases ***
#ATMonochromator
Verify ATMonochromator Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATMonochromator

Verify ATMonochromator SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMonochromator    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATMonochromator ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATMonochromator

Verify ATMonochromator ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATMonochromator    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#FiberSpectrograph:3
Verify FiberSpectrograph:3 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    FiberSpectrograph:3

Verify FiberSpectrograph:3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    FiberSpectrograph:3    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify FiberSpectrograph:3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    FiberSpectrograph    index=3

Verify FiberSpectrograph:3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    FiberSpectrograph:3    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
