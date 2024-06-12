*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown
Suite Setup   Set EFD Values

*** Variables ***
${topic_1}    command_disable
${topic_2}    logevent_summaryState

*** Test Cases ***
Verify BigCamera Shutdown
    [Tags]
    Set Tags    ${BigCamera}
    Verify Shutdown Process    ${BigCamera}
    Verify Time Delta    ${BigCamera}    ${topic_1}    ${topic_2}

Verify OODS Shutdown
    [Tags]
    Set Tags    ${OODS}
    Verify Shutdown Process    ${OODS}
    Verify Time Delta    ${OODS}    ${topic_1}    ${topic_2}

Verify HeaderService Shutdown
    [Tags]
    Set Tags    ${HeaderService}
    Verify Shutdown Process    ${HeaderService}
    Verify Time Delta    ${HeaderService}    ${topic_1}    ${topic_2}

Verify OCPS:2||3 Shutdown
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    Verify Shutdown Process    OCPS    index=${OcpsIndex}
    Verify Time Delta    OCPS    ${topic_1}    ${topic_2}    index=${OcpsIndex}
