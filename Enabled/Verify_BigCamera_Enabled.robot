*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled
Suite Setup   Set EFD Values

*** Variables ***

*** Test Cases ***
#BigCamera
Verify BigCamera Enabled
    [Tags]
    Set Tags    ${BigCamera}
    Verify Summary State    ${STATES}[enabled]    ${BigCamera}

Verify BigCamera SummaryState timing
    [Tags]    timing
    Set Tags    ${BigCamera}
    Verify Time Delta    ${BigCamera}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#OODS
Verify OODS Enabled
    [Tags]
    Set Tags    ${OODS}
    Verify Summary State    ${STATES}[enabled]    ${OODS}

Verify OODS SummaryState timing
    [Tags]    timing
    Set Tags    ${OODS}
    Verify Time Delta    ${OODS}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#HeaderService
Verify HeaderService Enabled
    [Tags]
    Set Tags    ${HeaderService}
    Verify Summary State    ${STATES}[enabled]    ${HeaderService}

Verify HeaderService SummaryState timing
    [Tags]    timing
    Set Tags    ${HeaderService}
    Verify Time Delta    ${HeaderService}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#OCPS:2||3
Verify OCPS:2||3 Enabled
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    Verify Summary State    ${STATES}[enabled]    OCPS:${OcpsIndex}

Verify OCPS SummaryState timing
    [Tags]    timing
    Set Tags    OCPS:${OcpsIndex}
    Verify Time Delta    OCPS:${OcpsIndex}    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
