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
# DIMM
Verify DIMM:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    DIMM    1

Verify DIMM:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify DIMM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    1

Verify DIMM:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

# ESS:1
Verify ESS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:1

Verify ESS:1 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    1

Verify ESS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    1

Verify ESS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    1

Verify ESS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

# ESS:101
Verify ESS:101 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:101

Verify ESS:101 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    101
    
Verify ESS:101 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    101

Verify ESS:101 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    101

Verify ESS:101 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    101

# ESS:102
Verify ESS:102 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:102

Verify ESS:102 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    102
    
Verify ESS:102 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    102

Verify ESS:102 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    102

Verify ESS:102 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    102

# ESS:103
Verify ESS:103 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:103

Verify ESS:103 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    103
    
Verify ESS:103 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    103

Verify ESS:103 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    103

Verify ESS:103 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    103

# ESS:104
Verify ESS:104 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:104

Verify ESS:104 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    104
    
Verify ESS:104 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    104

Verify ESS:104 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    104

Verify ESS:104 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    104

# ESS:201
Verify ESS:201 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:201

Verify ESS:201 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    201

Verify ESS:201 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    201

Verify ESS:201 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    201

Verify ESS:201 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    201

# ESS:202
Verify ESS:202 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:202

Verify ESS:202 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    202

Verify ESS:202 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    202

Verify ESS:202 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    202

Verify ESS:202 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    202

# ESS:203
Verify ESS:203 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:203

Verify ESS:203 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    203

Verify ESS:203 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    203

Verify ESS:203 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    203

Verify ESS:203 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    203

# ESS:204
Verify ESS:204 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:204

Verify ESS:204 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    204

Verify ESS:204 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    204

Verify ESS:204 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    204

Verify ESS:204 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    204

# ESS:301
Verify ESS:301 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:301

Verify ESS:301 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    ESS    301

Verify ESS:301 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_softwareVersions    ${time_window}    301

Verify ESS:301 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    301

Verify ESS:301 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    301
