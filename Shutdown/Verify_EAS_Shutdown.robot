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
Verify DIMM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    index=1
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    ${time_window}    index=1
