*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    bigcamera
Suite Setup   Set EFD Values

*** Variables ***

*** Test Cases ***
#BigCamera
Verify BigCamera Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ${BigCamera}

Verify BigCamera SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${BigCamera}    command_enable    logevent_summaryState

#OODS
Verify OODS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ${OODS}

Verify OODS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${OODS}    command_enable    logevent_summaryState

#HeaderService
Verify HeaderService Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ${HeaderService}

Verify HeaderService SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${HeaderService}    command_enable    logevent_summaryState

#OCPS:2||3
Verify OCPS:2||3 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    OCPS:${OcpsIndex}

Verify OCPS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${OCPS}    command_enable    logevent_summaryState    index=${OcpsIndex}
