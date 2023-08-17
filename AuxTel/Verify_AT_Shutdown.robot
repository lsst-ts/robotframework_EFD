# -*- coding: robot -*-
*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     Collections
Force Tags    auxtel_stop
Suite Setup    Check If Failed

*** Variables ***
@{atMountState}         state
@{states_expected}      8
${time_window}          10

*** Test Cases ***
Execute AuxTel Shutdown
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_shutdown
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATAOS Corrections Disabled
    [Documentation]    Corrections should already be enabled, ensure nothing was changed prior to running this script.
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["atspectrograph", "focus", "hexapod", "m1", "m2", "moveWhileExposing",]    1    None
    Should Not Be True    $dataframe.atspectrograph.values
    Should Not Be True    $dataframe.focus.values
    Should Not Be True    $dataframe.hexapod.values
    Should Not Be True    $dataframe.m1.values
    Should Not Be True    $dataframe.m2.values
    Should Not Be True    $dataframe.moveWhileExposing.values

Verify ATPneumatics m1CoverState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #Closed

Verify ATPneumatics m1CoverLimitSwitches Closed
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverLimitSwitches    ["*",]    1    None
    Should Not Be True    ${dataframe.cover1OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover2OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover3OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover4OpenedActive.values}[0]
    Should Be True    ${dataframe.cover1ClosedActive.values}[0]
    Should Be True    ${dataframe.cover2ClosedActive.values}[0]
    Should Be True    ${dataframe.cover3ClosedActive.values}[0]
    Should Be True    ${dataframe.cover4ClosedActive.values}[0]

Verify ATPneumatics m1VentsLimitSwitches Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1VentsLimitSwitches    ["*",]    1    None
    Should Not Be True    ${dataframe.ventsOpenedActive.values}[0]
    Should Be True    ${dataframe.ventsClosedActive.values}[0]

Verify ATMCS logevent_atMountState
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_atMountState    ["state",]    ["8",]    #TRACKINGDISABLED

Verify AuxTel Is Parked
    [Tags]    robot:continue-on-failure
    Verify Telescope Parked    auxtel
    Verify Dome Parked    auxtel

Verify AuxTel CSCs Standby
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[standby]    ATMCS
    Verify Summary State    ${STATES}[standby]    ATPtg
    Verify Summary State    ${STATES}[standby]    ATDome
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory
    Verify Summary State    ${STATES}[standby]    ATAOS
    Verify Summary State    ${STATES}[standby]    ATPneumatics
    Verify Summary State    ${STATES}[standby]    ATHexapod
