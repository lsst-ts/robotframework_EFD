*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    disabled    bigcamera
Suite Setup   Set EFD Values

*** Variables ***
${time_window}    10

*** Test Cases ***
#BigCamera
Verify BigCamera Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ${BigCamera}

Verify BigCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${BigCamera}

Verify BigCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ${BigCamera}    logevent_summaryState    logevent_configurationApplied    ${time_window}

#OODS
Verify OODS Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ${OODS}

Verify OODS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${OODS}

#HeaderService
Verify HeaderService Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ${HeaderService}

Verify HeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${HeaderService}

#OCPS:2||3
Verify OCPS:2||3 Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    OCPS:${OcpsIndex}

Verify OCPS:2||3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=${OcpsIndex}
