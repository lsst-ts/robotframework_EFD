*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    auxtel_stop

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Get Script Metadata
    [Tags] 
    Common_Keywords.Get Script Metadata

Verify Runtime
    [Tags]    runtime    DM-36475
    Verify Script Runtime    ${script_start}    ${script_end}

Verify ATDome logevent_azimuthInPosition
    [Tags]
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ${azimuthInPosition}    ${in_pos_expected}

Verify ATDomeTrajectory Disabled
    [Tags]
    Verify Summary State    ${STATES}[disabled]    ATDomeTrajectory

Verify ATMCS logevent_atMountState
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_atMountState    ${atMountState}    ${states_expected}

Verify ATMCS logevent_allAxesInPosition
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ${allAxesInPosition}    ${in_pos_expected}

Verify ATPtg Fault
    [Tags]
    Verify Summary State    ${STATES}[fault]    ATPtg
