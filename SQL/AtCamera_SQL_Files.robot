*** Settings ***
Documentation    This suite verifies SQL table creation for the AtCamera.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    AtCamera
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

Verify AtCamera Telemetry Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_Heartbeat_items.sql

Verify AtCamera Telemetry WREB SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*WREB*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_WREB.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_WREB.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_WREB_items.sql

Verify AtCamera State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enable_items.sql

Verify AtCamera State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disable_items.sql

Verify AtCamera State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_abort_items.sql

Verify AtCamera State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enterControl_items.sql

Verify AtCamera State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_exitControl_items.sql

Verify AtCamera State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_standby_items.sql

Verify AtCamera State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_start_items.sql

Verify AtCamera State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_stop_items.sql

Verify AtCamera Command discardRows SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*discardRows*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_discardRows.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_discardRows.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_discardRows_items.sql

Verify AtCamera Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enable_items.sql

Verify AtCamera Command setValue SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*setValue*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_setValue.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_setValue.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_setValue_items.sql

Verify AtCamera Command startImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*startImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_startImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_startImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_startImage_items.sql

Verify AtCamera Command disableCalibration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*disableCalibration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disableCalibration.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disableCalibration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disableCalibration_items.sql

Verify AtCamera Command initGuiders SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*initGuiders*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_initGuiders.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_initGuiders.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_initGuiders_items.sql

Verify AtCamera Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_standby_items.sql

Verify AtCamera Command enableCalibration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*enableCalibration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enableCalibration.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enableCalibration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enableCalibration_items.sql

Verify AtCamera Command initImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*initImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_initImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_initImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_initImage_items.sql

Verify AtCamera Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_enterControl_items.sql

Verify AtCamera Command endImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*endImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_endImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_endImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_endImage_items.sql

Verify AtCamera Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_disable_items.sql

Verify AtCamera Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_abort_items.sql

Verify AtCamera Command clear SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*clear*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_clear.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_clear.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_clear_items.sql

Verify AtCamera Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_exitControl_items.sql

Verify AtCamera Command takeImages SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*takeImages*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_takeImages.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_takeImages.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_takeImages_items.sql

Verify AtCamera Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_start_items.sql

Verify AtCamera Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_command_stop_items.sql

Verify AtCamera Event offlineDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*offlineDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_offlineDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_offlineDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_offlineDetailedState_items.sql

Verify AtCamera Event endReadout SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*endReadout*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endReadout.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endReadout.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endReadout_items.sql

Verify AtCamera Event endTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*endTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endTakeImage_items.sql

Verify AtCamera Event imageReadinessDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*imageReadinessDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_imageReadinessDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_imageReadinessDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_imageReadinessDetailedState_items.sql

Verify AtCamera Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SettingVersions_items.sql

Verify AtCamera Event notReadyToTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*notReadyToTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_notReadyToTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_notReadyToTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_notReadyToTakeImage_items.sql

Verify AtCamera Event startShutterClose SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*startShutterClose*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startShutterClose.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startShutterClose.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startShutterClose_items.sql

Verify AtCamera Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_AppliedSettingsMatchStart_items.sql

Verify AtCamera Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_ErrorCode_items.sql

Verify AtCamera Event endShutterClose SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*endShutterClose*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endShutterClose.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endShutterClose.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endShutterClose_items.sql

Verify AtCamera Event endOfImageTelemetry SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*endOfImageTelemetry*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endOfImageTelemetry.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endOfImageTelemetry.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endOfImageTelemetry_items.sql

Verify AtCamera Event calibrationDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*calibrationDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_calibrationDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_calibrationDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_calibrationDetailedState_items.sql

Verify AtCamera Event shutterDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*shutterDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_shutterDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_shutterDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_shutterDetailedState_items.sql

Verify AtCamera Event readyToTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*readyToTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_readyToTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_readyToTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_readyToTakeImage_items.sql

Verify AtCamera Event ccsCommandState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*ccsCommandState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_ccsCommandState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_ccsCommandState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_ccsCommandState_items.sql

Verify AtCamera Event prepareToTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*prepareToTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_prepareToTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_prepareToTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_prepareToTakeImage_items.sql

Verify AtCamera Event endShutterOpen SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*endShutterOpen*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endShutterOpen.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endShutterOpen.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_endShutterOpen_items.sql

Verify AtCamera Event startIntegration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*startIntegration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startIntegration.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startIntegration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startIntegration_items.sql

Verify AtCamera Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SummaryState_items.sql

Verify AtCamera Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_SettingsApplied_items.sql

Verify AtCamera Event startShutterOpen SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*startShutterOpen*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startShutterOpen.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startShutterOpen.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startShutterOpen_items.sql

Verify AtCamera Event raftsDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*raftsDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_raftsDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_raftsDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_raftsDetailedState_items.sql

Verify AtCamera Event startReadout SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*startReadout*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startReadout.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startReadout.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_startReadout_items.sql

Verify AtCamera Event shutterMotionProfile SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*shutterMotionProfile*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_shutterMotionProfile.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_shutterMotionProfile.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_shutterMotionProfile_items.sql

Verify AtCamera Event imageReadoutParameters SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcamera_*imageReadoutParameters*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_imageReadoutParameters.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_imageReadoutParameters.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcamera_logevent_imageReadoutParameters_items.sql

