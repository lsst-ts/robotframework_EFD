# -*- coding: robot -*-
*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    raise_m1m3


*** Test Cases ***
Execute RaiseM1M3
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_raise_m1m3
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify M1M3 is Raised
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    MTM1M3    logevent_detailedState    ["detailedState"]    [7]    # Active
    Verify Topic Attribute    MTM1M3    logevent_raisingLoweringInfo    ["weightSupportedPercent"]    [100]

Verify M1M3 AppliedForces are Non-Zero
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples   MTM1M3    appliedForces    ["fx","fy","fz","mx","my","mz","forceMagnitude"]    1    None
    Log    M1M3 is raised, so appliedForces are non-zero.
    Should Be True    abs(${dataframe.fx.values}[0]) > 0
    Should Be True    abs(${dataframe.fy.values}[0]) > 0
    Should Be True    abs(${dataframe.fz.values}[0]) > 0
    Should Be True    abs(${dataframe.mx.values}[0]) > 0
    Should Be True    abs(${dataframe.my.values}[0]) > 0
    Should Be True    abs(${dataframe.mz.values}[0]) > 0
    Should Be True    abs(${dataframe.forceMagnitude.values}[0]) > 0

Verify M1M3 AppliedVelocityForces are Zero
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples   MTM1M3    appliedVelocityForces    ["fx","fy","fz","mx","my","mz","forceMagnitude"]    1    None
    Log    M1M3 is raised but not moving, so appliedVelocityForces are still zero.
    Should Be Equal As Numbers    ${dataframe.fx.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.fy.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.fz.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.mx.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.my.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.mz.values}[0]    0
    Should Be Equal As Numbers    ${dataframe.forceMagnitude.values}[0]    0

Execute M1M3 Disable Slew Controller Flags
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_m1m3_enable_slew_flags
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify M1M3 Slew Controller Flags are Disabled
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples   MTM1M3    logevent_slewControllerSettings    ["triggerBoosterValves","useAccelerationForces","useBalanceForces","useVelocityForces",]    1    None
    Should Not Be True    ${dataframe.triggerBoosterValves.values}[0]
    Should Not Be True    ${dataframe.useAccelerationForces.values}[0]
    Should Not Be True    ${dataframe.useBalanceForces.values}[0]
    Should Not Be True    ${dataframe.useVelocityForces.values}[0]
