*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    bigcamera
Suite Setup   Set Environment Values

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify Camera Shutdown
    [Tags]
    Verify Shutdown Process    ${BigCamera}
    Verify Time Delta    ${BigCamera}    ${topic_1}    ${topic_2}    ${time_window}

Verify OODS Shutdown
    [Tags]
    Verify Shutdown Process    ${OODS}
    Verify Time Delta    ${OODS}    ${topic_1}    ${topic_2}    ${time_window}

Verify HeaderService Shutdown
    [Tags]
    Verify Shutdown Process    ${HeadServ}
    Verify Time Delta    ${HeadServ}    ${topic_1}    ${topic_2}    ${time_window}

Verify OCPS:2||3 Shutdown
    [Tags]
    Verify Shutdown Process    OCPS    index=${OcpsIndex}
    Verify Time Delta    OCPS    ${topic_1}    ${topic_2}    ${time_window}    index=2
