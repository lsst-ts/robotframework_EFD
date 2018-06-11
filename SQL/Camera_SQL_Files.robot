*** Settings ***
Documentation    This suite verifies SQL table creation for the Camera.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Camera
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

Verify Camera Telemetry Shutter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Shutter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Shutter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Shutter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Shutter_items.sql

Verify Camera Telemetry Prot SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Prot*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Prot.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Prot.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Prot_items.sql

Verify Camera Telemetry Filter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Filter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Filter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Filter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Filter_items.sql

Verify Camera Telemetry Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Heartbeat_items.sql

Verify Camera Telemetry WAS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*WAS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_WAS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_WAS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_WAS_items.sql

Verify Camera Telemetry CCS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*CCS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_CCS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_CCS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_CCS_items.sql

Verify Camera Telemetry Cluster_Encoder SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Cluster_Encoder*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Cluster_Encoder.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Cluster_Encoder.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Cluster_Encoder_items.sql

Verify Camera Telemetry Cyro SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Cyro*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Cyro.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Cyro.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Cyro_items.sql

Verify Camera Telemetry Purge SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Purge*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Purge.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Purge.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Purge_items.sql

Verify Camera Telemetry WDS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*WDS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_WDS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_WDS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_WDS_items.sql

Verify Camera Telemetry GDS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*GDS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_GDS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_GDS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_GDS_items.sql

Verify Camera Telemetry SDS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SDS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_SDS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_SDS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_SDS_items.sql

Verify Camera Telemetry GAS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*GAS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_GAS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_GAS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_GAS_items.sql

Verify Camera Telemetry PCMS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*PCMS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_PCMS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_PCMS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_PCMS_items.sql

Verify Camera Telemetry SAS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SAS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_SAS.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_SAS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_SAS_items.sql

Verify Camera Telemetry Cold SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Cold*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_Cold.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_Cold.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_Cold_items.sql

Verify Camera State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_enable_items.sql

Verify Camera State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_disable_items.sql

Verify Camera State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_abort_items.sql

Verify Camera State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_enterControl_items.sql

Verify Camera State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_exitControl_items.sql

Verify Camera State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_standby_items.sql

Verify Camera State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_start_items.sql

Verify Camera State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_stop_items.sql

Verify Camera Command discardRows SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*discardRows*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_discardRows.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_discardRows.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_discardRows_items.sql

Verify Camera Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_enable_items.sql

Verify Camera Command setValue SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*setValue*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_setValue.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_setValue.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_setValue_items.sql

Verify Camera Command startImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_startImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_startImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_startImage_items.sql

Verify Camera Command disableCalibration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*disableCalibration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_disableCalibration.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_disableCalibration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_disableCalibration_items.sql

Verify Camera Command initGuiders SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*initGuiders*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_initGuiders.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_initGuiders.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_initGuiders_items.sql

Verify Camera Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_standby_items.sql

Verify Camera Command enableCalibration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*enableCalibration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_enableCalibration.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_enableCalibration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_enableCalibration_items.sql

Verify Camera Command initImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*initImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_initImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_initImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_initImage_items.sql

Verify Camera Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_enterControl_items.sql

Verify Camera Command endImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_endImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_endImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_endImage_items.sql

Verify Camera Command setFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*setFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_setFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_setFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_setFilter_items.sql

Verify Camera Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_disable_items.sql

Verify Camera Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_abort_items.sql

Verify Camera Command clear SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*clear*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_clear.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_clear.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_clear_items.sql

Verify Camera Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_exitControl_items.sql

Verify Camera Command takeImages SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*takeImages*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_takeImages.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_takeImages.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_takeImages_items.sql

Verify Camera Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_start_items.sql

Verify Camera Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_command_stop_items.sql

Verify Camera Event offlineDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*offlineDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_offlineDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_offlineDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_offlineDetailedState_items.sql

Verify Camera Event endReadout SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endReadout*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endReadout.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endReadout.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endReadout_items.sql

Verify Camera Event endTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endTakeImage_items.sql

Verify Camera Event imageReadinessDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*imageReadinessDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_imageReadinessDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_imageReadinessDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_imageReadinessDetailedState_items.sql

Verify Camera Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SettingVersions_items.sql

Verify Camera Event startSetFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startSetFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startSetFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startSetFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startSetFilter_items.sql

Verify Camera Event startUnloadFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startUnloadFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startUnloadFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startUnloadFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startUnloadFilter_items.sql

Verify Camera Event notReadyToTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*notReadyToTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_notReadyToTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_notReadyToTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_notReadyToTakeImage_items.sql

Verify Camera Event startShutterClose SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startShutterClose*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startShutterClose.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startShutterClose.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startShutterClose_items.sql

Verify Camera Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_AppliedSettingsMatchStart_items.sql

Verify Camera Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ErrorCode_items.sql

Verify Camera Event endInitializeGuider SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endInitializeGuider*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endInitializeGuider.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endInitializeGuider.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endInitializeGuider_items.sql

Verify Camera Event endShutterClose SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endShutterClose*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endShutterClose.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endShutterClose.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endShutterClose_items.sql

Verify Camera Event endOfImageTelemetry SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endOfImageTelemetry*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endOfImageTelemetry.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endOfImageTelemetry.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endOfImageTelemetry_items.sql

Verify Camera Event endUnloadFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endUnloadFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endUnloadFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endUnloadFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endUnloadFilter_items.sql

Verify Camera Event calibrationDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*calibrationDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_calibrationDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_calibrationDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_calibrationDetailedState_items.sql

Verify Camera Event endRotateCarousel SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endRotateCarousel*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endRotateCarousel.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endRotateCarousel.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endRotateCarousel_items.sql

Verify Camera Event startLoadFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startLoadFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startLoadFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startLoadFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startLoadFilter_items.sql

Verify Camera Event filterChangerDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*filterChangerDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_filterChangerDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_filterChangerDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_filterChangerDetailedState_items.sql

Verify Camera Event shutterDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*shutterDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_shutterDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_shutterDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_shutterDetailedState_items.sql

Verify Camera Event readyToTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*readyToTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_readyToTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_readyToTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_readyToTakeImage_items.sql

Verify Camera Event ccsCommandState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*ccsCommandState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ccsCommandState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ccsCommandState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ccsCommandState_items.sql

Verify Camera Event prepareToTakeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*prepareToTakeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_prepareToTakeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_prepareToTakeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_prepareToTakeImage_items.sql

Verify Camera Event ccsConfigured SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*ccsConfigured*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ccsConfigured.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ccsConfigured.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_ccsConfigured_items.sql

Verify Camera Event endLoadFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endLoadFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endLoadFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endLoadFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endLoadFilter_items.sql

Verify Camera Event endShutterOpen SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endShutterOpen*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endShutterOpen.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endShutterOpen.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endShutterOpen_items.sql

Verify Camera Event startIntegration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startIntegration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startIntegration.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startIntegration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startIntegration_items.sql

Verify Camera Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SummaryState_items.sql

Verify Camera Event endInitializeImage SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endInitializeImage*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endInitializeImage.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endInitializeImage.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endInitializeImage_items.sql

Verify Camera Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_SettingsApplied_items.sql

Verify Camera Event endSetFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*endSetFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endSetFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endSetFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_endSetFilter_items.sql

Verify Camera Event startShutterOpen SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startShutterOpen*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startShutterOpen.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startShutterOpen.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startShutterOpen_items.sql

Verify Camera Event raftsDetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*raftsDetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_raftsDetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_raftsDetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_raftsDetailedState_items.sql

Verify Camera Event availableFilters SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*availableFilters*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_availableFilters.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_availableFilters.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_availableFilters_items.sql

Verify Camera Event startReadout SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startReadout*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startReadout.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startReadout.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startReadout_items.sql

Verify Camera Event startRotateCarousel SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=camera_*startRotateCarousel*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startRotateCarousel.sqldef
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startRotateCarousel.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/camera_logevent_startRotateCarousel_items.sql

