*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    envsys

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Disabled
    [Tags]    dimm1    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    dimm1    disabled    timing
    Verify Time Delta    DIMM:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:1 ConfigurationApplied Event
    [Tags]    dimm1    config_applied
    Verify ConfigurationApplied    DIMM    index=1

Verify DIMM:1 ConfigurationApplied Event timing
    [Tags]    dimm1    config_applied    timing
    Verify Time Delta    DIMM:1    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 Disabled
    [Tags]    dimm2    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    dimm2    disabled    timing
    Verify Time Delta    DIMM:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:2 ConfigurationApplied Event
    [Tags]    dimm2    config_applied
    Verify ConfigurationApplied    DIMM    index=2

Verify DIMM:2 ConfigurationApplied Event timing
    [Tags]    dimm2    config_applied    timing
    Verify Time Delta    DIMM    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DREAM
Verify DREAM Disabled
    [Tags]    dream    disabled
    Verify Summary State    ${STATES}[disabled]    DREAM

Verify DREAM SummaryState timing
    [Tags]    dream    disabled    timing
    Verify Time Delta    DREAM     logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DREAM ConfigurationApplied Event
    [Tags]    dream    config_applied
    Verify ConfigurationApplied    DREAM

Verify DREAM ConfigurationApplied Event timing
    [Tags]    dream    config_applied    timing
    Verify Time Delta    DREAM    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# EAS
Verify EAS Disabled
    [Tags]    eas    disabled
    Verify Summary State    ${STATES}[disabled]    EAS

Verify EAS SummaryState timing
    [Tags]    eas    disabled    timing
    Verify Time Delta    EAS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify EAS ConfigurationApplied Event
    [Tags]    eas    config_applied
    Verify ConfigurationApplied    EAS

Verify EAS ConfigurationApplied Event timing
    [Tags]    eas    config_applied    timing
    Verify Time Delta    EAS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Disabled
    [Tags]    ess104    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    ess104    disabled    timing
    Verify Time Delta    ESS:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:104 ConfigurationApplied Event
    [Tags]    ess104    config_applied
    Verify ConfigurationApplied    ESS    index=104

Verify ESS:104 ConfigurationApplied Event timing
    [Tags]    ess104    config_applied    timing
    Verify Time Delta    ESS:104    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Disabled
    [Tags]    ess105    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:105
 
Verify ESS:105 SummaryState timing
    [Tags]    ess105    disabled    timing
    Verify Time Delta    ESS:105    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:105 ConfigurationApplied Event
    [Tags]    ess105    config_applied
    Verify ConfigurationApplied    ESS    index=105
    
Verify ESS:105 ConfigurationApplied Event timing
    [Tags]    ess105    config_applied    timing
    Verify Time Delta    ESS:105    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Disabled
    [Tags]    ess106    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:106
   
Verify ESS:106 SummaryState timing
    [Tags]    ess106    disabled    timing
    Verify Time Delta    ESS:106    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:106 ConfigurationApplied Event
    [Tags]    ess106    config_applied
    Verify ConfigurationApplied    ESS    index=106
    
Verify ESS:106 ConfigurationApplied Event timing
    [Tags]    ess106    config_applied    timing
    Verify Time Delta    ESS:106    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 Disabled
    [Tags]    ess109    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:109

Verify ESS:109 SummaryState timing
    [Tags]    ess109    disabled    timing
    Verify Time Delta    ESS:109    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:109 ConfigurationApplied Event
    [Tags]    ess109    config_applied
    Verify ConfigurationApplied    ESS    index=109

Verify ESS:109 ConfigurationApplied Event timing
    [Tags]    ess109    config_applied    timing
    Verify Time Delta    ESS:109    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 Disabled
    [Tags]    ess110    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:110

Verify ESS:110 SummaryState timing
    [Tags]    ess110    disabled    timing
    Verify Time Delta    ESS:110    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:110 ConfigurationApplied Event
    [Tags]    ess110    config_applied
    Verify ConfigurationApplied    ESS    index=110

Verify ESS:110 ConfigurationApplied Event timing
    [Tags]    ess110    config_applied    timing
    Verify Time Delta    ESS:110    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 Disabled
    [Tags]    ess111    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:111

Verify ESS:111 SummaryState timing
    [Tags]    ess111    disabled    timing
    Verify Time Delta    ESS:111    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:111 ConfigurationApplied Event
    [Tags]    ess111    config_applied
    Verify ConfigurationApplied    ESS    index=111

Verify ESS:111 ConfigurationApplied Event timing
    [Tags]    ess111    config_applied    timing
    Verify Time Delta    ESS:111    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112
Verify ESS:112 Disabled
    [Tags]    ess112    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:112

Verify ESS:112 SummaryState timing
    [Tags]    ess112    disabled    timing
    Verify Time Delta    ESS:112    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:112 ConfigurationApplied Event
    [Tags]    ess112    config_applied
    Verify ConfigurationApplied    ESS    index=112

Verify ESS:112 ConfigurationApplied Event timing
    [Tags]    ess112    config_applied    timing
    Verify Time Delta    ESS:112    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113
Verify ESS:113 Disabled
    [Tags]    ess113    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:113

Verify ESS:113 SummaryState timing
    [Tags]    ess113    disabled    timing
    Verify Time Delta    ESS:113    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:113 ConfigurationApplied Event
    [Tags]    ess113    config_applied
    Verify ConfigurationApplied    ESS    index=113

Verify ESS:113 ConfigurationApplied Event timing
    [Tags]    ess113    config_applied    timing
    Verify Time Delta    ESS:113    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:114
Verify ESS:114 Disabled
    [Tags]    ess114    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:114
    
Verify ESS:114 SummaryState timing
    [Tags]    ess114    disabled    timing
    Verify Time Delta    ESS:114    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:114 ConfigurationApplied Event
    [Tags]    ess114    config_applied
    Verify ConfigurationApplied    ESS    index=114
    
Verify ESS:114 ConfigurationApplied Event timing
    [Tags]    ess114    config_applied    timing
    Verify Time Delta    ESS:114    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:115
Verify ESS:115 Disabled
    [Tags]    ess115    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:115
    
Verify ESS:115 SummaryState timing
    [Tags]    ess115    disabled    timing
    Verify Time Delta    ESS:115    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:115 ConfigurationApplied Event
    [Tags]    ess115    config_applied
    Verify ConfigurationApplied    ESS    index=115
    
Verify ESS:115 ConfigurationApplied Event timing
    [Tags]    ess115    config_applied    timing
    Verify Time Delta    ESS:115    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:116
Verify ESS:116 Disabled
    [Tags]    ess116    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:116
    
Verify ESS:116 SummaryState timing
    [Tags]    ess116    disabled    timing
    Verify Time Delta    ESS:116    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:116 ConfigurationApplied Event
    [Tags]    ess116    config_applied
    Verify ConfigurationApplied    ESS    index=116
    
Verify ESS:116 ConfigurationApplied Event timing
    [Tags]    ess116    config_applied    timing
    Verify Time Delta    ESS:116    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:117
Verify ESS:117 Disabled
    [Tags]    ess117    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:117
    
Verify ESS:117 SummaryState timing
    [Tags]    ess117    disabled    timing
    Verify Time Delta    ESS:117    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:117 ConfigurationApplied Event
    [Tags]    ess117    config_applied
    Verify ConfigurationApplied    ESS    index=117
    
Verify ESS:117 ConfigurationApplied Event timing
    [Tags]    ess117    config_applied    timing
    Verify Time Delta    ESS:117    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:121
Verify ESS:121 Disabled
    [Tags]    ess121    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:121

Verify ESS:121 SummaryState timing
    [Tags]    ess121    disabled    timing
    Verify Time Delta    ESS:121    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:121 ConfigurationApplied Event
    [Tags]    ess121    config_applied
    Verify ConfigurationApplied    ESS    index=121

Verify ESS:121 ConfigurationApplied Event timing
    [Tags]    ess121    config_applied    timing
    Verify Time Delta    ESS:121    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:122
Verify ESS:122 Disabled
    [Tags]    ess122    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:122

Verify ESS:122 SummaryState timing
    [Tags]    ess122    disabled    timing
    Verify Time Delta    ESS:122    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:122 ConfigurationApplied Event
    [Tags]    ess122    config_applied
    Verify ConfigurationApplied    ESS    index=122

Verify ESS:122 ConfigurationApplied Event timing
    [Tags]    ess122    config_applied    timing
    Verify Time Delta    ESS:122    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:123
Verify ESS:123 Disabled
    [Tags]    ess123    disabled   
    Verify Summary State    ${STATES}[disabled]    ESS:123

Verify ESS:123 SummaryState timing
    [Tags]    ess123    disabled    timing
    Verify Time Delta    ESS:123    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:123 ConfigurationApplied Event
    [Tags]    ess123    config_applied
    Verify ConfigurationApplied    ESS    index=123

Verify ESS:123 ConfigurationApplied Event timing
    [Tags]    ess123    config_applied    timing
    Verify Time Delta    ESS:123    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:124
Verify ESS:124 Disabled
    [Tags]    ess124    disabled   
    Verify Summary State    ${STATES}[disabled]    ESS:124

Verify ESS:124 SummaryState timing
    [Tags]    ess124    disabled    timing
    Verify Time Delta    ESS:124    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:124 ConfigurationApplied Event
    [Tags]    ess124    config_applied
    Verify ConfigurationApplied    ESS    index=124

Verify ESS:124 ConfigurationApplied Event timing
    [Tags]    ess124    config_applied    timing
    Verify Time Delta    ESS:124    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:125
Verify ESS:125 Disabled
    [Tags]    ess125    disabled   
    Verify Summary State    ${STATES}[disabled]    ESS:125

Verify ESS:125 SummaryState timing
    [Tags]    ess125    disabled    timing
    Verify Time Delta    ESS:125    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:125 ConfigurationApplied Event
    [Tags]    ess125    config_applied
    Verify ConfigurationApplied    ESS    index=125

Verify ESS:125 ConfigurationApplied Event timing
    [Tags]    ess125    config_applied    timing
    Verify Time Delta    ESS:125    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:126
Verify ESS:126 Disabled
    [Tags]    ess126    disabled   
    Verify Summary State    ${STATES}[disabled]    ESS:126

Verify ESS:126 SummaryState timing
    [Tags]    ess126    disabled    timing
    Verify Time Delta    ESS:126    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:126 ConfigurationApplied Event
    [Tags]    ess126    config_applied
    Verify ConfigurationApplied    ESS    index=126

Verify ESS:126 ConfigurationApplied Event timing
    [Tags]    ess126    config_applied    timing
    Verify Time Delta    ESS:126    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:127
Verify ESS:127 Disabled
    [Tags]    ess127    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:127

Verify ESS:127 SummaryState timing
    [Tags]    ess127    disabled    timing
    Verify Time Delta    ESS:127    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:127 ConfigurationApplied Event
    [Tags]    ess127    config_applied
    Verify ConfigurationApplied    ESS    index=127

Verify ESS:127 ConfigurationApplied Event timing
    [Tags]    ess127    config_applied    timing
    Verify Time Delta    ESS:127    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# ESS:128
Verify ESS:128 Disabled
    [Tags]    ess128    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:128
    
Verify ESS:128 SummaryState timing
    [Tags]    ess128    disabled    timing
    Verify Time Delta    ESS:128    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:128 ConfigurationApplied Event
    [Tags]    ess128    config_applied
    Verify ConfigurationApplied    ESS    index=128
    
Verify ESS:128 ConfigurationApplied Event timing
    [Tags]    ess128    config_applied    timing
    Verify Time Delta    ESS:128    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:129
Verify ESS:129 Disabled
    [Tags]    ess129    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:129

Verify ESS:129 SummaryState timing
    [Tags]    ess129    disabled    timing
    Verify Time Delta    ESS:129    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:129 ConfigurationApplied Event
    [Tags]    ess129    config_applied
    Verify ConfigurationApplied    ESS    index=129

Verify ESS:129 ConfigurationApplied Event timing
    [Tags]    ess129    config_applied    timing
    Verify Time Delta    ESS:129    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Disabled
    [Tags]    ess201    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    ess201    disabled    timing
    Verify Time Delta    ESS:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:201 ConfigurationApplied Event
    [Tags]    ess201    config_applied
    Verify ConfigurationApplied    ESS    index=201

Verify ESS:201 ConfigurationApplied Event timing
    [Tags]    ess201    config_applied    timing
    Verify Time Delta    ESS:201    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Disabled
    [Tags]    ess202    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    ess202    disabled    timing
    Verify Time Delta    ESS:202    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:202 ConfigurationApplied Event
    [Tags]    ess202    config_applied
    Verify ConfigurationApplied    ESS    index=202

Verify ESS:202 ConfigurationApplied Event timing
    [Tags]    ess202    config_applied    timing
    Verify Time Delta    ESS:202    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Disabled
    [Tags]    ess204    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    ess204    disabled    timing
    Verify Time Delta    ESS:204    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:204 ConfigurationApplied Event
    [Tags]    ess204    config_applied
    Verify ConfigurationApplied    ESS    index=204

Verify ESS:204 ConfigurationApplied Event timing
    [Tags]    ess204    config_applied    timing
    Verify Time Delta    ESS:204    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
Verify ESS:301 Disabled
    [Tags]    ess301    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    ess301    disabled    timing
    Verify Time Delta    ESS:301    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 ConfigurationApplied Event
    [Tags]    ess301    config_applied
    Verify ConfigurationApplied    ESS    index=301

Verify ESS:301 ConfigurationApplied Event timing
    [Tags]    ess301    config_applied    timing
    Verify Time Delta    ESS:301    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:303
Verify ESS:303 Disabled
    [Tags]    ess303    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:303
    
Verify ESS:303 SummaryState timing
    [Tags]    ess303    disabled    timing
    Verify Time Delta    ESS:303  logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:303 ConfigurationApplied Event
    [Tags]    ess303    config_applied
    Verify ConfigurationApplied    ESS    index=303
    
Verify ESS:303 ConfigurationApplied Event timing
    [Tags]    ess303    config_applied    timing
    Verify Time Delta    ESS:303    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:304
Verify ESS:304 Disabled  
    [Tags]    ess304    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:304
    
Verify ESS:304 SummaryState timing
    [Tags]    ess304    disabled    timing
    Verify Time Delta    ESS:304  logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:304 ConfigurationApplied Event
    [Tags]    ess304    config_applied
    Verify ConfigurationApplied    ESS    index=304
    
Verify ESS:304 ConfigurationApplied Event timing
    [Tags]    ess304    config_applied    timing
    Verify Time Delta    ESS:304    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:305
Verify ESS:305 Disabled
    [Tags]    ess305    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:305
    
Verify ESS:305 SummaryState timing
    [Tags]    ess305    disabled    timing
    Verify Time Delta    ESS:305  logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:305 ConfigurationApplied Event
    [Tags]    ess305    config_applied
    Verify ConfigurationApplied    ESS    index=305
    
Verify ESS:305 ConfigurationApplied Event timing
    [Tags]    ess305    config_applied    timing
    Verify Time Delta    ESS:305    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:306
Verify ESS:306 Disabled
    [Tags]    ess306    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:306
    
Verify ESS:306 SummaryState timing
    [Tags]    ess306    disabled    timing
    Verify Time Delta    ESS:306  logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:306 ConfigurationApplied Event
    [Tags]    ess306    config_applied
    Verify ConfigurationApplied    ESS    index=306
    
Verify ESS:306 ConfigurationApplied Event timing
    [Tags]    ess306    config_applied    timing
    Verify Time Delta    ESS:306    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:308
Verify ESS:308 Disabled
    [Tags]    ess308    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:308

Verify ESS:308 SummaryState timing
    [Tags]    ess308    disabled    timing
    Verify Time Delta    ESS:308    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:308 ConfigurationApplied Event
    [Tags]    ess308    config_applied
    Verify ConfigurationApplied    ESS    index=308

Verify ESS:308 ConfigurationApplied Event timing
    [Tags]    ess308    config_applied    timing
    Verify Time Delta    ESS:308    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:403
Verify ESS:403 Disabled
    [Tags]    ess403    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:403
    
Verify ESS:403 SummaryState timing
    [Tags]    ess403    disabled    timing
    Verify Time Delta    ESS:403    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:403 ConfigurationApplied Event
    [Tags]    ess403    config_applied
    Verify ConfigurationApplied    ESS    index=403
    
Verify ESS:403 ConfigurationApplied Event timing
    [Tags]    ess403    config_applied    timing
    Verify Time Delta    ESS:403    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:404
Verify ESS:404 Disabled
    [Tags]    ess404    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:404
    
Verify ESS:404 SummaryState timing
    [Tags]    ess404    disabled    timing
    Verify Time Delta    ESS:404    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:404 ConfigurationApplied Event
    [Tags]    ess404    config_applied
    Verify ConfigurationApplied    ESS    index=404
    
Verify ESS:404 ConfigurationApplied Event timing
    [Tags]    ess404    config_applied    timing
    Verify Time Delta    ESS:404    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# ESS:405
Verify ESS:405 Disabled
    [Tags]    ess405    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:405

Verify ESS:405 SummaryState timing
    [Tags]    ess405    disabled    timing
    Verify Time Delta    ESS:405    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:405 ConfigurationApplied Event
    [Tags]    ess405    config_applied
    Verify ConfigurationApplied    ESS    index=405

Verify ESS:405 ConfigurationApplied Event timing
    [Tags]    ess405    config_applied    timing
    Verify Time Delta    ESS:405    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:441
Verify ESS:441 Disabled
    [Tags]    ess441    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:441

Verify ESS:441 SummaryState timing
    [Tags]    ess441    disabled    timing
    Verify Time Delta    ESS:441    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:441 ConfigurationApplied Event
    [Tags]    ess441    config_applied
    Verify ConfigurationApplied    ESS    index=441

Verify ESS:441 ConfigurationApplied Event timing
    [Tags]    ess441    config_applied    timing
    Verify Time Delta    ESS:441    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:442
Verify ESS:442 Disabled
    [Tags]    ess442    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:442

Verify ESS:442 SummaryState timing
    [Tags]    ess442    disabled    timing
    Verify Time Delta    ESS:442    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:442 ConfigurationApplied Event
    [Tags]    ess442    config_applied
    Verify ConfigurationApplied    ESS    index=442

Verify ESS:442 ConfigurationApplied Event timing
    [Tags]    ess442    config_applied    timing
    Verify Time Delta    ESS:442    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:443
Verify ESS:443 Disabled
    [Tags]    ess443    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:443

Verify ESS:443 SummaryState timing
    [Tags]    ess443    disabled    timing
    Verify Time Delta    ESS:443    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:443 ConfigurationApplied Event
    [Tags]    ess443    config_applied
    Verify ConfigurationApplied    ESS    index=443

Verify ESS:443 ConfigurationApplied Event timing
    [Tags]    ess443    config_applied    timing
    Verify Time Delta    ESS:443    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
