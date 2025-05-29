*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    envsys

*** Variables ***
${dimm1_xmlver}    ${XMLVersion}
${dimm2_xmlver}    ${XMLVersion}
${dream_xmlver}     ${XMLVersion}
${eas_xmlver}     ${XMLVersion}
${ess1_xmlver}     ${XMLVersion}
${ess104_xmlver}    ${XMLVersion}
${ess105_xmlver}    ${XMLVersion}
${ess106_xmlver}    ${XMLVersion}
${ess107_xmlver}    ${XMLVersion}
${ess108_xmlver}    ${XMLVersion}
${ess109_xmlver}    ${XMLVersion}
${ess110_xmlver}    ${XMLVersion}
${ess111_xmlver}    ${XMLVersion}
${ess112_xmlver}    ${XMLVersion}
${ess113_xmlver}    ${XMLVersion}
${ess201_xmlver}    ${XMLVersion}
${ess202_xmlver}    ${XMLVersion}
${ess203_xmlver}    ${XMLVersion}
${ess204_xmlver}    ${XMLVersion}
${ess301_xmlver}    ${XMLVersion}
${ess303_xmlver}     ${XMLVersion}
${ess304_xmlver}     ${XMLVersion}
${ess305_xmlver}     ${XMLVersion}
${ess306_xmlver}     ${XMLVersion}

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    DIMM    index=1    csc_xmlver=${dimm1_xmlver}

Verify DIMM:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    index=1

Verify DIMM:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DIMM:2

Verify DIMM:2 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    DIMM    index=2    csc_xmlver=${dimm2_xmlver}

Verify DIMM:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DIMM:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DIMM    index=2

Verify DIMM:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DIMM:2    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DREAM
Verify DREAM Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    DREAM

Verify DREAM SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    DREAM    csc_xmlver=${dream_xmlver}

Verify DREAM SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    DREAM    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DREAM ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    DREAM

Verify DREAM ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    DREAM    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# EAS
Verify EAS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    EAS

Verify EAS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    EAS    csc_xmlver=${eas_xmlver}

Verify EAS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    EAS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify EAS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    EAS

Verify EAS ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    EAS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:1
Verify ESS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:1

Verify ESS:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=1    csc_xmlver=${ess1_xmlver}

Verify ESS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=1

Verify ESS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:104

Verify ESS:104 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=104    csc_xmlver=${ess104_xmlver}
    
Verify ESS:104 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:104    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:104 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=104

Verify ESS:104 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:104    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:105
    
Verify ESS:105 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=105    csc_xmlver=${ess105_xmlver}
    
Verify ESS:105 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:105    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:105 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=105
    
Verify ESS:105 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:105    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:106
    
Verify ESS:106 SoftwareVersions   
    [Tags]    software_versions  
    Verify Software Versions    ESS    index=106    csc_xmlver=${ess106_xmlver}
    
Verify ESS:106 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:106    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
   
Verify ESS:106 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=106
   
Verify ESS:106 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:106    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:107
    
Verify ESS:107 SoftwareVersions  
    [Tags]    software_versions  
    Verify Software Versions    ESS    index=107    csc_xmlver=${ess107_xmlver}
    
Verify ESS:107 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:107    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
   
Verify ESS:107 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=107
   
Verify ESS:107 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:107    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:108
    
Verify ESS:108 SoftwareVersions  
    [Tags]    software_versions  
    Verify Software Versions    ESS    index=108    csc_xmlver=${ess108_xmlver}
    
Verify ESS:108 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:108    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
   
Verify ESS:108 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=108
   
Verify ESS:108 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:108    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:109

Verify ESS:109 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=109    csc_xmlver=${ess109_xmlver}

Verify ESS:109 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:109    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:109 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=109

Verify ESS:109 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:109    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:110

Verify ESS:110 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=110    csc_xmlver=${ess110_xmlver}

Verify ESS:110 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:110    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:110 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=110

Verify ESS:110 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:110    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:111

Verify ESS:111 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=111    csc_xmlver=${ess111_xmlver}

Verify ESS:111 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:111    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:111 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=111

Verify ESS:111 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:111    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112
Verify ESS:112 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:112

Verify ESS:112 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=112    csc_xmlver=${ess112_xmlver}

Verify ESS:112 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:112    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:112 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=112

Verify ESS:112 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:112    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113
Verify ESS:113 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:113

Verify ESS:113 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=113    csc_xmlver=${ess113_xmlver}

Verify ESS:113 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:113    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:113 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=113

Verify ESS:113 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:113    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:114
Verify ESS:114 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:114

Verify ESS:114 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=114    csc_xmlver=${ess113_xmlver}

Verify ESS:114 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:114    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:114 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=114

Verify ESS:114 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:114    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:115
Verify ESS:115 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:115

Verify ESS:115 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=115    csc_xmlver=${ess113_xmlver}

Verify ESS:115 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:115    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:115 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=113

Verify ESS:115 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:115    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:116
Verify ESS:116 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:116

Verify ESS:116 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=116    csc_xmlver=${ess113_xmlver}

Verify ESS:116 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:116    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:116 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=113

Verify ESS:116 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:116    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:117
Verify ESS:117 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:117

Verify ESS:117 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=117    csc_xmlver=${ess113_xmlver}

Verify ESS:117 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:117    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:117 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=113

Verify ESS:117 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:117    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:201

Verify ESS:201 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=201    csc_xmlver=${ess201_xmlver}

Verify ESS:201 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:201    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:201 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=201

Verify ESS:201 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:201    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:202

Verify ESS:202 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=202    csc_xmlver=${ess202_xmlver}

Verify ESS:202 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:202    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:202 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=202

Verify ESS:202 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:202    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:203

Verify ESS:203 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=203    csc_xmlver=${ess203_xmlver}

Verify ESS:203 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:203    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:203 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=203

Verify ESS:203 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:203    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:204

Verify ESS:204 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=204    csc_xmlver=${ess204_xmlver}

Verify ESS:204 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:204    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:204 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=204

Verify ESS:204 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:204    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
Verify ESS:301 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ESS:301

Verify ESS:301 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ESS    index=301    csc_xmlver=${ess301_xmlver}

Verify ESS:301 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ESS:301    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ESS    index=301

Verify ESS:301 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ESS:301    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:303
Verify ESS:303 Standby
    [Tags]    ess303    standby
    Verify Summary State    ${STATES}[standby]    ESS:303

Verify ESS:303 SoftwareVersions
    [Tags]    ess303    software_versions
    Verify Software Versions    ESS    csc_xmlver=${ess303_xmlver}    index=303

Verify ESS:303 SoftwareVersions timing
    [Tags]    ess303    software_versions    timing
    Verify Time Delta    ESS:303    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:303 ConfigurationsAvailable Event
    [Tags]    ess303    config_available
    Verify ConfigurationsAvailable    ESS    index=303

Verify ESS:303 ConfigurationsAvailable timing
    [Tags]    ess303    config_available    timing
    Verify Time Delta    ESS:303    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:304
Verify ESS:304 Standby
    [Tags]    ess304    standby
    Verify Summary State    ${STATES}[standby]    ESS:304

Verify ESS:304 SoftwareVersions
    [Tags]    ess304    software_versions
    Verify Software Versions    ESS    csc_xmlver=${ess304_xmlver}    index=304

Verify ESS:304 SoftwareVersions timing
    [Tags]    ess304    software_versions    timing
    Verify Time Delta    ESS:304    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:304 ConfigurationsAvailable Event
    [Tags]    ess304    config_available
    Verify ConfigurationsAvailable    ESS    index=304

Verify ESS:304 ConfigurationsAvailable timing
    [Tags]    ess304    config_available    timing
    Verify Time Delta    ESS:304    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:305
Verify ESS:305 Standby
    [Tags]    ess305    standby
    Verify Summary State    ${STATES}[standby]    ESS:305

Verify ESS:305 SoftwareVersions
    [Tags]    ess305    software_versions
    Verify Software Versions    ESS    csc_xmlver=${ess305_xmlver}    index=305

Verify ESS:305 SoftwareVersions timing
    [Tags]    ess305    software_versions    timing
    Verify Time Delta    ESS:305    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:305 ConfigurationsAvailable Event
    [Tags]    ess305    config_available
    Verify ConfigurationsAvailable    ESS    index=305
    
Verify ESS:305 ConfigurationsAvailable timing
    [Tags]    ess305    config_available    timing
    Verify Time Delta    ESS:305    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:306
Verify ESS:306 Standby
    [Tags]    ess306    standby
    Verify Summary State    ${STATES}[standby]    ESS:306

Verify ESS:306 SoftwareVersions
    [Tags]    ess306    software_versions
    Verify Software Versions    ESS    csc_xmlver=${ess306_xmlver}    index=306

Verify ESS:306 SoftwareVersions timing
    [Tags]    ess306    software_versions    timing
    Verify Time Delta    ESS:306    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:306 ConfigurationsAvailable Event
    [Tags]    ess306    config_available
    Verify ConfigurationsAvailable    ESS    index=306
    
Verify ESS:306 ConfigurationsAvailable timing
    [Tags]    ess306    config_available    timing
    Verify Time Delta    ESS:306    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
