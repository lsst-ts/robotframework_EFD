*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    bigcam
Suite Setup   Set Environment Values

*** Variables ***
${cccamera_salver}    ${SALVersion}
${cccamera_xmlver}    ${XMLVersion}
${ccoods_salver}    ${SALVersion}
${ccoods_xmlver}    ${XMLVersion}
${ccheaderservice_salver}    ${SALVersion}
${ccheaderservice_xmlver}    ${XMLVersion}
${mtcamera_salver}    ${SALVersion}
${mtcamera_xmlver}    ${XMLVersion}
${mtoods_salver}    ${SALVersion}
${mtoods_xmlver}    ${XMLVersion}
${mtheaderservice_salver}    ${SALVersion}
${mtheaderservice_xmlver}    ${XMLVersion}
${time_window}    10

*** Test Cases ***
#BigCamera
Verify BigCamera Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ${BigCamera}
    
Verify BigCamera SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ${BigCamera}    csc_salver=${camera_salver}    csc_xmlver=${camera_xmlver}

Verify BigCamera SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${BigCamera}    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify BigCamera ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ${BigCamera}

Verify BigCamera ConfigurationsAvailable timing
    [Tags]    config_available    timing
    Verify Time Delta    ${BigCamera}    logevent_summaryState    logevent_configurationsAvailable    ${time_window}

#OODS
Verify OODS Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ${OODS}

Verify OODS SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ${OODS}    csc_salver=${oods_salver}    csc_xmlver=${oods_xmlver}

Verify OODS SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${OODS}    logevent_summaryState    logevent_softwareVersions    ${time_window}

Verify OODS ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ${OODS}

#HeaderService
Verify HeaderService Standby
    [Tags]    standby
    Verify Summary State    ${STATES}[standby]    ${HeadServ}

Verify HeaderService ConfigurationsAvailable Event
    [Tags]    config_available
    Verify ConfigurationsAvailable    ${HeadServ}

Verify HeaderService SoftwareVersions
    [Tags]    software_versions
    Verify Software Versions    ${HeadServ}    csc_salver=${headerservice_salver}    csc_xmlver=${headerservice_xmlver}

Verify HeaderService SoftwareVersions timing
    [Tags]    software_versions    timing
    Verify Time Delta    ${HeadServ}    logevent_summaryState    logevent_softwareVersions    ${time_window}

*** Keywords ***
Set Environment Values
    [Documentation]    Define the BigCamera specific variable values.  ComCam for TTS and LSSTCam for BTS.
    IF    "${env_efd}" == "tucson_teststand_efd"
        Set Suite Variable    \${BigCamera}    ComCam
        Set Suite Variable    \${camera_salver}    ${cccamera_salver}
        Set Suite Variable    \${camera_xmlver}    ${cccamera_xmlver}
        Set Suite Variable    \${OODS}    CCOODS
        Set Suite Variable    \${oods_salver}    ${ccoods_salver}
        Set Suite Variable    \${oods_xmlver}    ${ccoods_xmlver}
        Set Suite Variable    \${HeadServ}    CCHeaderService
        Set Suite Variable    \${headerservice_salver}    ${ccheaderservice_salver}
        Set Suite Variable    \${headerservice_xmlver}    ${ccheaderservice_xmlver}
    ELSE IF    "${env_efd}" == "base_efd"
        Set Suite Variable    \${BigCamera}    LSSTCam
        Set Suite Variable    \${camera_salver}    ${mtcamera_salver}
        Set Suite Variable    \${camera_xmlver}    ${mtcamera_xmlver}
        Set Suite Variable    \${OODS}    MTOODS
        Set Suite Variable    \${oods_salver}    ${mtoods_salver}
        Set Suite Variable    \${oods_xmlver}    ${mtoods_xmlver}
        Set Suite Variable    \${HeadServ}    MTHeaderService
        Set Suite Variable    \${headerservice_salver}    ${mtheaderservice_salver}
        Set Suite Variable    \${headerservice_xmlver}    ${mtheaderservice_xmlver}
    ELSE
        Fail    msg="Please set the env_efd variable; allowed values are ['tucson_teststand_efd', 'base_efd']"
    END
