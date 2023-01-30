*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    shutdown

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify CCOODS Shutdown
    [Tags]    comcam
    Verify Shutdown Process    CCOODS
    Verify Time Delta    CCOODS    ${topic_1}    ${topic_2}    ${time_window}

Verify CCCamera Shutdown
    [Tags]    comcam
    Verify Shutdown Process    CCCamera
    Verify Time Delta    CCCamera    ${topic_1}    ${topic_2}    ${time_window}

Verify CCHeaderService Shutdown
    [Tags]    comcam
    Verify Shutdown Process    CCHeaderService
    Verify Time Delta    CCHeaderService    ${topic_1}    ${topic_2}    ${time_window}
