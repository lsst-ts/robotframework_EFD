*** Settings ***
Documentation    This suite verify SQL table creation for the M2MS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    M2MS
${timeout}    30s

*** Test Cases ***
Create EFD_Tables Session
    [Documentation]    Connect to the host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=EFD_Tables    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify M2MS Telemetry MirrorPositionMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_MirrorPositionMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MirrorPositionMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry MirrorPositionMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_MirrorPositionMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MirrorPositionMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry AxialForcesMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_AxialForcesMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AxialForcesMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry AxialForcesMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_AxialForcesMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AxialForcesMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry TangentForcesMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_TangentForcesMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TangentForcesMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry TangentForcesMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_TangentForcesMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TangentForcesMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry ZenithAngleMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_ZenithAngleMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the ZenithAngleMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry ZenithAngleMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_ZenithAngleMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table ZenithAngleMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry AxialActuatorAbsolutePositionSteps EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_AxialActuatorAbsolutePositionSteps.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AxialActuatorAbsolutePositionSteps table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry AxialActuatorAbsolutePositionSteps EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_AxialActuatorAbsolutePositionSteps"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AxialActuatorAbsolutePositionSteps does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry TangentActuatorAbsolutePositionSteps EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_TangentActuatorAbsolutePositionSteps.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TangentActuatorAbsolutePositionSteps table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry TangentActuatorAbsolutePositionSteps EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_TangentActuatorAbsolutePositionSteps"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TangentActuatorAbsolutePositionSteps does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry AxialActuatorPositionAbsoluteEncoderPositionMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_AxialActuatorPositionAbsoluteEncoderPositionMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AxialActuatorPositionAbsoluteEncoderPositionMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry AxialActuatorPositionAbsoluteEncoderPositionMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_AxialActuatorPositionAbsoluteEncoderPositionMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AxialActuatorPositionAbsoluteEncoderPositionMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry TangentActuatorPositionAbsoluteEncoderPositionMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_TangentActuatorPositionAbsoluteEncoderPositionMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TangentActuatorPositionAbsoluteEncoderPositionMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry TangentActuatorPositionAbsoluteEncoderPositionMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_TangentActuatorPositionAbsoluteEncoderPositionMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TangentActuatorPositionAbsoluteEncoderPositionMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry PowerStatus EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_PowerStatus.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the PowerStatus table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry PowerStatus EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_PowerStatus"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table PowerStatus does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry TemperaturesMeasured EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_TemperaturesMeasured.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TemperaturesMeasured table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry TemperaturesMeasured EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_TemperaturesMeasured"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TemperaturesMeasured does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry RawDisplacement EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_RawDisplacement.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the RawDisplacement table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry RawDisplacement EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_RawDisplacement"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table RawDisplacement does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry StepVectorUpdate EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_StepVectorUpdate.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the StepVectorUpdate table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry StepVectorUpdate EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_StepVectorUpdate"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table StepVectorUpdate does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry TargetForces EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_TargetForces.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TargetForces table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry TargetForces EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_TargetForces"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TargetForces does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry SystemStatus EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_SystemStatus.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SystemStatus table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry SystemStatus EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_SystemStatus"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SystemStatus does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry RawTelemetry EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_RawTelemetry.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the RawTelemetry table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry RawTelemetry EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_RawTelemetry"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table RawTelemetry does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Telemetry ActuatorLimitSwitches EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_ActuatorLimitSwitches.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the ActuatorLimitSwitches table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Telemetry ActuatorLimitSwitches EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_ActuatorLimitSwitches"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table ActuatorLimitSwitches does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command enable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command enable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command disable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command disable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command abort EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command abort EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command enterControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command enterControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command exitControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command exitControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command standby EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command standby EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command start EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command start EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify M2MS State Command stop EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS State Command stop EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Command ApplyBendingMode EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_ApplyBendingMode.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the ApplyBendingMode table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Command ApplyBendingMode EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_ApplyBendingMode"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table ApplyBendingMode does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Command ApplyForce EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_ApplyForce.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the ApplyForce table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Command ApplyForce EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_ApplyForce"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table ApplyForce does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Command SetCorrectionMode EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_SetCorrectionMode.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SetCorrectionMode table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Command SetCorrectionMode EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_SetCorrectionMode"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SetCorrectionMode does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Command PositionMirror EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_PositionMirror.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the PositionMirror table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Command PositionMirror EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_PositionMirror"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table PositionMirror does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Command MoveAxialActuator EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_command_MoveAxialActuator.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MoveAxialActuator table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Command MoveAxialActuator EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_command_MoveAxialActuator"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MoveAxialActuator does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Event M2SummaryState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_logevent_M2SummaryState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the M2SummaryState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Event M2SummaryState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_logevent_M2SummaryState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table M2SummaryState does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Event M2DetailedState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_logevent_M2DetailedState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the M2DetailedState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Event M2DetailedState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_logevent_M2DetailedState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table M2DetailedState does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Event M2FaultState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_logevent_M2FaultState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the M2FaultState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Event M2FaultState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_logevent_M2FaultState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table M2FaultState does not exist
    Should Contain    ${output}    Empty set

Verify M2MS Event M2AssemblyInPosition EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/m2ms_logevent_M2AssemblyInPosition.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the M2AssemblyInPosition table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify M2MS Event M2AssemblyInPosition EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from m2ms_logevent_M2AssemblyInPosition"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table M2AssemblyInPosition does not exist
    Should Contain    ${output}    Empty set

