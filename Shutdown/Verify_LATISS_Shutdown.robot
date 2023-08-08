*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify ATOODS Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATOODS
    Verify Time Delta    ATOODS    ${topic_1}    ${topic_2}    ${time_window}

Verify ATCamera Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATCamera
    Verify Time Delta    ATCamera    ${topic_1}    ${topic_2}    ${time_window}

Verify ATHeaderService Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATHeaderService
    Verify Time Delta    ATHeaderService    ${topic_1}    ${topic_2}    ${time_window}

Verify ATSpectrograph Shutdown
    [Tags]    latiss
    Verify Shutdown Process    ATSpectrograph
    Verify Time Delta    ATSpectrograph    ${topic_1}    ${topic_2}    ${time_window}
