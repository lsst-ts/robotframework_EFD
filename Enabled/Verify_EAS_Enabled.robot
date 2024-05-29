*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
#DIMM:1
Verify DIMM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    DIMM    command_enable    logevent_summaryState    index=1

#DIMM:2
Verify DIMM:2 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    timing
    Verify Time Delta    DIMM    command_enable    logevent_summaryState    index=2

#EPM:1
Verify EPM:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    EPM:1

Verify EPM:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    EPM    command_enable    logevent_summaryState    index=1

#ESS:1
Verify ESS:1 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:1

Verify ESS:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=1

# ESS:101
Verify ESS:101 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:101

Verify ESS:101 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=101

# ESS:102
Verify ESS:102 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:102

Verify ESS:102 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=102

# ESS:103
Verify ESS:103 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:103

Verify ESS:103 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=103

# ESS:104
Verify ESS:104 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=104

# ESS:105
Verify ESS:105 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:105

Verify ESS:105 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=105

# ESS:106
Verify ESS:106 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:106

Verify ESS:106 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=106

# ESS:201
Verify ESS:201 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=201

# ESS:202
Verify ESS:202 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=202

# ESS:203
Verify ESS:203 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:203

Verify ESS:203 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=203

# ESS:204
Verify ESS:204 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=204

# ESS:205
Verify ESS:205 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:205

Verify ESS:205 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=205

#ESS:301
Verify ESS:301 Enabled
    [Tags]    eas
    Verify Summary State    ${STATES}[enabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    timing
    Verify Time Delta    ESS    command_enable    logevent_summaryState    index=301
