*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown
Suite Setup    Log Many    ${STATES}[offline]

*** Test Cases ***
Verify ATAOS Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATAOS

Verify ATDome Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATDome

Verify ATDomeTrajectory Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATDomeTrajectory

Verify ATHexapod Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATHexapod

Verify ATMCS Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATMCS

Verify ATPneumatics Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATPneumatics

Verify ATPtg Shutdown
    [Tags]    atcs
    Verify Shutdown Process    ATPtg

