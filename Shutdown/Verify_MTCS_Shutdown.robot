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
Verify LaserTracker:1 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    LaserTracker    index=1
    Verify Time Delta    LaserTracker    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify MTAirCompressor:1 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTAirCompressor    index=1
    Verify Time Delta    MTAirCompressor    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify MTAirCompressor:2 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTAirCompressor    index=2
    Verify Time Delta    MTAirCompressor    ${topic_1}    ${topic_2}    ${time_window}    index=2

Verify MTMount Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTMount
    Verify Time Delta    MTMount    ${topic_1}    ${topic_2}    ${time_window}

Verify MTPtg Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTPtg
    Verify Time Delta    MTPtg    ${topic_1}    ${topic_2}    ${time_window}

Verify MTDome Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTDome
    Verify Time Delta    MTDome    ${topic_1}    ${topic_2}    ${time_window}

Verify MTDomeTrajectory Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTDomeTrajectory
    Verify Time Delta    MTDomeTrajectory    ${topic_1}    ${topic_2}    ${time_window}

Verify MTAOS Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTAOS
    Verify Time Delta    MTAOS    ${topic_1}    ${topic_2}    ${time_window}

Verify MTHexapod:1 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTHexapod    index=1
    Verify Time Delta    MTHexapod    ${topic_1}    ${topic_2}    ${time_window}    index=1

Verify MTHexapod:2 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTHexapod    index=2
    Verify Time Delta    MTHexapod    ${topic_1}    ${topic_2}    ${time_window}    index=2

Verify MTRotator Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTRotator
    Verify Time Delta    MTRotator    ${topic_1}    ${topic_2}    ${time_window}

Verify MTM1M3 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTM1M3
    Verify Time Delta    MTM1M3    ${topic_1}    ${topic_2}    ${time_window}

Verify MTM2 Shutdown
    [Tags]    mtcs
    Verify Shutdown Process    MTM2
    Verify Time Delta    MTM2    ${topic_1}    ${topic_2}    ${time_window}
