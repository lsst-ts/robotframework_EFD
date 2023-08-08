*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    bigcam
Suite Setup   Set Environment Values

*** Variables ***
${time_window}    10

*** Test Cases ***
#BigCamera
Verify BigCamera Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    BigCamera

Verify BigCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${BigCamera}

Verify BigCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    ${BigCamera}    logevent_summaryState    logevent_configurationApplied    ${time_window}

#OODS
Verify OODS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ${OODS}

Verify OODS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${OODS}

#HeaderService
Verify HeaderService Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ${HeadServ}

Verify HeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ${HeadServ}

*** Keywords ***
Set Environment Values
    [Documentation]    Define the BigCamera specific variable values.  ComCam for TTS and LSSTCam for BTS.
    IF    "${env_efd}" == "tucson_teststand_efd"
        Set Suite Variable    \${BigCamera}    ComCam
        Set Suite Variable    \${OODS}    CCOODS
        Set Suite Variable    \${HeadServ}    CCHeaderService
    ELSE IF    "${env_efd}" == "base_efd"
        Set Suite Variable    \${BigCamera}    LSSTCam
        Set Suite Variable    \${OODS}    MTOODS
        Set Suite Variable    \${HeadServ}    MTHeaderService
    ELSE
        Fail    msg="Please set the env_efd variable; allowed values are ['tucson_teststand_efd', 'base_efd']"
    END
