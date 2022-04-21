*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    shutdown    skipped

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify ATMonochromator Shutdown
    [Tags]    at_light_cal
    Verify Shutdown Process    ATMonochromator
    Verify Time Delta    ATMonochromator    ${topic_1}    ${topic_2}    ${time_window}

Verify FiberSpectrograph:3 Shutdown
    [Tags]    at_light_cal
    Verify Shutdown Process    FiberSpectrograph    3
    Verify Time Delta    FiberSpectrograph    ${topic_1}    ${topic_2}    ${time_window}    index=3
