*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify DIMM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify ESS:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:1

# ESS:10x
Verify ESS:101 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:101

Verify ESS:102 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:102

Verify ESS:103 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:103

Verify ESS:104 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:104

Verify ESS:105 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:105

# ESS:20x
Verify ESS:201 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:201

Verify ESS:202 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:202

Verify ESS:203 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:203

Verify ESS:204 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:204

#ESS:301
Verify ESS:301 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:301
