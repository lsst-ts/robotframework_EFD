# -*- coding: robot -*-
*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    maintel_csc_end_of_night


*** Test Cases ***
Execute LowerM1M3
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_lower_m1m3
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify M1M3 is Parked
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    MTM1M3    logevent_detailedState    ["detailedState"]    [5]    # Parked
    Verify Topic Attribute    MTM1M3    logevent_raisingLoweringInfo    ["weightSupportedPercent"]    [0]

Verify M1M3 AppliedForces are Zero
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples   MTM1M3    appliedForces    ["fx","fy","fz","mx","my","mz","forceMagnitude"]    1    None
    Should Be Equal As Numbers    ${dataframe.fx.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.fy.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.fz.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.mx.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.my.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.mz.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.forceMagnitude.values}[0]    0

Verify M1M3 AppliedVelocityForces are Zero
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples   MTM1M3    appliedVelocityForces    ["fx","fy","fz","mx","my","mz","forceMagnitude"]    1    None
    Should Be Equal As Numbers    ${dataframe.fx.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.fy.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.fz.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.mx.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.my.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.mz.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.forceMagnitude.values}[0]    0

Execute MainTel CSC End of Night script
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_csc_end_of_night
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTCS CSCs Ending States
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[standby]     MTAOS
    Verify Summary State    ${STATES}[disabled]    MTDome
    Verify Summary State    ${STATES}[disabled]    MTDomeTrajectory
    Verify Summary State    ${STATES}[disabled]    MTHexapod:1
    Verify Summary State    ${STATES}[disabled]    MTHexapod:2
    Verify Summary State    ${STATES}[enabled]     MTM1M3
    Verify Summary State    ${STATES}[enabled]     MTM2
    Verify Summary State    ${STATES}[disabled]    MTMount
    Verify Summary State    ${STATES}[enabled]     MTPtg
    Verify Summary State    ${STATES}[disabled]    MTRotator

Verify MTCamera CSCs Ending States
    [Tags]    robot:continue-on-failure
    Verify Summary State    ${STATES}[enabled]     MTCamera
    Verify Summary State    ${STATES}[enabled]     MTOODS
    Verify Summary State    ${STATES}[enabled]     MTHeaderService
