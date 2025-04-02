*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    envsys

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    index=1

Verify DIMM:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM:1    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM:2    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    index=2

Verify DIMM:2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DREAM
Verify DREAM Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DREAM

Verify DREAM SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DREAM logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DREAM ConfigurationApplied Event
    [Tags]    software_versions    timing
    Verify Time Delta    DREAM    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DREAM ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    DREAM    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# EAS
Verify EAS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    EAS

Verify EAS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    EAS logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify EAS ConfigurationApplied Event
    [Tags]    software_versions    timing
    Verify Time Delta    EAS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify EAS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    EAS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:1
Verify ESS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:1

Verify ESS:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=1

Verify ESS:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:1    logevent_configurationApplied   hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:104 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=104

Verify ESS:104 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:104    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:105
 
Verify ESS:105 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:105    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:105 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=105
    
Verify ESS:105 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:105    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:106
   
Verify ESS:106 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:106    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:106 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=106
    
Verify ESS:106 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:106    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:107
    
Verify ESS:107 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:107    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:107 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=107
    
Verify ESS:107 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:107    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:108
    
Verify ESS:108 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:108    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:108 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=108
    
Verify ESS:108 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:108    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:109

Verify ESS:109 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:109    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:109 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=109

Verify ESS:109 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:109    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:110

Verify ESS:110 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:110    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:110 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=110

Verify ESS:110 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:110    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:111

Verify ESS:111 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:111    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:111 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=111

Verify ESS:111 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:111    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112
Verify ESS:112 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:112

Verify ESS:112 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:112    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:112 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=112

Verify ESS:112 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:112    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113
Verify ESS:113 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:113

Verify ESS:113 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:113    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:113 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=113

Verify ESS:113 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:113    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:201 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=201

Verify ESS:201 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:201    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:202    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:202 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=202

Verify ESS:202 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:202    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:203

Verify ESS:203 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:203    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:203 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=203

Verify ESS:203 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:203    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:204    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:204 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=204

Verify ESS:204 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:204    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
Verify ESS:301 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:301    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=301

Verify ESS:301 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS:301    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:303
Verify ESS:303 Disabled
    [Tags]    ess303    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:303
    
Verify ESS:303 SummaryState timing
    [Tags]    ess303    software_versions    timing
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
    [Tags]    ess304    software_versions    timing
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
    [Tags]    ess305    software_versions    timing
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
    [Tags]    ess306    software_versions    timing
    Verify Time Delta    ESS:306  logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:306 ConfigurationApplied Event
    [Tags]    ess306    config_applied
    Verify ConfigurationApplied    ESS    index=306
    
Verify ESS:306 ConfigurationApplied Event timing
    [Tags]    ess306    config_applied    timing
    Verify Time Delta    ESS:306    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
