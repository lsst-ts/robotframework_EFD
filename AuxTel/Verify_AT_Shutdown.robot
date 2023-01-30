# -*- coding: robot -*-
*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    auxtel_stop

*** Variables ***
@{atMountState}         state
@{states_expected}      8
${time_window}          10

*** Test Cases ***
Get Script Metadata
    [Tags] 
    Common_Keywords.Get Script Metadata

Verify Runtime
    [Tags]    runtime    DM-36978
    Verify Script Runtime    ${script_start}    ${script_end}

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

Verify ATDome Closed
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["False",]
    Verify Topic Attribute    ATDome    logevent_dropoutDoorState    ["state",]    ["1",]    #Closed
    Verify Topic Attribute    ATDome    logevent_mainDoorState    ["state",]    ["1",]    #Closed

Verify ATMCS logevent_atMountState
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_atMountState    ["state",]    ["8",]    #TRACKINGDISABLED

Verify ATMCS In Park Position
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ["inPosition",]    ["False",]
    Verify Topic Attribute    ATMCS    logevent_azimuthInPosition    ["inPosition",]    ["False",]
    Verify Topic Attribute    ATMCS    logevent_elevationInPosition    ["inPosition",]    ["False",]
    Verify Topic Attribute    ATMCS    logevent_target    ["azimuth",]    ["0",]
    Verify Topic Attribute    ATMCS    logevent_target    ["elevation",]    ["80",]

Verify AuxTel CSCs Standby
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[standby]    ATMCS
    Verify Summary State    ${STATES}[standby]    ATPtg
    Verify Summary State    ${STATES}[standby]    ATDome
    Verify Summary State    ${STATES}[standby]    ATDomeTrajectory
    Verify Summary State    ${STATES}[standby]    ATAOS
    Verify Summary State    ${STATES}[standby]    ATPneumatics
    Verify Summary State    ${STATES}[standby]    ATHexapod
