*** Settings ***
Documentation    This suite verifies SQL table creation for the M2MS.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    M2MS
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

Verify M2MS Telemetry MirrorPositionMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*MirrorPositionMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_MirrorPositionMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_MirrorPositionMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_MirrorPositionMeasured_items.sql

Verify M2MS Telemetry AxialForcesMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*AxialForcesMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialForcesMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialForcesMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialForcesMeasured_items.sql

Verify M2MS Telemetry TangentForcesMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TangentForcesMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentForcesMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentForcesMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentForcesMeasured_items.sql

Verify M2MS Telemetry ZenithAngleMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*ZenithAngleMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_ZenithAngleMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_ZenithAngleMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_ZenithAngleMeasured_items.sql

Verify M2MS Telemetry AxialActuatorAbsolutePositionSteps SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*AxialActuatorAbsolutePositionSteps*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialActuatorAbsolutePositionSteps.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialActuatorAbsolutePositionSteps.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialActuatorAbsolutePositionSteps_items.sql

Verify M2MS Telemetry TangentActuatorAbsolutePositionSteps SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TangentActuatorAbsolutePositionSteps*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentActuatorAbsolutePositionSteps.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentActuatorAbsolutePositionSteps.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentActuatorAbsolutePositionSteps_items.sql

Verify M2MS Telemetry AxialActuatorPositionAbsoluteEncoderPositionMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*AxialActuatorPositionAbsoluteEncoderPositionMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialActuatorPositionAbsoluteEncoderPositionMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialActuatorPositionAbsoluteEncoderPositionMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_AxialActuatorPositionAbsoluteEncoderPositionMeasured_items.sql

Verify M2MS Telemetry TangentActuatorPositionAbsoluteEncoderPositionMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TangentActuatorPositionAbsoluteEncoderPositionMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentActuatorPositionAbsoluteEncoderPositionMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentActuatorPositionAbsoluteEncoderPositionMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_TangentActuatorPositionAbsoluteEncoderPositionMeasured_items.sql

Verify M2MS Telemetry PowerStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*PowerStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_PowerStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_PowerStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_PowerStatus_items.sql

Verify M2MS Telemetry TemperaturesMeasured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TemperaturesMeasured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_TemperaturesMeasured.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_TemperaturesMeasured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_TemperaturesMeasured_items.sql

Verify M2MS Telemetry RawDisplacement SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*RawDisplacement*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_RawDisplacement.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_RawDisplacement.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_RawDisplacement_items.sql

Verify M2MS Telemetry StepVectorUpdate SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*StepVectorUpdate*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_StepVectorUpdate.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_StepVectorUpdate.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_StepVectorUpdate_items.sql

Verify M2MS Telemetry TargetForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TargetForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_TargetForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_TargetForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_TargetForces_items.sql

Verify M2MS Telemetry SystemStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SystemStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_SystemStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_SystemStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_SystemStatus_items.sql

Verify M2MS Telemetry RawTelemetry SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*RawTelemetry*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_RawTelemetry.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_RawTelemetry.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_RawTelemetry_items.sql

Verify M2MS Telemetry ActuatorLimitSwitches SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*ActuatorLimitSwitches*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_ActuatorLimitSwitches.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_ActuatorLimitSwitches.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_ActuatorLimitSwitches_items.sql

Verify M2MS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_enable_items.sql

Verify M2MS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_disable_items.sql

Verify M2MS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_abort_items.sql

Verify M2MS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_enterControl_items.sql

Verify M2MS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_exitControl_items.sql

Verify M2MS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_standby_items.sql

Verify M2MS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_start_items.sql

Verify M2MS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_stop_items.sql

Verify M2MS Command ApplyBendingMode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*ApplyBendingMode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_ApplyBendingMode.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_ApplyBendingMode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_ApplyBendingMode_items.sql

Verify M2MS Command ApplyForce SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*ApplyForce*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_ApplyForce.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_ApplyForce.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_ApplyForce_items.sql

Verify M2MS Command SetCorrectionMode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*SetCorrectionMode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_SetCorrectionMode.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_SetCorrectionMode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_SetCorrectionMode_items.sql

Verify M2MS Command PositionMirror SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*PositionMirror*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_PositionMirror.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_PositionMirror.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_PositionMirror_items.sql

Verify M2MS Command MoveAxialActuator SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*MoveAxialActuator*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_MoveAxialActuator.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_MoveAxialActuator.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_command_MoveAxialActuator_items.sql

Verify M2MS Event M2SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*M2SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2SummaryState_items.sql

Verify M2MS Event M2DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*M2DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2DetailedState_items.sql

Verify M2MS Event M2FaultState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*M2FaultState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2FaultState.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2FaultState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2FaultState_items.sql

Verify M2MS Event M2AssemblyInPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m2ms_*M2AssemblyInPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2AssemblyInPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2AssemblyInPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m2ms_logevent_M2AssemblyInPosition_items.sql

