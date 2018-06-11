*** Settings ***
Documentation    This suite verifies SQL table creation for the ATCS.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    ATCS
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

Verify ATCS Telemetry LoopTime_ms SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LoopTime_ms*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_LoopTime_ms.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_LoopTime_ms.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_LoopTime_ms_items.sql

Verify ATCS Telemetry Timestamp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Timestamp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_Timestamp.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_Timestamp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_Timestamp_items.sql

Verify ATCS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enable_items.sql

Verify ATCS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_disable_items.sql

Verify ATCS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_abort_items.sql

Verify ATCS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enterControl_items.sql

Verify ATCS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_exitControl_items.sql

Verify ATCS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_standby_items.sql

Verify ATCS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_start_items.sql

Verify ATCS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_stop_items.sql

Verify ATCS Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_disable_items.sql

Verify ATCS Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enable_items.sql

Verify ATCS Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_exitControl_items.sql

Verify ATCS Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_standby_items.sql

Verify ATCS Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_start_items.sql

Verify ATCS Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_enterControl_items.sql

Verify ATCS Command Target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*Target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_Target.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_Target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_Target_items.sql

Verify ATCS Command Offset SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*Offset*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_Offset.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_Offset.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_Offset_items.sql

Verify ATCS Command SpectrographSetup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*SpectrographSetup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_command_SpectrographSetup.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_command_SpectrographSetup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_command_SpectrographSetup_items.sql

Verify ATCS Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_AppliedSettingsMatchStart_items.sql

Verify ATCS Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_ErrorCode_items.sql

Verify ATCS Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SummaryState_items.sql

Verify ATCS Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_DetailedState_items.sql

Verify ATCS Event SpectrographInPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*SpectrographInPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SpectrographInPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SpectrographInPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SpectrographInPosition_items.sql

Verify ATCS Event TelescopeInPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*TelescopeInPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_TelescopeInPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_TelescopeInPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_TelescopeInPosition_items.sql

Verify ATCS Event RejectedCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*RejectedCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_RejectedCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_RejectedCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_RejectedCommand_items.sql

Verify ATCS Event InternalCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*InternalCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_InternalCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_InternalCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_InternalCommand_items.sql

Verify ATCS Event Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_Heartbeat_items.sql

Verify ATCS Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SettingVersions_items.sql

Verify ATCS Event LoopTimeOutOfRange SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*LoopTimeOutOfRange*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_LoopTimeOutOfRange.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_LoopTimeOutOfRange.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_LoopTimeOutOfRange_items.sql

Verify ATCS Event SettingsApplied_Example SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atcs_*SettingsApplied_Example*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SettingsApplied_Example.sqldef
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SettingsApplied_Example.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atcs_logevent_SettingsApplied_Example_items.sql

