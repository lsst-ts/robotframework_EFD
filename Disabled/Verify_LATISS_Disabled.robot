*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    latiss

*** Variables ***
${time_window}    10

*** Test Cases ***
#ATCamera
Verify ATCamera Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATCamera

Verify ATCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATCamera

Verify ATCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATCamera    logevent_summaryState    logevent_configurationApplied    ${time_window}

#ATHeaderService
Verify ATHeaderService Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATHeaderService

Verify ATHeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATHeaderService

#OCPS:1
Verify OCPS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    OCPS:1

Verify OCPS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    index=1

Verify OCPS:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

#ATOODS
Verify ATOODS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATOODS

Verify ATOODS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATOODS  

#ATSpectrograph
Verify ATSpectrograph Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATSpectrograph

Verify ATSpectrograph ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATSpectrograph

Verify ATSpectrograph ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    logevent_configurationApplied    ${time_window}
