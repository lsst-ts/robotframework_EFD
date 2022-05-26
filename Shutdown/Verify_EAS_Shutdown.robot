*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Library    DateTime
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

Verify WeatherStation:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    WeatherStation    1
    Verify Time Delta    WeatherStation    ${topic_1}    ${topic_2}    ${time_window}    index=1
