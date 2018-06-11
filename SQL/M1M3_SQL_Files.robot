*** Settings ***
Documentation    This suite verifies SQL table creation for the M1M3.
Force Tags    TSS-2617
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    M1M3
${timeout}    30s

*** Test Cases ***
Create SQL Session
    [Documentation]    Connect to the host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=SQL    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify M1M3 Telemetry ForceActuatorData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*ForceActuatorData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_ForceActuatorData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_ForceActuatorData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_ForceActuatorData_items.sql

Verify M1M3 Telemetry InclinometerData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*InclinometerData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_InclinometerData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_InclinometerData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_InclinometerData_items.sql

Verify M1M3 Telemetry OuterLoopData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*OuterLoopData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_OuterLoopData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_OuterLoopData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_OuterLoopData_items.sql

Verify M1M3 Telemetry AccelerometerData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*AccelerometerData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_AccelerometerData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_AccelerometerData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_AccelerometerData_items.sql

Verify M1M3 Telemetry HardpointActuatorData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*HardpointActuatorData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_HardpointActuatorData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_HardpointActuatorData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_HardpointActuatorData_items.sql

Verify M1M3 Telemetry IMSData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*IMSData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_IMSData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_IMSData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_IMSData_items.sql

Verify M1M3 Telemetry GyroData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*GyroData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_GyroData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_GyroData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_GyroData_items.sql

Verify M1M3 Telemetry PowerSupplyData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*PowerSupplyData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_PowerSupplyData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_PowerSupplyData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_PowerSupplyData_items.sql

Verify M1M3 Telemetry PIDData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*PIDData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_PIDData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_PIDData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_PIDData_items.sql

Verify M1M3 Telemetry HardpointMonitorData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*HardpointMonitorData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_HardpointMonitorData.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_HardpointMonitorData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_HardpointMonitorData_items.sql

Verify M1M3 State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enable_items.sql

Verify M1M3 State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_disable_items.sql

Verify M1M3 State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_abort_items.sql

Verify M1M3 State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enterControl_items.sql

Verify M1M3 State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_exitControl_items.sql

Verify M1M3 State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_standby_items.sql

Verify M1M3 State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_start_items.sql

Verify M1M3 State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_stop_items.sql

Verify M1M3 Command Start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*Start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Start.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Start_items.sql

Verify M1M3 Command Enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*Enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Enable_items.sql

Verify M1M3 Command RaiseM1M3 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RaiseM1M3*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_RaiseM1M3.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_RaiseM1M3.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_RaiseM1M3_items.sql

Verify M1M3 Command AbortRaiseM1M3 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AbortRaiseM1M3*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_AbortRaiseM1M3.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_AbortRaiseM1M3.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_AbortRaiseM1M3_items.sql

Verify M1M3 Command LowerM1M3 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*LowerM1M3*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_LowerM1M3.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_LowerM1M3.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_LowerM1M3_items.sql

Verify M1M3 Command EnterEngineering SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*EnterEngineering*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnterEngineering.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnterEngineering.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnterEngineering_items.sql

Verify M1M3 Command ExitEngineering SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ExitEngineering*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ExitEngineering.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ExitEngineering.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ExitEngineering_items.sql

Verify M1M3 Command TurnAirOn SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TurnAirOn*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnAirOn.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnAirOn.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnAirOn_items.sql

Verify M1M3 Command TurnAirOff SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TurnAirOff*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnAirOff.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnAirOff.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnAirOff_items.sql

Verify M1M3 Command TestAir SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TestAir*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestAir.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestAir.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestAir_items.sql

Verify M1M3 Command MoveHardpointActuators SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*MoveHardpointActuators*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_MoveHardpointActuators.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_MoveHardpointActuators.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_MoveHardpointActuators_items.sql

Verify M1M3 Command StopHardpointMotion SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*StopHardpointMotion*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_StopHardpointMotion.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_StopHardpointMotion.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_StopHardpointMotion_items.sql

Verify M1M3 Command TestHardpoint SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TestHardpoint*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestHardpoint.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestHardpoint.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestHardpoint_items.sql

Verify M1M3 Command EnableHardpointChase SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*EnableHardpointChase*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnableHardpointChase.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnableHardpointChase.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnableHardpointChase_items.sql

Verify M1M3 Command DisableHardpointChase SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*DisableHardpointChase*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_DisableHardpointChase.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_DisableHardpointChase.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_DisableHardpointChase_items.sql

Verify M1M3 Command TestForceActuator SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TestForceActuator*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestForceActuator.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestForceActuator.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TestForceActuator_items.sql

Verify M1M3 Command ApplyOffsetForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ApplyOffsetForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyOffsetForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyOffsetForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyOffsetForces_items.sql

Verify M1M3 Command Disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*Disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Disable_items.sql

Verify M1M3 Command Standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*Standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Standby_items.sql

Verify M1M3 Command Shutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*Shutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Shutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Shutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_Shutdown_items.sql

Verify M1M3 Command TranslateM1M3 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TranslateM1M3*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TranslateM1M3.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TranslateM1M3.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TranslateM1M3_items.sql

Verify M1M3 Command ClearOffsetForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ClearOffsetForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearOffsetForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearOffsetForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearOffsetForces_items.sql

Verify M1M3 Command ApplyAberrationForcesByBendingModes SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ApplyAberrationForcesByBendingModes*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyAberrationForcesByBendingModes.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyAberrationForcesByBendingModes.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyAberrationForcesByBendingModes_items.sql

Verify M1M3 Command ApplyAberrationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ApplyAberrationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyAberrationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyAberrationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyAberrationForces_items.sql

Verify M1M3 Command ClearAberrationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ClearAberrationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearAberrationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearAberrationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearAberrationForces_items.sql

Verify M1M3 Command ApplyActiveOpticForcesByBendingModes SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ApplyActiveOpticForcesByBendingModes*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyActiveOpticForcesByBendingModes.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyActiveOpticForcesByBendingModes.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyActiveOpticForcesByBendingModes_items.sql

Verify M1M3 Command ApplyActiveOpticForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ApplyActiveOpticForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyActiveOpticForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyActiveOpticForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyActiveOpticForces_items.sql

Verify M1M3 Command ClearActiveOpticForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ClearActiveOpticForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearActiveOpticForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearActiveOpticForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ClearActiveOpticForces_items.sql

Verify M1M3 Command PositionM1M3 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*PositionM1M3*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_PositionM1M3.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_PositionM1M3.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_PositionM1M3_items.sql

Verify M1M3 Command TurnLightsOn SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TurnLightsOn*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnLightsOn.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnLightsOn.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnLightsOn_items.sql

Verify M1M3 Command TurnLightsOff SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TurnLightsOff*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnLightsOff.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnLightsOff.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnLightsOff_items.sql

Verify M1M3 Command TurnPowerOn SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TurnPowerOn*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnPowerOn.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnPowerOn.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnPowerOn_items.sql

Verify M1M3 Command TurnPowerOff SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*TurnPowerOff*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnPowerOff.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnPowerOff.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_TurnPowerOff_items.sql

Verify M1M3 Command EnableHardpointCorrections SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*EnableHardpointCorrections*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnableHardpointCorrections.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnableHardpointCorrections.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_EnableHardpointCorrections_items.sql

Verify M1M3 Command DisableHardpointCorrections SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*DisableHardpointCorrections*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_DisableHardpointCorrections.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_DisableHardpointCorrections.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_DisableHardpointCorrections_items.sql

Verify M1M3 Command RunMirrorForceProfile SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RunMirrorForceProfile*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_RunMirrorForceProfile.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_RunMirrorForceProfile.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_RunMirrorForceProfile_items.sql

Verify M1M3 Command AbortProfile SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AbortProfile*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_AbortProfile.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_AbortProfile.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_AbortProfile_items.sql

Verify M1M3 Command ApplyOffsetForcesByMirrorForce SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ApplyOffsetForcesByMirrorForce*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyOffsetForcesByMirrorForce.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyOffsetForcesByMirrorForce.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ApplyOffsetForcesByMirrorForce_items.sql

Verify M1M3 Command UpdatePID SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*UpdatePID*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_UpdatePID.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_UpdatePID.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_UpdatePID_items.sql

Verify M1M3 Command ResetPID SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ResetPID*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ResetPID.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ResetPID.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ResetPID_items.sql

Verify M1M3 Command SetThermalSetpoint SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*SetThermalSetpoint*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_SetThermalSetpoint.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_SetThermalSetpoint.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_SetThermalSetpoint_items.sql

Verify M1M3 Command ProgramILC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ProgramILC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ProgramILC.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ProgramILC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ProgramILC_items.sql

Verify M1M3 Command ModbusTransmit SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ModbusTransmit*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ModbusTransmit.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ModbusTransmit.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_ModbusTransmit_items.sql

Verify M1M3 Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ErrorCode_items.sql

Verify M1M3 Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SettingVersions_items.sql

Verify M1M3 Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedSettingsMatchStart_items.sql

Verify M1M3 Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SettingsApplied_items.sql

Verify M1M3 Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_DetailedState_items.sql

Verify M1M3 Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_SummaryState_items.sql

Verify M1M3 Event HardpointActuatorInfo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*HardpointActuatorInfo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorInfo.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorInfo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorInfo_items.sql

Verify M1M3 Event ForceActuatorInfo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ForceActuatorInfo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorInfo.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorInfo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorInfo_items.sql

Verify M1M3 Event ILCWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ILCWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ILCWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ILCWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ILCWarning_items.sql

Verify M1M3 Event InterlockWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*InterlockWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InterlockWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InterlockWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InterlockWarning_items.sql

Verify M1M3 Event AirSupplyStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AirSupplyStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AirSupplyStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AirSupplyStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AirSupplyStatus_items.sql

Verify M1M3 Event AirSupplyWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AirSupplyWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AirSupplyWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AirSupplyWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AirSupplyWarning_items.sql

Verify M1M3 Event InterlockStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*InterlockStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InterlockStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InterlockStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InterlockStatus_items.sql

Verify M1M3 Event DisplacementSensorWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*DisplacementSensorWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_DisplacementSensorWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_DisplacementSensorWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_DisplacementSensorWarning_items.sql

Verify M1M3 Event InclinometerSensorWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*InclinometerSensorWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InclinometerSensorWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InclinometerSensorWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_InclinometerSensorWarning_items.sql

Verify M1M3 Event AccelerometerWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AccelerometerWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AccelerometerWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AccelerometerWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AccelerometerWarning_items.sql

Verify M1M3 Event ForceSetpointWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ForceSetpointWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceSetpointWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceSetpointWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceSetpointWarning_items.sql

Verify M1M3 Event ForceActuatorState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ForceActuatorState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorState_items.sql

Verify M1M3 Event HardpointMonitorInfo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*HardpointMonitorInfo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorInfo.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorInfo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorInfo_items.sql

Verify M1M3 Event CellLightStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*CellLightStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CellLightStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CellLightStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CellLightStatus_items.sql

Verify M1M3 Event CellLightWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*CellLightWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CellLightWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CellLightWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CellLightWarning_items.sql

Verify M1M3 Event PowerStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*PowerStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerStatus_items.sql

Verify M1M3 Event PowerWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*PowerWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerWarning_items.sql

Verify M1M3 Event ForceActuatorForceWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ForceActuatorForceWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorForceWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorForceWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorForceWarning_items.sql

Verify M1M3 Event GyroWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*GyroWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_GyroWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_GyroWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_GyroWarning_items.sql

Verify M1M3 Event PowerSupplyStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*PowerSupplyStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerSupplyStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerSupplyStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PowerSupplyStatus_items.sql

Verify M1M3 Event AppliedOffsetForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedOffsetForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedOffsetForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedOffsetForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedOffsetForces_items.sql

Verify M1M3 Event AppliedStaticForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedStaticForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedStaticForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedStaticForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedStaticForces_items.sql

Verify M1M3 Event AppliedActiveOpticForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedActiveOpticForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedActiveOpticForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedActiveOpticForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedActiveOpticForces_items.sql

Verify M1M3 Event AppliedAberrationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedAberrationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAberrationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAberrationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAberrationForces_items.sql

Verify M1M3 Event AppliedAzimuthForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedAzimuthForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAzimuthForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAzimuthForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAzimuthForces_items.sql

Verify M1M3 Event CommandRejectionWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*CommandRejectionWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CommandRejectionWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CommandRejectionWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_CommandRejectionWarning_items.sql

Verify M1M3 Event PIDInfo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*PIDInfo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PIDInfo.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PIDInfo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_PIDInfo_items.sql

Verify M1M3 Event HardpointActuatorWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*HardpointActuatorWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorWarning_items.sql

Verify M1M3 Event HardpointMonitorWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*HardpointMonitorWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorWarning_items.sql

Verify M1M3 Event HardpointActuatorState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*HardpointActuatorState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointActuatorState_items.sql

Verify M1M3 Event HardpointMonitorState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*HardpointMonitorState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_HardpointMonitorState_items.sql

Verify M1M3 Event ForceActuatorWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ForceActuatorWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ForceActuatorWarning_items.sql

Verify M1M3 Event RejectedStaticForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedStaticForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedStaticForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedStaticForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedStaticForces_items.sql

Verify M1M3 Event RejectedElevationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedElevationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedElevationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedElevationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedElevationForces_items.sql

Verify M1M3 Event RejectedAzimuthForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedAzimuthForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAzimuthForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAzimuthForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAzimuthForces_items.sql

Verify M1M3 Event RejectedThermalForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedThermalForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedThermalForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedThermalForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedThermalForces_items.sql

Verify M1M3 Event RejectedActiveOpticForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedActiveOpticForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedActiveOpticForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedActiveOpticForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedActiveOpticForces_items.sql

Verify M1M3 Event RejectedAberrationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedAberrationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAberrationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAberrationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAberrationForces_items.sql

Verify M1M3 Event RejectedBalanceForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedBalanceForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedBalanceForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedBalanceForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedBalanceForces_items.sql

Verify M1M3 Event RejectedVelocityForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedVelocityForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedVelocityForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedVelocityForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedVelocityForces_items.sql

Verify M1M3 Event RejectedAccelerationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedAccelerationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAccelerationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAccelerationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedAccelerationForces_items.sql

Verify M1M3 Event RejectedOffsetForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedOffsetForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedOffsetForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedOffsetForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedOffsetForces_items.sql

Verify M1M3 Event RejectedForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedForces_items.sql

Verify M1M3 Event AppliedElevationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedElevationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedElevationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedElevationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedElevationForces_items.sql

Verify M1M3 Event AppliedAccelerationForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedAccelerationForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAccelerationForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAccelerationForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedAccelerationForces_items.sql

Verify M1M3 Event AppliedThermalForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedThermalForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedThermalForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedThermalForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedThermalForces_items.sql

Verify M1M3 Event AppliedVelocityForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedVelocityForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedVelocityForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedVelocityForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedVelocityForces_items.sql

Verify M1M3 Event AppliedBalanceForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedBalanceForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedBalanceForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedBalanceForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedBalanceForces_items.sql

Verify M1M3 Event AppliedForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedForces_items.sql

Verify M1M3 Event RejectedCylinderForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*RejectedCylinderForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedCylinderForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedCylinderForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_RejectedCylinderForces_items.sql

Verify M1M3 Event AppliedCylinderForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*AppliedCylinderForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedCylinderForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedCylinderForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_AppliedCylinderForces_items.sql

Verify M1M3 Event ModbusResponse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*ModbusResponse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ModbusResponse.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ModbusResponse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_ModbusResponse_items.sql

