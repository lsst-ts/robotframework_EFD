*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas

*** Variables ***

*** Test Cases ***
#DIMM:1
Verify DIMM:1 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    DIMM:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#DIMM:2
Verify DIMM:2 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    DIMM:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#EPM:1
Verify EPM:1 Enabled
    [Tags]    epm:1    enabled
    Verify Summary State    ${STATES}[enabled]    EPM:1

Verify EPM:1 SummaryState timing
    [Tags]    epm:1    enabled    timing
    Verify Time Delta    EPM:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ESS:1
Verify ESS:1 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:1

Verify ESS:1 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:105

Verify ESS:105 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:105    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:106

Verify ESS:106 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:106    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:107

Verify ESS:107 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:107    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:108

Verify ESS:108 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:108    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:109

Verify ESS:109 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:109    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:110

Verify ESS:110 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:110    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:111

Verify ESS:111 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:111    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112    
Verify ESS:112 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:112

Verify ESS:112 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:112    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113    
Verify ESS:113 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:113

Verify ESS:113 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:113    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:202    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:203

Verify ESS:203 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:203    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:204    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ESS:301
Verify ESS:301 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:301    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
