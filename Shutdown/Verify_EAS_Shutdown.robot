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
Verify DIMM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    1
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify DIMM:2 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    2
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    ${time_window}    index=2

Verify WeatherStation:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    WeatherStation    1
    Verify Time Delta    WeatherStation    ${topic_1}    ${topic_2}    ${time_window}    index=1
