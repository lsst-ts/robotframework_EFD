*** Settings ***
Documentation    This suite verifies SQL table creation for the AtMonochromator.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    AtMonochromator
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

Verify AtMonochromator Telemetry Timestamp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Timestamp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_Timestamp.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_Timestamp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_Timestamp_items.sql

Verify AtMonochromator Telemetry LoopTime_ms SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LoopTime_ms*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_LoopTime_ms.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_LoopTime_ms.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_LoopTime_ms_items.sql

Verify AtMonochromator State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enable_items.sql

Verify AtMonochromator State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_disable_items.sql

Verify AtMonochromator State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_abort_items.sql

Verify AtMonochromator State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enterControl_items.sql

Verify AtMonochromator State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_exitControl_items.sql

Verify AtMonochromator State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_standby_items.sql

Verify AtMonochromator State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_start_items.sql

Verify AtMonochromator State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_stop_items.sql

Verify AtMonochromator Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_disable_items.sql

Verify AtMonochromator Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enable_items.sql

Verify AtMonochromator Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_exitControl_items.sql

Verify AtMonochromator Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_standby_items.sql

Verify AtMonochromator Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_start_items.sql

Verify AtMonochromator Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_enterControl_items.sql

Verify AtMonochromator Command ChangeWavelength SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*ChangeWavelength*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeWavelength.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeWavelength.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeWavelength_items.sql

Verify AtMonochromator Command CalibrateWavelength SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*CalibrateWavelength*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_CalibrateWavelength.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_CalibrateWavelength.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_CalibrateWavelength_items.sql

Verify AtMonochromator Command Power SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*Power*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_Power.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_Power.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_Power_items.sql

Verify AtMonochromator Command SelectGrating SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SelectGrating*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_SelectGrating.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_SelectGrating.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_SelectGrating_items.sql

Verify AtMonochromator Command PowerWhiteLight SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*PowerWhiteLight*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_PowerWhiteLight.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_PowerWhiteLight.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_PowerWhiteLight_items.sql

Verify AtMonochromator Command SetCoolingTemperature SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SetCoolingTemperature*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_SetCoolingTemperature.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_SetCoolingTemperature.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_SetCoolingTemperature_items.sql

Verify AtMonochromator Command ChangeLightIntensity SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*ChangeLightIntensity*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeLightIntensity.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeLightIntensity.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeLightIntensity_items.sql

Verify AtMonochromator Command ChangeSlitWidth SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*ChangeSlitWidth*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeSlitWidth.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeSlitWidth.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_ChangeSlitWidth_items.sql

Verify AtMonochromator Command updateMonochromatorSetup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*updateMonochromatorSetup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_updateMonochromatorSetup.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_updateMonochromatorSetup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_command_updateMonochromatorSetup_items.sql

Verify AtMonochromator Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_AppliedSettingsMatchStart_items.sql

Verify AtMonochromator Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_ErrorCode_items.sql

Verify AtMonochromator Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingVersions_items.sql

Verify AtMonochromator Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SummaryState_items.sql

Verify AtMonochromator Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_DetailedState_items.sql

Verify AtMonochromator Event InternalCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*InternalCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_InternalCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_InternalCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_InternalCommand_items.sql

Verify AtMonochromator Event Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_Heartbeat_items.sql

Verify AtMonochromator Event LoopTimeOutOfRange SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*LoopTimeOutOfRange*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LoopTimeOutOfRange.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LoopTimeOutOfRange.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LoopTimeOutOfRange_items.sql

Verify AtMonochromator Event RejectedCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*RejectedCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_RejectedCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_RejectedCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_RejectedCommand_items.sql

Verify AtMonochromator Event CoolingMonitoring SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*CoolingMonitoring*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_CoolingMonitoring.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_CoolingMonitoring.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_CoolingMonitoring_items.sql

Verify AtMonochromator Event SettingsAppliedMonoCommunication SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SettingsAppliedMonoCommunication*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonoCommunication.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonoCommunication.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonoCommunication_items.sql

Verify AtMonochromator Event LightStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*LightStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LightStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LightStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LightStatus_items.sql

Verify AtMonochromator Event SelectedGrating SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SelectedGrating*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SelectedGrating.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SelectedGrating.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SelectedGrating_items.sql

Verify AtMonochromator Event Wavelength SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*Wavelength*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_Wavelength.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_Wavelength.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_Wavelength_items.sql

Verify AtMonochromator Event LightIntensity SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*LightIntensity*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LightIntensity.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LightIntensity.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_LightIntensity_items.sql

Verify AtMonochromator Event SlitWidth SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SlitWidth*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SlitWidth.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SlitWidth.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SlitWidth_items.sql

Verify AtMonochromator Event inPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*inPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_inPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_inPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_inPosition_items.sql

Verify AtMonochromator Event MonochromatorConnected SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*MonochromatorConnected*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_MonochromatorConnected.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_MonochromatorConnected.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_MonochromatorConnected_items.sql

Verify AtMonochromator Event SettingsAppliedMonoHeartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SettingsAppliedMonoHeartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonoHeartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonoHeartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonoHeartbeat_items.sql

Verify AtMonochromator Event SettingsAppliedLoop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SettingsAppliedLoop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedLoop.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedLoop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedLoop_items.sql

Verify AtMonochromator Event SettingsAppliedMonochromatorRanges SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atMonochromator_*SettingsAppliedMonochromatorRanges*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonochromatorRanges.sqldef
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonochromatorRanges.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atMonochromator_logevent_SettingsAppliedMonochromatorRanges_items.sql

