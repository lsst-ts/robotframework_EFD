*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    bigcamera
Suite Setup   Set EFD Values

*** Variables ***

*** Test Cases ***
Verify BigCamera Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ${BigCamera}

Verify OODS Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ${OODS}

Verify HeaderService Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    ${HeaderService}

Verify OCPS:2||3 Enabled
    [Tags]
    Verify Summary State    ${STATES}[enabled]    OCPS:${OcpsIndex}
