*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    shutdown

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify CCArchiver Shutdown
    [Tags]    comcam
    Verify Shutdown Process    CCArchiver
    Verify Time Delta    CCArchiver    ${topic_1}    ${topic_2}    ${time_window}

Verify CCCamera Shutdown
    [Tags]    comcam
    Verify Shutdown Process    CCCamera
    Verify Time Delta    CCCamera    ${topic_1}    ${topic_2}    ${time_window}

Verify CCHeaderService Shutdown
    [Tags]    comcam
    Verify Shutdown Process    CCHeaderService
    Verify Time Delta    CCHeaderService    ${topic_1}    ${topic_2}    ${time_window}
