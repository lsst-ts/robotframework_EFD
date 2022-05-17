*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    Common_Keywords.resource
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Force Tags    auxtel_stop

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}    state

*** Test Cases ***
Verify ATDome logevent_azimuthInPosition
    [Tags]    disabled
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ${azimuthInPosition}    False

Verify ATDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDomeTrajectory

Verify ATMCS logevent_atMountState
    [Tags]    disabled
    Verify Topic Attribute    ATMCS    logevent_atMountState    ${atMountState}    8

Verify ATMCS logevent_allAxesInPosition
    [Tags]    disabled
    Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ${allAxesInPosition}    False

Verify ATPtg Fault
    [Tags]    disabled
    Verify Summary State    ${STATES}[fault]    ATPtg
