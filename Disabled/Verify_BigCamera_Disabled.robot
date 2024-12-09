*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    disabled
Suite Setup   Set EFD Values

*** Test Cases ***
#BigCamera
Verify BigCamera Disabled
    [Tags]
    Set Tags    ${BigCamera}
    Verify Summary State    ${STATES}[disabled]    ${BigCamera}

Verify BigCamera SummaryState timing
    [Tags]    software_versions    timing
    Set Tags    ${BigCamera}
    Verify Time Delta    ${BigCamera}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify BigCamera ConfigurationApplied Event
    [Tags]    config_applied
    Set Tags    ${BigCamera}
    Verify ConfigurationApplied    ${BigCamera}

Verify BigCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Set Tags    ${BigCamera}
    Verify Time Delta    ${BigCamera}    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#OODS
Verify OODS Disabled
    [Tags]
    Set Tags    ${OODS}
    Verify Summary State    ${STATES}[disabled]    ${OODS}

Verify OODS SummaryState timing
    [Tags]    software_versions    timing
    Set Tags    ${OODS}
    Verify Time Delta    ${OODS}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify OODS ConfigurationApplied Event
    [Tags]    config_applied
    Set Tags    ${OODS}
    # OODS CSCs are NOT configurable.
    Verify ConfigurationApplied    ${OODS}

#HeaderService
Verify HeaderService Disabled
    [Tags]
    Set Tags    ${HeaderService}
    Verify Summary State    ${STATES}[disabled]    ${HeaderService}

Verify HeaderService SummaryState timing
    [Tags]    software_versions    timing
    Set Tags    ${HeaderService}
    # HeaderService CSCs are NOT configurable.
    Verify Time Delta    ${HeaderService}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify HeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Set Tags    ${HeaderService}
    Verify ConfigurationApplied    ${HeaderService}

#OCPS:2||3
Verify OCPS:2||3 Disabled
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    Verify Summary State    ${STATES}[disabled]    OCPS:${OcpsIndex}

Verify OCPS:2||3 SummaryState timing
    [Tags]    software_versions    timing
    Set Tags    OCPS:${OcpsIndex}
    Verify Time Delta    OCPS:${OcpsIndex}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify OCPS:2||3 ConfigurationApplied Event
    [Tags]    config_applied
    Set Tags    OCPS:${OcpsIndex}
    Verify ConfigurationApplied    OCPS    index=${OcpsIndex}

Verify OCPS:2||3 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Set Tags    OCPS:${OcpsIndex}
    Verify Time Delta    OCPS:${OcpsIndex}    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
