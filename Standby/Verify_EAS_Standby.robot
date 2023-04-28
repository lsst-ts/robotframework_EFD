*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    eas

*** Variables ***
${time_window}    10

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    DIMM    index=1

Verify DIMM:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=1

Verify DIMM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    index=1

Verify DIMM:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=1

# DIMM:2
Verify DIMM:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:2

Verify DIMM:2 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    DIMM    index=2

Verify DIMM:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=2

Verify DIMM:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    index=2

Verify DIMM:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=2

# ESS:1
Verify ESS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:1

Verify ESS:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=1

Verify ESS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=1

Verify ESS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=1

Verify ESS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=1

# ESS:101
Verify ESS:101 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:101

Verify ESS:101 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=101
    
Verify ESS:101 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=101

Verify ESS:101 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=101

Verify ESS:101 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=101

# ESS:102
Verify ESS:102 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:102

Verify ESS:102 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=102
    
Verify ESS:102 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=102

Verify ESS:102 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=102

Verify ESS:102 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=102

# ESS:103
Verify ESS:103 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:103

Verify ESS:103 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=103
    
Verify ESS:103 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=103

Verify ESS:103 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=103

Verify ESS:103 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=103

# ESS:104
Verify ESS:104 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:104

Verify ESS:104 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=104
    
Verify ESS:104 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=104

Verify ESS:104 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=104

Verify ESS:104 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=104

# ESS:105
Verify ESS:105 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:105
    
Verify ESS:105 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=105
    
Verify ESS:105 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=105
    
Verify ESS:105 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=105
    
Verify ESS:105 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=105

# ESS:201
Verify ESS:201 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:201

Verify ESS:201 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=201

Verify ESS:201 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=201

Verify ESS:201 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=201

Verify ESS:201 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=201

# ESS:202
Verify ESS:202 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:202

Verify ESS:202 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=202

Verify ESS:202 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=202

Verify ESS:202 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=202

Verify ESS:202 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=202

# ESS:203
Verify ESS:203 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:203

Verify ESS:203 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=203

Verify ESS:203 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=203

Verify ESS:203 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=203

Verify ESS:203 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=203

# ESS:204
Verify ESS:204 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:204

Verify ESS:204 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=204

Verify ESS:204 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=204

Verify ESS:204 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=204

Verify ESS:204 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=204

# ESS:301
Verify ESS:301 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:301

Verify ESS:301 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    index=301

Verify ESS:301 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=301

Verify ESS:301 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=301

Verify ESS:301 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=301
