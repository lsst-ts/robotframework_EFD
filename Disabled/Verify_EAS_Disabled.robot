*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    eas

*** Variables ***
${time_window}    10

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:1

Verify DIMM:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    index=1

Verify DIMM:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=1

# DIMM:2
Verify DIMM:2 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    DIMM:2

Verify DIMM:2 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    DIMM    index=2

Verify DIMM:2 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=2

# ESS:1
Verify ESS:1 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:1

Verify ESS:1 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=1

Verify ESS:1 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    1

# ESS:101
Verify ESS:101 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:101

Verify ESS:101 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=101

Verify ESS:101 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=101

# ESS:102
Verify ESS:102 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:102

Verify ESS:102 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=102

Verify ESS:102 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=102

# ESS:103
Verify ESS:103 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:103

Verify ESS:103 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=103

Verify ESS:103 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=103

# ESS:104
Verify ESS:104 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:104

Verify ESS:104 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=104

Verify ESS:104 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=104

# ESS:105
Verify ESS:105 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:105
    
Verify ESS:105 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=105
    
Verify ESS:105 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=105

# ESS:201
Verify ESS:201 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:201

Verify ESS:201 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=201

Verify ESS:201 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=201

# ESS:202
Verify ESS:202 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:202

Verify ESS:202 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=202

Verify ESS:202 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=202

# ESS:203
Verify ESS:203 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:203

Verify ESS:203 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=203

Verify ESS:203 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=203

# ESS:204
Verify ESS:204 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:204

Verify ESS:204 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=204

Verify ESS:204 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=204

# ESS:301
Verify ESS:301 Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ESS:301

Verify ESS:301 ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ESS    index=301

Verify ESS:301 ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationApplied    ${time_window}    index=301
