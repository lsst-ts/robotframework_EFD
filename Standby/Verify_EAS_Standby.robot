*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas

*** Variables ***
${dimm1_salver}    ${SALVersion}
${dimm1_xmlver}    ${XMLVersion}
${dimm2_salver}    ${SALVersion}
${dimm2_xmlver}    ${XMLVersion}
${epm1_salver}     ${SALVersion}
${epm1_xmlver}     ${XMLVersion}
${ess1_salver}     ${SALVersion}
${ess1_xmlver}     ${XMLVersion}
${ess101_salver}    ${SALVersion}
${ess101_xmlver}    ${XMLVersion}
${ess102_salver}    ${SALVersion}
${ess102_xmlver}    ${XMLVersion}
${ess103_salver}    ${SALVersion}
${ess103_xmlver}    ${XMLVersion}
${ess104_salver}    ${SALVersion}
${ess104_xmlver}    ${XMLVersion}
${ess105_salver}    ${SALVersion}
${ess105_xmlver}    ${XMLVersion}
${ess106_salver}    ${SALVersion}
${ess106_xmlver}    ${XMLVersion}
${ess107_salver}    ${SALVersion}
${ess107_xmlver}    ${XMLVersion}
${ess108_salver}    ${SALVersion}
${ess108_xmlver}    ${XMLVersion}
${ess201_salver}    ${SALVersion}
${ess201_xmlver}    ${XMLVersion}
${ess202_salver}    ${SALVersion}
${ess202_xmlver}    ${XMLVersion}
${ess203_salver}    ${SALVersion}
${ess203_xmlver}    ${XMLVersion}
${ess204_salver}    ${SALVersion}
${ess204_xmlver}    ${XMLVersion}
${ess205_salver}    ${SALVersion}
${ess205_xmlver}    ${XMLVersion}
${ess301_salver}    ${SALVersion}
${ess301_xmlver}    ${XMLVersion}

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    DIMM    index=1    csc_salver=${dimm1_salver}    csc_xmlver=${dimm1_xmlver}

Verify DIMM:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    logevent_softwareVersions    logevent_summaryState    index=1

Verify DIMM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    index=1

Verify DIMM:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM    logevent_configurationsAvailable    logevent_summaryState    index=1

# DIMM:2
Verify DIMM:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:2

Verify DIMM:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    DIMM    index=2    csc_salver=${dimm2_salver}    csc_xmlver=${dimm2_xmlver}

Verify DIMM:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM    logevent_softwareVersions    logevent_summaryState    index=2

Verify DIMM:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    index=2

Verify DIMM:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM    logevent_configurationsAvailable    logevent_summaryState    index=2

# EPM:1
Verify EPM:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    EPM:1

Verify EPM:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    EPM    csc_salver=${epm1_salver}    csc_xmlver=${epm1_xmlver}    index=1

Verify EPM:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    EPM    logevent_softwareVersions    logevent_summaryState    index=1

Verify EPM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    EPM    index=1

Verify EPM:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    EPM    logevent_configurationsAvailable    logevent_summaryState    index=1

# ESS:1
Verify ESS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:1

Verify ESS:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=1    csc_salver=${ess1_salver}    csc_xmlver=${ess1_xmlver}

Verify ESS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=1

Verify ESS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=1

Verify ESS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=1

# ESS:101
Verify ESS:101 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:101

Verify ESS:101 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=101    csc_salver=${ess101_salver}    csc_xmlver=${ess101_xmlver}
    
Verify ESS:101 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=101

Verify ESS:101 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=101

Verify ESS:101 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=101

# ESS:102
Verify ESS:102 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:102

Verify ESS:102 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=102    csc_salver=${ess102_salver}    csc_xmlver=${ess102_xmlver}
    
Verify ESS:102 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=102

Verify ESS:102 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=102

Verify ESS:102 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=102

# ESS:103
Verify ESS:103 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:103

Verify ESS:103 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=103    csc_salver=${ess103_salver}    csc_xmlver=${ess103_xmlver}
    
Verify ESS:103 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=103

Verify ESS:103 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=103

Verify ESS:103 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=103

# ESS:104
Verify ESS:104 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:104

Verify ESS:104 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=104    csc_salver=${ess104_salver}    csc_xmlver=${ess104_xmlver}
    
Verify ESS:104 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=104

Verify ESS:104 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=104

Verify ESS:104 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=104

# ESS:105
Verify ESS:105 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:105
    
Verify ESS:105 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=105    csc_salver=${ess105_salver}    csc_xmlver=${ess105_xmlver}
    
Verify ESS:105 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=105
    
Verify ESS:105 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=105
    
Verify ESS:105 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=105

# ESS:106
Verify ESS:106 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:106
    
Verify ESS:106 SoftwareVersions   
    [Tags]    software_versions  
    Verify Software Versions    ESS    index=106    csc_salver=${ess106_salver}    csc_xmlver=${ess106_xmlver}
    
Verify ESS:106 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=106
   
Verify ESS:106 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=106
   
Verify ESS:106 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=106

# ESS:107
Verify ESS:107 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:107
    
Verify ESS:107 SoftwareVersions  
    [Tags]    software_versions  
    Verify Software Versions    ESS    index=107    csc_salver=${ess107_salver}    csc_xmlver=${ess107_xmlver}
    
Verify ESS:107 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=107
   
Verify ESS:107 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=107
   
Verify ESS:107 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=107

# ESS:108
Verify ESS:108 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:108
    
Verify ESS:108 SoftwareVersions  
    [Tags]    software_versions  
    Verify Software Versions    ESS    index=108    csc_salver=${ess108_salver}    csc_xmlver=${ess108_xmlver}
    
Verify ESS:108 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=108
   
Verify ESS:108 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=108
   
Verify ESS:108 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=108

# ESS:201
Verify ESS:201 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:201

    [Tags]    software_versions
    Verify Software Versions    ESS    index=201    csc_salver=${ess201_salver}    csc_xmlver=${ess201_xmlver}

Verify ESS:201 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=201

Verify ESS:201 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=201

Verify ESS:201 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=201

# ESS:202
Verify ESS:202 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:202

Verify ESS:202 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=202    csc_salver=${ess202_salver}    csc_xmlver=${ess202_xmlver}

Verify ESS:202 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=202

Verify ESS:202 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=202

Verify ESS:202 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=202

# ESS:203
Verify ESS:203 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:203

Verify ESS:203 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=203    csc_salver=${ess203_salver}    csc_xmlver=${ess203_xmlver}

Verify ESS:203 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=203

Verify ESS:203 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=203

Verify ESS:203 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=203

# ESS:204
Verify ESS:204 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:204

Verify ESS:204 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=204    csc_salver=${ess204_salver}    csc_xmlver=${ess204_xmlver}

Verify ESS:204 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=204

Verify ESS:204 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=204

Verify ESS:204 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=204

# ESS:205
Verify ESS:205 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:205

Verify ESS:205 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=205    csc_salver=${ess205_salver}    csc_xmlver=${ess205_xmlver}

Verify ESS:205 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=205

Verify ESS:205 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=205

Verify ESS:205 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=205

# ESS:301
Verify ESS:301 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:301

Verify ESS:301 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=301    csc_salver=${ess301_salver}    csc_xmlver=${ess301_xmlver}

Verify ESS:301 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS    logevent_softwareVersions    logevent_summaryState    index=301

Verify ESS:301 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=301

Verify ESS:301 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS    logevent_configurationsAvailable    logevent_summaryState    index=301
