*** Settings ***
Documentation    This suite builds the various interfaces for the M1M3.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    m1m3
${timeout}    15s

*** Test Cases ***
Create SALGEN Session
    [Documentation]    Connect to the host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=SALGEN    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify M1M3 XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/m1m3_Commands.xml
    File Should Exist    ${SALWorkDir}/m1m3_Events.xml
    File Should Exist    ${SALWorkDir}/m1m3_Telemetry.xml

Salgen M1M3 Validate
    [Documentation]    Validate the M1M3 XML definitions.
    [Tags]
    Write    cd ${SALWorkDir}
    ${output}=    Read Until Prompt
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} validate
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Should Contain    ${output}    Processing ${subSystem}
    Should Contain    ${output}    Completed ${subSystem} validation
    Directory Should Exist    ${SALWorkDir}/idl-templates
    Directory Should Exist    ${SALWorkDir}/idl-templates/validated
    @{files}=    List Directory    ${SALWorkDir}/idl-templates    pattern=*${subSystem}*
    Log Many    @{files}
    Comment    Telemetry
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_ForceActuatorData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_InclinometerData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_OuterLoopData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_AccelerometerData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_HardpointActuatorData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_IMSData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_GyroData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_PowerSupplyData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_PIDData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_HardpointMonitorData.idl
    Comment    State Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_abort.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enterControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_exitControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_stop.idl
    Comment    Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_RaiseM1M3.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_AbortRaiseM1M3.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_LowerM1M3.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_EnterEngineering.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ExitEngineering.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TurnAirOn.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TurnAirOff.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TestAir.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_MoveHardpointActuators.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_StopHardpointMotion.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TestHardpoint.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_EnableHardpointChase.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_DisableHardpointChase.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TestForceActuator.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyOffsetForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Disable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Shutdown.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TranslateM1M3.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ClearOffsetForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyAberrationForcesByBendingModes.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyAberrationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ClearAberrationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyActiveOpticForcesByBendingModes.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyActiveOpticForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ClearActiveOpticForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_PositionM1M3.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TurnLightsOn.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TurnLightsOff.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TurnPowerOn.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_TurnPowerOff.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_EnableHardpointCorrections.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_DisableHardpointCorrections.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_RunMirrorForceProfile.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_AbortProfile.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyOffsetForcesByMirrorForce.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_UpdatePID.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ResetPID.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_SetThermalSetpoint.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ProgramILC.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ModbusTransmit.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ErrorCode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingVersions.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedSettingsMatchStart.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingsApplied.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DetailedState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SummaryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HardpointActuatorInfo.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ForceActuatorInfo.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ILCWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_InterlockWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AirSupplyStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AirSupplyWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_InterlockStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DisplacementSensorWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_InclinometerSensorWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AccelerometerWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ForceSetpointWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ForceActuatorState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HardpointMonitorInfo.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CellLightStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CellLightWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_PowerStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_PowerWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ForceActuatorForceWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_GyroWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_PowerSupplyStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedOffsetForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedStaticForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedActiveOpticForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedAberrationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedAzimuthForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CommandRejectionWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_PIDInfo.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HardpointActuatorWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HardpointMonitorWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HardpointActuatorState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HardpointMonitorState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ForceActuatorWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedStaticForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedElevationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedAzimuthForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedThermalForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedActiveOpticForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedAberrationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedBalanceForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedVelocityForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedAccelerationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedOffsetForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedElevationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedAccelerationForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedThermalForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedVelocityForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedBalanceForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedCylinderForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedCylinderForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ModbusResponse.idl

Salgen M1M3 HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m1m3_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m1m3_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m1m3_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    372

