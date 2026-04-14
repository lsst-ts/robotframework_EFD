*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    envsys

*** Variables ***
${dimm1_xmlver}    ${XMLVersion}
${dimm2_xmlver}    ${XMLVersion}
${dream_xmlver}    ${XMLVersion}
${eas_xmlver}     ${XMLVersion}
${ess104_xmlver}    ${XMLVersion}
${ess105_xmlver}    ${XMLVersion}
${ess106_xmlver}    ${XMLVersion}
${ess109_xmlver}    ${XMLVersion}
${ess110_xmlver}    ${XMLVersion}
${ess111_xmlver}    ${XMLVersion}
${ess112_xmlver}    ${XMLVersion}
${ess113_xmlver}    ${XMLVersion}
${ess114_xmlver}    ${XMLVersion}
${ess115_xmlver}    ${XMLVersion}
${ess116_xmlver}    ${XMLVersion}
${ess117_xmlver}    ${XMLVersion}
${ess121_xmlver}    ${XMLVersion}
${ess122_xmlver}    ${XMLVersion}
${ess123_xmlver}    ${XMLVersion}
${ess124_xmlver}    ${XMLVersion}
${ess125_xmlver}    ${XMLVersion}
${ess126_xmlver}    ${XMLVersion}
${ess127_xmlver}    ${XMLVersion}
${ess128_xmlver}    ${XMLVersion}
${ess129_xmlver}    ${XMLVersion}
${ess201_xmlver}    ${XMLVersion}
${ess202_xmlver}    ${XMLVersion}
${ess204_xmlver}    ${XMLVersion}
${ess301_xmlver}    ${XMLVersion}
${ess303_xmlver}    ${XMLVersion}
${ess304_xmlver}    ${XMLVersion}
${ess305_xmlver}    ${XMLVersion}
${ess306_xmlver}    ${XMLVersion}
${ess308_xmlver}    ${XMLVersion}
${ess403_xmlver}    ${XMLVersion}
${ess404_xmlver}    ${XMLVersion}
${ess405_xmlver}    ${XMLVersion}
${ess441_xmlver}    ${XMLVersion}
${ess442_xmlver}    ${XMLVersion}
${ess443_xmlver}    ${XMLVersion}

*** Test Cases ***
# DIMM:1
Verify DIMM:1 Standby
    [Tags]    dimm1    standby
    Verify Summary State    ${STATES}[standby]    DIMM:1

Verify DIMM:1 SoftwareVersions
    [Tags]    dimm1    software_versions
    Verify Software Versions    DIMM    index=1    csc_xmlver=${dimm1_xmlver}

Verify DIMM:1 SoftwareVersions timing
    [Tags]    dimm1    software_versions    timing
    Verify Time Delta    DIMM:1    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:1 ConfigurationsAvailable Event
    [Tags]    dimm1    config_available
    Verify ConfigurationsAvailable    DIMM    index=1

Verify DIMM:1 ConfigurationsAvailable timing
    [Tags]    dimm1    config_available    timing
    Verify Time Delta    DIMM:1    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 Standby
    [Tags]    dimm2    standby
    Verify Summary State    ${STATES}[standby]    DIMM:2

Verify DIMM:2 SoftwareVersions
    [Tags]    dimm2    software_versions
    Verify Software Versions    DIMM    index=2    csc_xmlver=${dimm2_xmlver}

Verify DIMM:2 SoftwareVersions timing
    [Tags]    dimm2    software_versions    timing
    Verify Time Delta    DIMM:2    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DIMM:2 ConfigurationsAvailable Event
    [Tags]    dimm2    config_available
    Verify ConfigurationsAvailable    DIMM    index=2

Verify DIMM:2 ConfigurationsAvailable timing
    [Tags]    dimm2    config_available    timing
    Verify Time Delta    DIMM:2    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DREAM
Verify DREAM Standby
    [Tags]    dream    standby
    Verify Summary State    ${STATES}[standby]    DREAM

Verify DREAM SoftwareVersions
    [Tags]    dream    software_versions
    Verify Software Versions    DREAM    csc_xmlver=${dream_xmlver}

Verify DREAM SoftwareVersions timing
    [Tags]    dream    software_versions    timing
    Verify Time Delta    DREAM    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify DREAM ConfigurationsAvailable Event
    [Tags]    dream    config_available
    Verify ConfigurationsAvailable    DREAM

Verify DREAM ConfigurationsAvailable timing
    [Tags]    dream    config_available    timing
    Verify Time Delta    DREAM    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# EAS
Verify EAS Standby
    [Tags]    eas    standby
    Verify Summary State    ${STATES}[standby]    EAS

Verify EAS SoftwareVersions
    [Tags]    eas    software_versions
    Verify Software Versions    EAS    csc_xmlver=${eas_xmlver}

Verify EAS SoftwareVersions timing
    [Tags]    eas    software_versions    timing
    Verify Time Delta    EAS    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify EAS ConfigurationsAvailable Event
    [Tags]    eas    config_available
    Verify ConfigurationsAvailable    EAS

Verify EAS ConfigurationsAvailable timing
    [Tags]    eas    config_available    timing
    Verify Time Delta    EAS    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Standby
    [Tags]    ess104    standby
    Verify Summary State    ${STATES}[standby]    ESS:104

Verify ESS:104 SoftwareVersions
    [Tags]    ess104    software_versions
    Verify Software Versions    ESS    index=104    csc_xmlver=${ess104_xmlver}
    
Verify ESS:104 SoftwareVersions timing
    [Tags]    ess104    software_versions    timing
    Verify Time Delta    ESS:104    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:104 ConfigurationsAvailable Event
    [Tags]    ess104    config_available
    Verify ConfigurationsAvailable    ESS    index=104

Verify ESS:104 ConfigurationsAvailable timing
    [Tags]    ess104    config_available    timing
    Verify Time Delta    ESS:104    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Standby
    [Tags]    ess105    standby
    Verify Summary State    ${STATES}[standby]    ESS:105
    
Verify ESS:105 SoftwareVersions
    [Tags]    ess105    software_versions
    Verify Software Versions    ESS    index=105    csc_xmlver=${ess105_xmlver}
    
Verify ESS:105 SoftwareVersions timing
    [Tags]    ess105    software_versions    timing
    Verify Time Delta    ESS:105    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:105 ConfigurationsAvailable Event
    [Tags]    ess105    config_available
    Verify ConfigurationsAvailable    ESS    index=105
    
Verify ESS:105 ConfigurationsAvailable timing
    [Tags]    ess105    config_available    timing
    Verify Time Delta    ESS:105    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Standby
    [Tags]    ess106    standby
    Verify Summary State    ${STATES}[standby]    ESS:106
    
Verify ESS:106 SoftwareVersions   
    [Tags]    ess106    software_versions  
    Verify Software Versions    ESS    index=106    csc_xmlver=${ess106_xmlver}
    
Verify ESS:106 SoftwareVersions timing
    [Tags]    ess106    software_versions    timing
    Verify Time Delta    ESS:106    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
   
Verify ESS:106 ConfigurationsAvailable Event
    [Tags]    ess106    config_available
    Verify ConfigurationsAvailable    ESS    index=106
   
Verify ESS:106 ConfigurationsAvailable timing
    [Tags]    ess106    config_available    timing
    Verify Time Delta    ESS:106    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 Standby
    [Tags]    ess109    standby
    Verify Summary State    ${STATES}[standby]    ESS:109

Verify ESS:109 SoftwareVersions
    [Tags]    ess109    software_versions
    Verify Software Versions    ESS    index=109    csc_xmlver=${ess109_xmlver}

Verify ESS:109 SoftwareVersions timing
    [Tags]    ess109    software_versions    timing
    Verify Time Delta    ESS:109    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:109 ConfigurationsAvailable Event
    [Tags]    ess109    config_available
    Verify ConfigurationsAvailable    ESS    index=109

Verify ESS:109 ConfigurationsAvailable timing
    [Tags]    ess109    config_available    timing
    Verify Time Delta    ESS:109    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 Standby
    [Tags]    ess110    standby
    Verify Summary State    ${STATES}[standby]    ESS:110

Verify ESS:110 SoftwareVersions
    [Tags]    ess110    software_versions
    Verify Software Versions    ESS    index=110    csc_xmlver=${ess110_xmlver}

Verify ESS:110 SoftwareVersions timing
    [Tags]    ess110    software_versions    timing
    Verify Time Delta    ESS:110    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:110 ConfigurationsAvailable Event
    [Tags]    ess110    config_available
    Verify ConfigurationsAvailable    ESS    index=110

Verify ESS:110 ConfigurationsAvailable timing
    [Tags]    ess110    config_available    timing
    Verify Time Delta    ESS:110    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 Standby
    [Tags]    ess111    standby
    Verify Summary State    ${STATES}[standby]    ESS:111

Verify ESS:111 SoftwareVersions
    [Tags]    ess111    software_versions
    Verify Software Versions    ESS    index=111    csc_xmlver=${ess111_xmlver}

Verify ESS:111 SoftwareVersions timing
    [Tags]    ess111    software_versions    timing
    Verify Time Delta    ESS:111    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:111 ConfigurationsAvailable Event
    [Tags]    ess111    config_available
    Verify ConfigurationsAvailable    ESS    index=111

Verify ESS:111 ConfigurationsAvailable timing
    [Tags]    ess111    config_available    timing
    Verify Time Delta    ESS:111    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112
Verify ESS:112 Standby
    [Tags]    ess112    standby
    Verify Summary State    ${STATES}[standby]    ESS:112

Verify ESS:112 SoftwareVersions
    [Tags]    ess112    software_versions
    Verify Software Versions    ESS    index=112    csc_xmlver=${ess112_xmlver}

Verify ESS:112 SoftwareVersions timing
    [Tags]    ess112    software_versions    timing
    Verify Time Delta    ESS:112    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:112 ConfigurationsAvailable Event
    [Tags]    ess112    config_available
    Verify ConfigurationsAvailable    ESS    index=112

Verify ESS:112 ConfigurationsAvailable timing
    [Tags]    ess112    config_available    timing
    Verify Time Delta    ESS:112    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113
Verify ESS:113 Standby
    [Tags]    ess113    standby
    Verify Summary State    ${STATES}[standby]    ESS:113

Verify ESS:113 SoftwareVersions
    [Tags]    ess113    software_versions
    Verify Software Versions    ESS    index=113    csc_xmlver=${ess113_xmlver}

Verify ESS:113 SoftwareVersions timing
    [Tags]    ess113    software_versions    timing
    Verify Time Delta    ESS:113    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:113 ConfigurationsAvailable Event
    [Tags]    ess113    config_available
    Verify ConfigurationsAvailable    ESS    index=113

Verify ESS:113 ConfigurationsAvailable timing
    [Tags]    ess113    config_available    timing
    Verify Time Delta    ESS:113    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:114
Verify ESS:114 Standby
    [Tags]    ess114    standby
    Verify Summary State    ${STATES}[standby]    ESS:114

Verify ESS:114 SoftwareVersions
    [Tags]    ess114    software_versions
    Verify Software Versions    ESS    index=114    csc_xmlver=${ess114_xmlver}

Verify ESS:114 SoftwareVersions timing
    [Tags]    ess114    software_versions    timing
    Verify Time Delta    ESS:114    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:114 ConfigurationsAvailable Event
    [Tags]    ess114    config_available
    Verify ConfigurationsAvailable    ESS    index=114

Verify ESS:114 ConfigurationsAvailable timing
    [Tags]    ess114    config_available    timing
    Verify Time Delta    ESS:114    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:115
Verify ESS:115 Standby
    [Tags]    ess115    standby
    Verify Summary State    ${STATES}[standby]    ESS:115

Verify ESS:115 SoftwareVersions
    [Tags]    ess115    software_versions
    Verify Software Versions    ESS    index=115    csc_xmlver=${ess115_xmlver}

Verify ESS:115 SoftwareVersions timing
    [Tags]    ess115    software_versions    timing
    Verify Time Delta    ESS:115    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:115 ConfigurationsAvailable Event
    [Tags]    ess115    config_available
    Verify ConfigurationsAvailable    ESS    index=115

Verify ESS:115 ConfigurationsAvailable timing
    [Tags]    ess115    config_available    timing
    Verify Time Delta    ESS:115    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:116
Verify ESS:116 Standby
    [Tags]    ess116    standby
    Verify Summary State    ${STATES}[standby]    ESS:116

Verify ESS:116 SoftwareVersions
    [Tags]    ess116    software_versions
    Verify Software Versions    ESS    index=116    csc_xmlver=${ess116_xmlver}

Verify ESS:116 SoftwareVersions timing
    [Tags]    ess116    software_versions    timing
    Verify Time Delta    ESS:116    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:116 ConfigurationsAvailable Event
    [Tags]    ess116    config_available
    Verify ConfigurationsAvailable    ESS    index=116

Verify ESS:116 ConfigurationsAvailable timing
    [Tags]    ess116    config_available    timing
    Verify Time Delta    ESS:116    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:117
Verify ESS:117 Standby
    [Tags]    ess117    standby
    Verify Summary State    ${STATES}[standby]    ESS:117

Verify ESS:117 SoftwareVersions
    [Tags]    ess117    software_versions
    Verify Software Versions    ESS    index=117    csc_xmlver=${ess117_xmlver}

Verify ESS:117 SoftwareVersions timing
    [Tags]    ess117    software_versions    timing
    Verify Time Delta    ESS:117    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:117 ConfigurationsAvailable Event
    [Tags]    ess117    config_available
    Verify ConfigurationsAvailable    ESS    index=117

Verify ESS:117 ConfigurationsAvailable timing
    [Tags]    ess117    config_available    timing
    Verify Time Delta    ESS:117    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:121
Verify ESS:121 Standby
    [Tags]    ess121    standby
    Verify Summary State    ${STATES}[standby]    ESS:121

Verify ESS:121 SoftwareVersions
    [Tags]    ess121    software_versions
    Verify Software Versions    ESS    index=121    csc_xmlver=${ess121_xmlver}

Verify ESS:121 SoftwareVersions timing
    [Tags]    ess121    software_versions    timing
    Verify Time Delta    ESS:121    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:121 ConfigurationsAvailable Event
    [Tags]    ess121    config_available
    Verify ConfigurationsAvailable    ESS    index=121

Verify ESS:121 ConfigurationsAvailable timing
    [Tags]    ess121    config_available    timing
    Verify Time Delta    ESS:121    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:122
Verify ESS:122 Standby
    [Tags]    ess122    standby
    Verify Summary State    ${STATES}[standby]    ESS:122

Verify ESS:122 SoftwareVersions
    [Tags]    ess122    software_versions
    Verify Software Versions    ESS    index=122    csc_xmlver=${ess122_xmlver}

Verify ESS:122 SoftwareVersions timing
    [Tags]    ess122    software_versions    timing
    Verify Time Delta    ESS:122    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:122 ConfigurationsAvailable Event
    [Tags]    ess122    config_available
    Verify ConfigurationsAvailable    ESS    index=122

Verify ESS:122 ConfigurationsAvailable timing
    [Tags]    ess122    config_available    timing
    Verify Time Delta    ESS:122    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:123
Verify ESS:123 Standby
    [Tags]    ess123    standby
    Verify Summary State    ${STATES}[standby]    ESS:123

Verify ESS:123 SoftwareVersions
    [Tags]    ess123    software_versions
    Verify Software Versions    ESS    index=123    csc_xmlver=${ess123_xmlver}

Verify ESS:123 SoftwareVersions timing
    [Tags]    ess123    software_versions    timing
    Verify Time Delta    ESS:123    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:123 ConfigurationsAvailable Event
    [Tags]    ess123    config_available
    Verify ConfigurationsAvailable    ESS    index=123

Verify ESS:123 ConfigurationsAvailable timing
    [Tags]    ess123    config_available    timing
    Verify Time Delta    ESS:123    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:124
Verify ESS:124 Standby
    [Tags]    ess124    standby
    Verify Summary State    ${STATES}[standby]    ESS:124

Verify ESS:124 SoftwareVersions
    [Tags]    ess124    software_versions
    Verify Software Versions    ESS    index=124    csc_xmlver=${ess124_xmlver}

Verify ESS:124 SoftwareVersions timing
    [Tags]    ess124    software_versions    timing
    Verify Time Delta    ESS:124    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:124 ConfigurationsAvailable Event
    [Tags]    ess124    config_available
    Verify ConfigurationsAvailable    ESS    index=124

Verify ESS:124 ConfigurationsAvailable timing
    [Tags]    ess124    config_available    timing
    Verify Time Delta    ESS:124    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:125
Verify ESS:125 Standby
    [Tags]    ess125    standby
    Verify Summary State    ${STATES}[standby]    ESS:125

Verify ESS:125 SoftwareVersions
    [Tags]    ess125    software_versions
    Verify Software Versions    ESS    index=125    csc_xmlver=${ess125_xmlver}

Verify ESS:125 SoftwareVersions timing
    [Tags]    ess125    software_versions    timing
    Verify Time Delta    ESS:125    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:125 ConfigurationsAvailable Event
    [Tags]    ess125    config_available
    Verify ConfigurationsAvailable    ESS    index=125

Verify ESS:125 ConfigurationsAvailable timing
    [Tags]    ess125    config_available    timing
    Verify Time Delta    ESS:125    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:126
Verify ESS:126 Standby
    [Tags]    ess126    standby
    Verify Summary State    ${STATES}[standby]    ESS:126

Verify ESS:126 SoftwareVersions
    [Tags]    ess126    software_versions
    Verify Software Versions    ESS    index=126    csc_xmlver=${ess126_xmlver}

Verify ESS:126 SoftwareVersions timing
    [Tags]    ess126    software_versions    timing
    Verify Time Delta    ESS:126    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:126 ConfigurationsAvailable Event
    [Tags]    ess126    config_available
    Verify ConfigurationsAvailable    ESS    index=126

Verify ESS:126 ConfigurationsAvailable timing
    [Tags]    ess126    config_available    timing
    Verify Time Delta    ESS:126    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:127
Verify ESS:127 Standby
    [Tags]    ess127    standby
    Verify Summary State    ${STATES}[standby]    ESS:127

Verify ESS:127 SoftwareVersions
    [Tags]    ess127    software_versions
    Verify Software Versions    ESS    index=127    csc_xmlver=${ess127_xmlver}
    
Verify ESS:127 SoftwareVersions timing
    [Tags]    ess127    software_versions    timing
    Verify Time Delta    ESS:127    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ESS:127 ConfigurationsAvailable Event
    [Tags]    ess127    config_available
    Verify ConfigurationsAvailable    ESS    index=127
    
Verify ESS:127 ConfigurationsAvailable timing
    [Tags]    ess127    config_available    timing
    Verify Time Delta    ESS:127    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
# ESS:128
Verify ESS:128 Standby
    [Tags]    ess128    standby
    Verify Summary State    ${STATES}[standby]    ESS:128

Verify ESS:128 SoftwareVersions
    [Tags]    ess128    software_versions
    Verify Software Versions    ESS    index=128    csc_xmlver=${ess128_xmlver}

Verify ESS:128 SoftwareVersions timing
    [Tags]    ess128    software_versions    timing
    Verify Time Delta    ESS:128    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:128 ConfigurationsAvailable Event
    [Tags]    ess128    config_available
    Verify ConfigurationsAvailable    ESS    index=128

Verify ESS:128 ConfigurationsAvailable timing
    [Tags]    ess128    config_available    timing
    Verify Time Delta    ESS:128    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:129
Verify ESS:129 Standby
    [Tags]    ess129    standby
    Verify Summary State    ${STATES}[standby]    ESS:129

Verify ESS:129 SoftwareVersions
    [Tags]    ess129    software_versions
    Verify Software Versions    ESS    index=129    csc_xmlver=${ess129_xmlver}

Verify ESS:129 SoftwareVersions timing
    [Tags]    ess129    software_versions    timing
    Verify Time Delta    ESS:129    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:129 ConfigurationsAvailable Event
    [Tags]    ess129    config_available
    Verify ConfigurationsAvailable    ESS    index=129

Verify ESS:129 ConfigurationsAvailable timing
    [Tags]    ess129    config_available    timing
    Verify Time Delta    ESS:129    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Standby
    [Tags]    ess201    standby
    Verify Summary State    ${STATES}[standby]    ESS:201

Verify ESS:201 SoftwareVersions
    [Tags]    ess201    software_versions
    Verify Software Versions    ESS    index=201    csc_xmlver=${ess201_xmlver}

Verify ESS:201 SoftwareVersions timing
    [Tags]    ess201    software_versions    timing
    Verify Time Delta    ESS:201    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:201 ConfigurationsAvailable Event
    [Tags]    ess201    config_available
    Verify ConfigurationsAvailable    ESS    index=201

Verify ESS:201 ConfigurationsAvailable timing
    [Tags]    ess201    config_available    timing
    Verify Time Delta    ESS:201    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Standby
    [Tags]    ess202    standby
    Verify Summary State    ${STATES}[standby]    ESS:202

Verify ESS:202 SoftwareVersions
    [Tags]    ess202    software_versions
    Verify Software Versions    ESS    index=202    csc_xmlver=${ess202_xmlver}

Verify ESS:202 SoftwareVersions timing
    [Tags]    ess202    software_versions    timing
    Verify Time Delta    ESS:202    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:202 ConfigurationsAvailable Event
    [Tags]    ess202    config_available
    Verify ConfigurationsAvailable    ESS    index=202

Verify ESS:202 ConfigurationsAvailable timing
    [Tags]    ess202    config_available    timing
    Verify Time Delta    ESS:202    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Standby
    [Tags]    ess204    standby
    Verify Summary State    ${STATES}[standby]    ESS:204

Verify ESS:204 SoftwareVersions
    [Tags]    ess204    software_versions
    Verify Software Versions    ESS    index=204    csc_xmlver=${ess204_xmlver}

Verify ESS:204 SoftwareVersions timing
    [Tags]    ess204    software_versions    timing
    Verify Time Delta    ESS:204    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:204 ConfigurationsAvailable Event
    [Tags]    ess204    config_available
    Verify ConfigurationsAvailable    ESS    index=204

Verify ESS:204 ConfigurationsAvailable timing
    [Tags]    ess204    config_available    timing
    Verify Time Delta    ESS:204    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
Verify ESS:301 Standby
    [Tags]    ess301    standby
    Verify Summary State    ${STATES}[standby]    ESS:301

Verify ESS:301 SoftwareVersions
    [Tags]    ess301    software_versions
    Verify Software Versions    ESS    index=301    csc_xmlver=${ess301_xmlver}

Verify ESS:301 SoftwareVersions timing
    [Tags]    ess301    software_versions    timing
    Verify Time Delta    ESS:301    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 ConfigurationsAvailable Event
    [Tags]    ess301    config_available
    Verify ConfigurationsAvailable    ESS    index=301

Verify ESS:301 ConfigurationsAvailable timing
    [Tags]    ess301    config_available    timing
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

# ESS:308
Verify ESS:308 Standby
    [Tags]    ess308    standby
    Verify Summary State    ${STATES}[standby]    ESS:308

Verify ESS:308 SoftwareVersions
    [Tags]    ess308    software_versions
    Verify Software Versions    ESS    index=308    csc_xmlver=${ess308_xmlver}

Verify ESS:308 SoftwareVersions timing
    [Tags]    ess308    software_versions    timing
    Verify Time Delta    ESS:308    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:308 ConfigurationsAvailable Event
    [Tags]    ess308    config_available
    Verify ConfigurationsAvailable    ESS    index=308

Verify ESS:308 ConfigurationsAvailable timing
    [Tags]    ess308    config_available    timing
    Verify Time Delta    ESS:308    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:403
Verify ESS:403 Standby
    [Tags]    ess403    standby
    Verify Summary State    ${STATES}[standby]    ESS:403

Verify ESS:403 SoftwareVersions
    [Tags]    ess403    software_versions
    Verify Software Versions    ESS    index=403    csc_xmlver=${ess403_xmlver}

Verify ESS:403 SoftwareVersions timing
    [Tags]    ess403    software_versions    timing
    Verify Time Delta    ESS:403    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:403 ConfigurationsAvailable Event
    [Tags]    ess403    config_available
    Verify ConfigurationsAvailable    ESS    index=403

Verify ESS:403 ConfigurationsAvailable timing
    [Tags]    ess403    config_available    timing
    Verify Time Delta    ESS:403    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:404
Verify ESS:404 Standby
    [Tags]    ess404    standby
    Verify Summary State    ${STATES}[standby]    ESS:404

Verify ESS:404 SoftwareVersions
    [Tags]    ess404    software_versions
    Verify Software Versions    ESS    index=404    csc_xmlver=${ess404_xmlver}

Verify ESS:404 SoftwareVersions timing
    [Tags]    ess404    software_versions    timing
    Verify Time Delta    ESS:404    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:404 ConfigurationsAvailable Event
    [Tags]    ess404    config_available
    Verify ConfigurationsAvailable    ESS    index=404

Verify ESS:404 ConfigurationsAvailable timing
    [Tags]    ess404    config_available    timing
    Verify Time Delta    ESS:404    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:405
Verify ESS:405 Standby
    [Tags]    ess405    standby
    Verify Summary State    ${STATES}[standby]    ESS:405

Verify ESS:405 SoftwareVersions
    [Tags]    ess405    software_versions
    Verify Software Versions    ESS    index=405    csc_xmlver=${ess405_xmlver}

Verify ESS:405 SoftwareVersions timing
    [Tags]    ess405    software_versions    timing
    Verify Time Delta    ESS:405    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:405 ConfigurationsAvailable Event
    [Tags]    ess405    config_available
    Verify ConfigurationsAvailable    ESS    index=405

Verify ESS:405 ConfigurationsAvailable timing
    [Tags]    ess405    config_available    timing
    Verify Time Delta    ESS:405    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:441
Verify ESS:441 Standby
    [Tags]    ess441    standby    
    Verify Summary State    ${STATES}[standby]    ESS:441

Verify ESS:441 SoftwareVersions
    [Tags]    ess441    software_versions
    Verify Software Versions    ESS    index=441    csc_xmlver=${ess441_xmlver}

Verify ESS:441 SoftwareVersions timing
    [Tags]    ess441    software_versions    timing
    Verify Time Delta    ESS:441    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:441 ConfigurationsAvailable Event
    [Tags]    ess441    config_available
    Verify ConfigurationsAvailable    ESS    index=441

Verify ESS:441 ConfigurationsAvailable timing
    [Tags]    ess441    config_available    timing
    Verify Time Delta    ESS:441    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:442
Verify ESS:442 Standby
    [Tags]    ess442    standby
    Verify Summary State    ${STATES}[standby]    ESS:442

Verify ESS:442 SoftwareVersions
    [Tags]    ess442    software_versions
    Verify Software Versions    ESS    index=442    csc_xmlver=${ess442_xmlver}

Verify ESS:442 SoftwareVersions timing
    [Tags]    ess442    software_versions    timing
    Verify Time Delta    ESS:442    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:442 ConfigurationsAvailable Event
    [Tags]    ess442    config_available
    Verify ConfigurationsAvailable    ESS    index=442

Verify ESS:442 ConfigurationsAvailable timing
    [Tags]    ess442    config_available    timing
    Verify Time Delta    ESS:442    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:443
Verify ESS:443 Standby
    [Tags]    ess443    standby
    Verify Summary State    ${STATES}[standby]    ESS:443

Verify ESS:443 SoftwareVersions
    [Tags]    ess443    software_versions
    Verify Software Versions    ESS    index=443    csc_xmlver=${ess443_xmlver}

Verify ESS:443 SoftwareVersions timing
    [Tags]    ess443    software_versions    timing
    Verify Time Delta    ESS:443    logevent_softwareVersions    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:443 ConfigurationsAvailable Event
    [Tags]    ess443    config_available
    Verify ConfigurationsAvailable    ESS    index=443

Verify ESS:443 ConfigurationsAvailable timing
    [Tags]    ess443    config_available    timing
    Verify Time Delta    ESS:443    logevent_configurationsAvailable    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
