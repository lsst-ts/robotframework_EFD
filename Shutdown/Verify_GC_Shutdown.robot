*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Variables ***
${topic_1}    command_disable
${topic_2}    logevent_summaryState

*** Test Cases ***
Verify GenericCamera:1 Shutdown
    [Tags]    gc
    Verify Shutdown Process    GenericCamera    index=1
    Verify Time Delta    GenericCamera    ${topic_1}    ${topic_2}    index=1

Verify GCHeaderService:1 Shutdown
    [Tags]    gc
    Verify Shutdown Process    GCHeaderService    index=1
    Verify Time Delta    GCHeaderService    ${topic_1}    ${topic_2}    index=1
