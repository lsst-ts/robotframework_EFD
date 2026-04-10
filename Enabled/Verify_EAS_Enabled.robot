*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    envsys

*** Variables ***

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Enabled
    [Tags]    dimm1    enabled
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    dimm1    enabled    timing
    Verify Time Delta    DIMM:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 Enabled
    [Tags]    dimm2    enabled
    Verify Summary State    ${STATES}[enabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    dimm2    enabled    timing
    Verify Time Delta    DIMM:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DREAM
Verify DREAM Enabled
    [Tags]    dream    enabled
    Verify Summary State    ${STATES}[enabled]    DREAM

Verify DREAM SummaryState timing
    [Tags]    dream    enabled    timing
    Verify Time Delta    DREAM    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# EAS
Verify EAS Enabled
    [Tags]    eas    enabled
    Verify Summary State    ${STATES}[enabled]    EAS

Verify EAS SummaryState timing
    [Tags]    eas    enabled    timing
    Verify Time Delta    EAS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Enabled
    [Tags]    ess104    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    ess104    enabled    timing
    Verify Time Delta    ESS:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Enabled
    [Tags]    ess105    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:105

Verify ESS:105 SummaryState timing
    [Tags]    ess105    enabled    timing
    Verify Time Delta    ESS:105    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Enabled
    [Tags]    ess106    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:106

Verify ESS:106 SummaryState timing
    [Tags]    ess106    enabled    timing
    Verify Time Delta    ESS:106    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 Enabled
    [Tags]    ess109    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:109

Verify ESS:109 SummaryState timing
    [Tags]    ess109    enabled    timing
    Verify Time Delta    ESS:109    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 Enabled
    [Tags]    ess110    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:110

Verify ESS:110 SummaryState timing
    [Tags]    ess110    enabled    timing
    Verify Time Delta    ESS:110    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 Enabled
    [Tags]    ess111    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:111

Verify ESS:111 SummaryState timing
    [Tags]    ess111    enabled    timing
    Verify Time Delta    ESS:111    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112    
Verify ESS:112 Enabled
    [Tags]    ess112    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:112

Verify ESS:112 SummaryState timing
    [Tags]    ess112    enabled    timing
    Verify Time Delta    ESS:112    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113    
Verify ESS:113 Enabled
    [Tags]    ess113    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:113

Verify ESS:113 SummaryState timing
    [Tags]    ess113    enabled    timing
    Verify Time Delta    ESS:113    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:114    
Verify ESS:114 Enabled
    [Tags]    ess114    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:114

Verify ESS:114 SummaryState timing
    [Tags]    ess114    enabled    timing
    Verify Time Delta    ESS:114    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:115    
Verify ESS:115 Enabled
    [Tags]    ess115    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:115

Verify ESS:115 SummaryState timing
    [Tags]    ess115    enabled    timing
    Verify Time Delta    ESS:115    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:116    
Verify ESS:116 Enabled
    [Tags]    ess116    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:116

Verify ESS:116 SummaryState timing
    [Tags]    ess116    enabled    timing
    Verify Time Delta    ESS:116    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:117    
Verify ESS:117 Enabled
    [Tags]    ess117    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:117

Verify ESS:117 SummaryState timing
    [Tags]    ess117    enabled    timing
    Verify Time Delta    ESS:117    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:121
Verify ESS:121 Enabled
    [Tags]    ess121    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:121

Verify ESS:121 SummaryState timing
    [Tags]    ess121    enabled    timing
    Verify Time Delta    ESS:121    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:122
Verify ESS:122 Enabled
    [Tags]    ess122    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:122

Verify ESS:122 SummaryState timing
    [Tags]    ess122    enabled    timing
    Verify Time Delta    ESS:122    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:123
Verify ESS:123 Enabled
    [Tags]    ess123    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:123
    
Verify ESS:123 SummaryState timing 
    [Tags]    ess123    enabled    timing
    Verify Time Delta    ESS:123    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:124
Verify ESS:124 Enabled
    [Tags]    ess124    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:124
    
Verify ESS:124 SummaryState timing 
    [Tags]    ess124    enabled    timing
    Verify Time Delta    ESS:124    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:125
Verify ESS:125 Enabled
    [Tags]    ess125    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:125
    
Verify ESS:125 SummaryState timing 
    [Tags]    ess125    enabled    timing
    Verify Time Delta    ESS:125    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:126
Verify ESS:126 Enabled
    [Tags]    ess126    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:126
    
Verify ESS:126 SummaryState timing 
    [Tags]    ess126    enabled    timing
    Verify Time Delta    ESS:126    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:127
Verify ESS:127 Enabled
    [Tags]    ess127    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:127
    
Verify ESS:127 SummaryState timing
    [Tags]    ess127    enabled    timing
    Verify Time Delta    ESS:127    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# ESS:128
Verify ESS:128 Enabled
    [Tags]    ess128    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:128
    
Verify ESS:128 SummaryState timing
    [Tags]    ess128    enabled    timing
    Verify Time Delta    ESS:128    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:129
Verify ESS:129 Enabled
    [Tags]    ess129    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:129

Verify ESS:129 SummaryState timing
    [Tags]    ess129    enabled    timing
    Verify Time Delta    ESS:129    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Enabled
    [Tags]    ess201    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    ess201    enabled    timing
    Verify Time Delta    ESS:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Enabled
    [Tags]    ess202    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    ess202    enabled    timing
    Verify Time Delta    ESS:202    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Enabled
    [Tags]    ess204    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    ess204    enabled    timing
    Verify Time Delta    ESS:204    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
Verify ESS:301 Enabled
    [Tags]    ess301    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    ess301    enabled    timing
    Verify Time Delta    ESS:301    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:303
Verify ESS:303 Enabled
    [Tags]    ess303    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:303

Verify ESS:303 SummaryState timing
    [Tags]    ess303    enabled    timing
    Verify Time Delta    ESS:303    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:304
Verify ESS:304 Enabled
    [Tags]    ess304    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:304

Verify ESS:304 SummaryState timing
    [Tags]    ess304    enabled    timing
    Verify Time Delta    ESS:304    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:305
Verify ESS:305 Enabled
    [Tags]    ess305    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:305
    
Verify ESS:305 SummaryState timing
    [Tags]    ess305    enabled    timing
    Verify Time Delta    ESS:305    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:306
Verify ESS:306 Enabled
    [Tags]    ess306    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:306
    
Verify ESS:306 SummaryState timing
    [Tags]    ess306    enabled    timing
    Verify Time Delta    ESS:306    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:308
Verify ESS:308 Enabled
    [Tags]    ess308    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:308

Verify ESS:308 SummaryState timing
    [Tags]    ess308    enabled    timing
    Verify Time Delta    ESS:308    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# ESS:404
Verify ESS:404 Enabled
    [Tags]    ess404    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:404

Verify ESS:404 SummaryState timing
    [Tags]    ess404    enabled    timing
    Verify Time Delta    ESS:404    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# ESS:405
Verify ESS:405 Enabled
    [Tags]    ess404    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:405

Verify ESS:405 SummaryState timing
    [Tags]    ess404    enabled    timing
    Verify Time Delta    ESS:405    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:441    
Verify ESS:441 Enabled
    [Tags]    ess441    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:441

Verify ESS:441 SummaryState timing
    [Tags]    ess441    enabled    timing
    Verify Time Delta    ESS:441    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:442    
Verify ESS:442 Enabled
    [Tags]    ess442    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:442

Verify ESS:442 SummaryState timing
    [Tags]    ess442    enabled    timing
    Verify Time Delta    ESS:442    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:443
Verify ESS:443 Enabled
    [Tags]    ess443    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:443

Verify ESS:443 SummaryState timing
    [Tags]    ess443    enabled    timing
    Verify Time Delta    ESS:443    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
