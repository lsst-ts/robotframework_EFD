*** Settings ***
Documentation    This suite verifies SQL table creation for the HeaderService.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    HeaderService
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

Verify HeaderService Telemetry LoopTime_ms SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LoopTime_ms*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_LoopTime_ms.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_LoopTime_ms.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_LoopTime_ms_items.sql

Verify HeaderService Telemetry Timestamp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Timestamp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_Timestamp.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_Timestamp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_Timestamp_items.sql

Verify HeaderService Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_command_enable_items.sql

Verify HeaderService Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_command_exitControl_items.sql

Verify HeaderService Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_command_start_items.sql

Verify HeaderService Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_command_standby_items.sql

Verify HeaderService Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_command_disable_items.sql

Verify HeaderService Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_command_enterControl_items.sql

Verify HeaderService Event Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_Heartbeat_items.sql

Verify HeaderService Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_AppliedSettingsMatchStart_items.sql

Verify HeaderService Event LoopTimeOutOfRange SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*LoopTimeOutOfRange*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_LoopTimeOutOfRange.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_LoopTimeOutOfRange.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_LoopTimeOutOfRange_items.sql

Verify HeaderService Event RejectedCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*RejectedCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_RejectedCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_RejectedCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_RejectedCommand_items.sql

Verify HeaderService Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SettingsApplied_items.sql

Verify HeaderService Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_DetailedState_items.sql

Verify HeaderService Event LargeFileObjectAvailable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*LargeFileObjectAvailable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_LargeFileObjectAvailable.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_LargeFileObjectAvailable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_LargeFileObjectAvailable_items.sql

Verify HeaderService Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SummaryState_items.sql

Verify HeaderService Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_ErrorCode_items.sql

Verify HeaderService Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=headerService_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/headerService_logevent_SettingVersions_items.sql

