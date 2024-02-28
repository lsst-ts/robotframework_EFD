*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    disabled    bigcamera
Suite Setup   Set EFD Values

*** Test Cases ***
#BigCamera
Verify BigCamera Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ${BigCamera}

Verify BigCamera SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${BigCamera}    command_disabled    logevent_summaryState

Verify BigCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${BigCamera}

Verify BigCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ${BigCamera}    command_disabled    logevent_configurationApplied

#OODS
Verify OODS Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ${OODS}

Verify OODS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${OODS}    command_disabled    logevent_summaryState

Verify OODS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${OODS}

Verify OODS ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ${OODS}    command_disabled    logevent_configurationApplied

#HeaderService
Verify HeaderService Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ${HeaderService}

Verify HeaderService SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${HeaderService}    command_disabled    logevent_summaryState

Verify HeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${HeaderService}

Verify HeaderService ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ${HeaderService}    command_disabled    logevent_configurationApplied

#OCPS:2||3
Verify OCPS:2||3 Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    OCPS:${OcpsIndex}

Verify OCPS:2||3 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    command_disabled    logevent_summaryState    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    OCPS    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    OCPS    command_disabled    logevent_configurationApplied    index=${OcpsIndex}
