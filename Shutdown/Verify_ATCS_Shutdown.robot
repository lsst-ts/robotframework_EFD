*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown
Suite Setup    Log Many    ${STATES}[offline]

*** Variables ***
${topic_1}    logevent_summaryState
${topic_2}    command_disable
${time_window}    600

*** Test Cases ***
Verify ATAOS Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATAOS
    Verify Time Delta    ATAOS    ${topic_1}    ${topic_2}    ${time_window}

Verify ATDome Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATDome
    Verify Time Delta    ATDome    ${topic_1}    ${topic_2}    ${time_window}

Verify ATDomeTrajectory Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATDomeTrajectory
    Verify Time Delta    ATDomeTrajectory    ${topic_1}    ${topic_2}    ${time_window}

Verify ATHexapod Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATHexapod
    Verify Time Delta    ATHexapod    ${topic_1}    ${topic_2}    ${time_window}

Verify ATMCS Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATMCS
    Verify Time Delta    ATMCS    ${topic_1}    ${topic_2}    ${time_window}

Verify ATPneumatics Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATPneumatics
    Verify Time Delta    ATPneumatics    ${topic_1}    ${topic_2}    ${time_window}

Verify ATPtg Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATPtg
    Verify Time Delta    ATPtg    ${topic_1}    ${topic_2}    ${time_window}

