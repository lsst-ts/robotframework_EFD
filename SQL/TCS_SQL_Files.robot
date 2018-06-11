*** Settings ***
Documentation    This suite verifies SQL table creation for the TCS.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    TCS
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

Verify TCS Telemetry kernel_PointingModel SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_PointingModel*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingModel.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingModel.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingModel_items.sql

Verify TCS Telemetry AOCS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*AOCS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_AOCS.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_AOCS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_AOCS_items.sql

Verify TCS Telemetry kernel_TimeKeeper SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_TimeKeeper*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TimeKeeper.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TimeKeeper.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TimeKeeper_items.sql

Verify TCS Telemetry kernel_Site SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_Site*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_Site.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_Site.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_Site_items.sql

Verify TCS Telemetry kernel_Target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_Target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_Target.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_Target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_Target_items.sql

Verify TCS Telemetry kernel_PointingControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_PointingControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingControl_items.sql

Verify TCS Telemetry kernel_TrackRefSys SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_TrackRefSys*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TrackRefSys.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TrackRefSys.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TrackRefSys_items.sql

Verify TCS Telemetry ZEMAX SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*ZEMAX*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_ZEMAX.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_ZEMAX.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_ZEMAX_items.sql

Verify TCS Telemetry kernel_PointingLog SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_PointingLog*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingLog.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingLog.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_PointingLog_items.sql

Verify TCS Telemetry kernel_DawdleFilter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_DawdleFilter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_DawdleFilter.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_DawdleFilter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_DawdleFilter_items.sql

Verify TCS Telemetry kernel_OpticsVt SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_OpticsVt*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_OpticsVt.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_OpticsVt.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_OpticsVt_items.sql

Verify TCS Telemetry WEP SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*WEP*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_WEP.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_WEP.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_WEP_items.sql

Verify TCS Telemetry kernel_TrackingTarget SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_TrackingTarget*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TrackingTarget.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TrackingTarget.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_TrackingTarget_items.sql

Verify TCS Telemetry kernel_FK5Target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*kernel_FK5Target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_FK5Target.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_FK5Target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_kernel_FK5Target_items.sql

Verify TCS Telemetry LoopTime_ms SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LoopTime_ms*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_LoopTime_ms.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_LoopTime_ms.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_LoopTime_ms_items.sql

Verify TCS Telemetry Timestamp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Timestamp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_Timestamp.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_Timestamp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_Timestamp_items.sql

Verify TCS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_enable_items.sql

Verify TCS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_disable_items.sql

Verify TCS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_abort_items.sql

Verify TCS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_enterControl_items.sql

Verify TCS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_exitControl_items.sql

Verify TCS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_standby_items.sql

Verify TCS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_start_items.sql

Verify TCS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_stop_items.sql

Verify TCS Command wfpCalculate SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*wfpCalculate*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_wfpCalculate.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_wfpCalculate.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_wfpCalculate_items.sql

Verify TCS Command wfpSimulate SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*wfpSimulate*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_wfpSimulate.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_wfpSimulate.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_wfpSimulate_items.sql

Verify TCS Command filterChangeRequest SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*filterChangeRequest*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_filterChangeRequest.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_filterChangeRequest.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_filterChangeRequest_items.sql

Verify TCS Command stopMotion SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*stopMotion*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_stopMotion.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_stopMotion.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_stopMotion_items.sql

Verify TCS Command target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_command_target.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_command_target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_command_target_items.sql

Verify TCS Event wfpDataReady SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*wfpDataReady*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_wfpDataReady.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_wfpDataReady.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_wfpDataReady_items.sql

Verify TCS Event zemaxError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*zemaxError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_zemaxError.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_zemaxError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_zemaxError_items.sql

Verify TCS Event InternalCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*InternalCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_InternalCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_InternalCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_InternalCommand_items.sql

Verify TCS Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_DetailedState_items.sql

Verify TCS Event Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_Heartbeat_items.sql

Verify TCS Event LoopTimeOutOfRange SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*LoopTimeOutOfRange*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_LoopTimeOutOfRange.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_LoopTimeOutOfRange.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_LoopTimeOutOfRange_items.sql

Verify TCS Event RejectedCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*RejectedCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_RejectedCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_RejectedCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_RejectedCommand_items.sql

Verify TCS Event HeartbeatIn SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*HeartbeatIn*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_HeartbeatIn.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_HeartbeatIn.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_HeartbeatIn_items.sql

Verify TCS Event FilterChangeInPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*FilterChangeInPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_FilterChangeInPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_FilterChangeInPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_FilterChangeInPosition_items.sql

Verify TCS Event TargetInPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*TargetInPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_TargetInPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_TargetInPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_TargetInPosition_items.sql

Verify TCS Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcs_logevent_SettingsApplied_items.sql

