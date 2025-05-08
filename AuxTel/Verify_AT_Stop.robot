*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     Collections
Force Tags    auxtel_stop

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Execute AuxTel Stop
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_stop
    Verify Scripts Completed Successfully    ${scripts}    ${states}

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

# Enable ATCS to recover from Stop
Execute AuxTel Enable ATCS
    [Tags]    execute    auxtel_enable_atcs
    ${scripts}    ${states}=    Execute Integration Test    auxtel_enable_atcs
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify AuxTel CSCs Enabled
    [Tags]    robot:continue-on-failure    auxtel_enable_atcs
    Verify Summary State    ${STATES}[enabled]    ATMCS
    Verify Summary State    ${STATES}[enabled]    ATPtg
    Verify Summary State    ${STATES}[enabled]    ATDome
    Verify Summary State    ${STATES}[enabled]    ATDomeTrajectory
    Verify Summary State    ${STATES}[enabled]    ATAOS
    Verify Summary State    ${STATES}[enabled]    ATPneumatics
    Verify Summary State    ${STATES}[enabled]    ATHexapod
