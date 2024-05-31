*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Variables ***
${topic_1}    command_disable
${topic_2}    logevent_summaryState

*** Test Cases ***
# DIMM
Verify DIMM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    index=1
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    index=1

Verify DIMM:2 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DIMM    index=2
    Verify Time Delta    DIMM    ${topic_1}    ${topic_2}    index=2

#DSM
Verify DSM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DSM    index=1
    Verify Time Delta    DSM    ${topic_1}    ${topic_2}    index=1

Verify DSM:2 Shutdown
    [Tags]    eas
    Verify Shutdown Process    DSM    index=2
    Verify Time Delta    DSM    ${topic_1}    ${topic_2}    index=2

# EPM:1
Verify EPM:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    EPM    index=1
    Verify Time Delta    EPM    ${topic_1}    ${topic_2}    index=1

# ESS
Verify ESS:1 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=1
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=1

Verify ESS:101 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=101
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=101

Verify ESS:102 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=102
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=102

Verify ESS:103 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=103
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=103

Verify ESS:104 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=104
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=104

Verify ESS:105 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=105
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=105

Verify ESS:106 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=106
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=106

Verify ESS:107 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=107
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=107

Verify ESS:108 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=108
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=108

Verify ESS:201 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=201
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=201

Verify ESS:202 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=202
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=202

Verify ESS:203 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=203
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=203

Verify ESS:204 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=204
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=204

Verify ESS:205 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=205
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=205

Verify ESS:301 Shutdown
    [Tags]    eas
    Verify Shutdown Process    ESS    index=301
    Verify Time Delta    ESS    ${topic_1}    ${topic_2}    index=301
