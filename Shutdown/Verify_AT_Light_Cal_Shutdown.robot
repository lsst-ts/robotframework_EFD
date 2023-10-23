*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    skipped

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable

*** Test Cases ***
Verify ATMonochromator Shutdown
    [Tags]    at_light_cal
    Verify Shutdown Process    ATMonochromator
    Verify Time Delta    ATMonochromator    ${topic_1}    ${topic_2}

Verify FiberSpectrograph:3 Shutdown
    [Tags]    at_light_cal
    Verify Shutdown Process    FiberSpectrograph    index=3
    Verify Time Delta    FiberSpectrograph    ${topic_1}    ${topic_2}    index=3
