*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    obsys2
Suite Setup   Set Environment Values

*** Variables ***
${ocps1_salver}    ${SALVersion}
${ocps1_xmlver}    ${XMLVersion}
${ocps2_salver}    ${SALVersion}
${ocps2_xmlver}    ${XMLVersion}
${ocps3_salver}    ${SALVersion}
${ocps3_xmlver}    ${XMLVersion}
${scheduler1_salver}    ${SALVersion}
${scheduler1_xmlver}    ${XMLVersion}
${scheduler2_salver}    ${SALVersion}
${scheduler2_xmlver}    ${XMLVersion}
${time_window}    10

*** Test Cases ***
#OCPS:1
Verify OCPS:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:1

Verify OCPS:1 SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    OCPS    index=1    csc_salver=${ocps1_salver}    csc_xmlver=${ocps1_xmlver}

Verify OCPS:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=1

Verify OCPS:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    index=1

Verify OCPS:1 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    1

#OCPS:2
Verify OCPS:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    OCPS:2

Verify OCPS:2 SoftwareVersions
    [Tags]    software_versions
    Verify SoftwareVersions    OCPS    index=${OcpsIndex}    csc_salver=${ocps_salver}    csc_xmlver=${ocps_xmlver}

Verify OCPS:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=2

Verify OCPS:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    OCPS    index=2

Verify OCPS:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    OCPS    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=2

#Scheduler:1
Verify Scheduler:1 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:1

Verify Scheduler:1 SoftwareVersions
    [Tags]    software_versions 
    Verify Software Versions    Scheduler    index=1    csc_salver=${scheduler1_salver}    csc_xmlver=${scheduler1_xmlver}

Verify Scheduler:1 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=1

Verify Scheduler:1 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    index=1

Verify Scheduler:1 ConfigurationsAvailable timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=1

#Scheduler:2
Verify Scheduler:2 Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    Scheduler:2

Verify Scheduler:2 SoftwareVersions
    [Tags]    software_versions 
    Verify Software Versions    Scheduler    index=2    csc_salver=${scheduler2_salver}    csc_xmlver=${scheduler2_xmlver}

Verify Scheduler:2 SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_softwareVersions    ${time_window}    index=2

Verify Scheduler:2 ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    Scheduler    index=2

Verify Scheduler:2 ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    Scheduler    logevent_summaryState    logevent_configurationsAvailable    ${time_window}    index=2

*** Keywords ***
Set Environment Values
    [Documentation]    Define the BigCamera specific variable values.  ComCam and OCSP:2 for TTS and LSSTCam and OCPS:3 for BTS.
    IF    "${env_efd}" == "tucson_teststand_efd"
        Set Suite Variable    \${OcpsIndex}    2
        Set Suite Variable    \${ocps_salver}    ${ocps2_salver}
        Set Suite Variable    \${ocps_xmlver}    ${ocps2_xmlver}
    ELSE IF    "${env_efd}" == "base_efd"
        Set Suite Variable    \${OcpsIndex}    3
        Set Suite Variable    \${ocps_salver}    ${ocps3_salver}
        Set Suite Variable    \${ocps_xmlver}    ${ocps3_xmlver}
    ELSE
        Fail    msg="Please set the env_efd variable; allowed values are ['tucson_teststand_efd', 'base_efd']"
    END
