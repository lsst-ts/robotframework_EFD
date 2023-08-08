*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown
Suite Setup   Set Environment Values

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify Camera Shutdown
    [Tags]    bigcamera
    Verify Shutdown Process    ${BigCamera}
    Verify Time Delta    ${BigCamera}    ${topic_1}    ${topic_2}    ${time_window}

Verify OODS Shutdown
    [Tags]    bigcamera
    Verify Shutdown Process    ${OODS}
    Verify Time Delta    ${OODS}    ${topic_1}    ${topic_2}    ${time_window}

Verify HeaderService Shutdown
    [Tags]    bigcamera
    Verify Shutdown Process    ${HeadServ}
    Verify Time Delta    ${HeadServ}    ${topic_1}    ${topic_2}    ${time_window}

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
