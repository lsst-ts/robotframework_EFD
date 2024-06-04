*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    command_start    logevent_summaryState    index=1

Verify DIMM:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    index=1

Verify DIMM:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM    command_start    logevent_configurationApplied    index=1

# DIMM:2
Verify DIMM:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    command_start    logevent_summaryState    index=2

Verify DIMM:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    index=2

Verify DIMM:2 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM    command_start    logevent_configurationApplied    index=2

# EPM:1
Verify EPM:1 Disabled
    [Tags]    epm:1    disabled
    Verify Summary State    ${STATES}[disabled]    EPM:1

Verify EPM:1 SummaryState timing
    [Tags]    epm:1    software_versions    timing
    Verify Time Delta    EPM    command_start    logevent_summaryState    index=1

Verify EPM:1 ConfigurationApplied Event
    [Tags]    epm:1    config_applied
    Verify ConfigurationApplied    EPM    index=1

Verify EPM:1 ConfigurationApplied Event timing
    [Tags]    epm:1    config_applied    timing
    Verify Time Delta    EPM    command_start    logevent_configurationApplied    index=1

# ESS:1
Verify ESS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:1

Verify ESS:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=1

Verify ESS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=1

Verify ESS:1 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied   index=1

# ESS:101
Verify ESS:101 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:101

Verify ESS:101 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=101

Verify ESS:101 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=101

Verify ESS:101 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=101

# ESS:102
Verify ESS:102 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:102

Verify ESS:102 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=102

Verify ESS:102 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=102

Verify ESS:102 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=102

# ESS:103
Verify ESS:103 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:103

Verify ESS:103 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=103

Verify ESS:103 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=103

Verify ESS:103 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=103

# ESS:104
Verify ESS:104 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=104

Verify ESS:104 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=104

Verify ESS:104 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=104

# ESS:105
Verify ESS:105 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:105
 
Verify ESS:105 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=105

Verify ESS:105 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=105
    
Verify ESS:105 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=105

# ESS:106
Verify ESS:106 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:106
   
Verify ESS:106 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=106

Verify ESS:106 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=106
    
Verify ESS:106 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=106

# ESS:107
Verify ESS:107 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:107
    
Verify ESS:107 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=107
    
Verify ESS:107 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=107
    
Verify ESS:107 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=107

# ESS:108
Verify ESS:108 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:108
    
Verify ESS:108 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=108
    
Verify ESS:108 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=108
    
Verify ESS:108 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=108

# ESS:201
Verify ESS:201 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=201

Verify ESS:201 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=201

Verify ESS:201 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=201

# ESS:202
Verify ESS:202 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=202

Verify ESS:202 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=202

Verify ESS:202 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=202

# ESS:203
Verify ESS:203 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:203

Verify ESS:203 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=203

Verify ESS:203 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=203

Verify ESS:203 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=203

# ESS:204
Verify ESS:204 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=204

Verify ESS:204 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=204

Verify ESS:204 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=204

# ESS:205
Verify ESS:205 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:205
    
Verify ESS:205 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=205

Verify ESS:205 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=205

Verify ESS:205 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=205

# ESS:301
Verify ESS:301 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    command_start    logevent_summaryState    index=301

Verify ESS:301 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=301

Verify ESS:301 ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    command_start    logevent_configurationApplied    index=301
