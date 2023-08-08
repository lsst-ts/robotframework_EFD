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
# DIMM
Verify DIMM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    index=1
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify DIMM:2 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    index=2
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    ${time_window}    index=2

#DSM
Verify DSM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DSM    index=1
    Verify Time Delta    DSM    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify DSM:2 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DSM    index=2
    Verify Time Delta    DSM    ${topic_1}    ${topic_2}    ${time_window}    index=2

# ESS
Verify ESS:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=1
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify ESS:101 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=101
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=101

Verify ESS:102 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=102
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=102

Verify ESS:103 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=103
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=103

Verify ESS:104 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=104
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=104

Verify ESS:105 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=105
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=105

Verify ESS:201 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=201
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=201

Verify ESS:202 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=202
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=202

Verify ESS:203 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=203
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=203

Verify ESS:204 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=204
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=204

Verify ESS:301 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=301
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    ${time_window}    index=301
