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
Verify DSM:1 Shutdown
    [Tags]    eas_ae
    Verify Shutdown Process    DSM    index=1
    Verify Time Delta    DSM    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify DSM:2 Shutdown
    [Tags]    eas_ae
    Verify Shutdown Process    DSM    index=2
    Verify Time Delta    DSM    ${topic_1}    ${topic_2}    ${time_window}    index=2

Verify WeatherForecast Shutdown
    [Tags]    eas
    Verify Shutdown Process    WeatherForecast
    Verify Time Delta    WeatherForecast    ${topic_1}    ${topic_2}    ${time_window}
