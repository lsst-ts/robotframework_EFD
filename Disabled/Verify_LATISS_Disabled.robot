*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    latiss

*** Test Cases ***
#ATCamera
Verify ATCamera Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATCamera

Verify ATCamera SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATCamera    command_start    logevent_summaryState

Verify ATCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATCamera

Verify ATCamera ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATCamera    command_start    logevent_configurationApplied

#ATHeaderService
Verify ATHeaderService Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATHeaderService

Verify ATHeaderService SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHeaderService    command_start    logevent_summaryState

Verify ATHeaderService ConfigurationApplied Event
    [Tags]    config_applied
    # Non-configurable: dataframe empty, no timing test.
    Verify ConfigurationApplied    ATHeaderService

#OCPS:1
Verify OCPS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    OCPS:1

Verify OCPS:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    command_start    logevent_summaryState    index=1

Verify OCPS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    index=1

Verify OCPS:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    command_start    logevent_configurationApplied    index=1

#ATOODS
Verify ATOODS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATOODS

Verify ATOODS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATOODS    command_start    logevent_summaryState

Verify ATOODS ConfigurationApplied Event
    [Tags]    config_applied
    # Non-configurable: dataframe empty, no timing test.
    Verify ConfigurationApplied    ATOODS  

#ATSpectrograph
Verify ATSpectrograph Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATSpectrograph

Verify ATSpectrograph SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATSpectrograph    command_start    logevent_summaryState

Verify ATSpectrograph ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATSpectrograph

Verify ATSpectrograph ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATSpectrograph    command_start    logevent_configurationApplied
