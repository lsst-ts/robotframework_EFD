*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled
Suite Setup   Set Environment Values

*** Variables ***

*** Test Cases ***
Verify BigCamera Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    ${BigCamera}

Verify OODS Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    ${OODS}

Verify HeaderService Enabled
    [Tags]    comcam
    Verify Summary State    ${STATES}[enabled]    ${HeadServ}

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
