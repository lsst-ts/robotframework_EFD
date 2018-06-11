*** Settings ***
Documentation    This suite verifies SQL table creation for the AtHeaderService.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    AtHeaderService
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

Verify AtHeaderService Telemetry LoopTime_ms SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LoopTime_ms*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_LoopTime_ms.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_LoopTime_ms.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_LoopTime_ms_items.sql

Verify AtHeaderService Telemetry Timestamp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Timestamp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_Timestamp.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_Timestamp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_Timestamp_items.sql

Verify AtHeaderService Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_enable_items.sql

Verify AtHeaderService Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_exitControl_items.sql

Verify AtHeaderService Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_start_items.sql

Verify AtHeaderService Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_standby_items.sql

Verify AtHeaderService Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_disable_items.sql

Verify AtHeaderService Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_command_enterControl_items.sql

Verify AtHeaderService Event Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_Heartbeat_items.sql

Verify AtHeaderService Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_AppliedSettingsMatchStart_items.sql

Verify AtHeaderService Event LoopTimeOutOfRange SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*LoopTimeOutOfRange*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_LoopTimeOutOfRange.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_LoopTimeOutOfRange.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_LoopTimeOutOfRange_items.sql

Verify AtHeaderService Event RejectedCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*RejectedCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_RejectedCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_RejectedCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_RejectedCommand_items.sql

Verify AtHeaderService Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SettingsApplied_items.sql

Verify AtHeaderService Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_DetailedState_items.sql

Verify AtHeaderService Event LargeFileObjectAvailable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*LargeFileObjectAvailable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_LargeFileObjectAvailable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_LargeFileObjectAvailable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_LargeFileObjectAvailable_items.sql

Verify AtHeaderService Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SummaryState_items.sql

Verify AtHeaderService Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_ErrorCode_items.sql

Verify AtHeaderService Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atHeaderService_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atHeaderService_logevent_SettingVersions_items.sql

