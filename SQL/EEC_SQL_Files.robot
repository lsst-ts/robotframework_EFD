*** Settings ***
Documentation    This suite verifies SQL table creation for the EEC.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    EEC
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

Verify EEC Telemetry hvactelem SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*hvactelem*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_hvactelem.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_hvactelem.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_hvactelem_items.sql

Verify EEC Telemetry Timestamp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Timestamp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_Timestamp.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_Timestamp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_Timestamp_items.sql

Verify EEC Telemetry nightsetpoint SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*nightsetpoint*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_nightsetpoint.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_nightsetpoint.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_nightsetpoint_items.sql

Verify EEC Telemetry eectelem SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*eectelem*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_eectelem.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_eectelem.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_eectelem_items.sql

Verify EEC Telemetry LoopTime_ms SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LoopTime_ms*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_LoopTime_ms.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_LoopTime_ms.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_LoopTime_ms_items.sql

Verify EEC Telemetry daysetpoint SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*daysetpoint*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_daysetpoint.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_daysetpoint.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_daysetpoint_items.sql

Verify EEC State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_enable_items.sql

Verify EEC State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_disable_items.sql

Verify EEC State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_abort_items.sql

Verify EEC State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_enterControl_items.sql

Verify EEC State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_exitControl_items.sql

Verify EEC State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_standby_items.sql

Verify EEC State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_start_items.sql

Verify EEC State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_stop_items.sql

Verify EEC Command operatormode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*operatormode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_operatormode.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_operatormode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_operatormode_items.sql

Verify EEC Command nighttimemode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*nighttimemode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_nighttimemode.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_nighttimemode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_nighttimemode_items.sql

Verify EEC Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_enable_items.sql

Verify EEC Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_exitControl_items.sql

Verify EEC Command sethvac SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*sethvac*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_sethvac.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_sethvac.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_sethvac_items.sql

Verify EEC Command daytimemode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*daytimemode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_daytimemode.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_daytimemode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_daytimemode_items.sql

Verify EEC Command setlouvers SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*setlouvers*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_setlouvers.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_setlouvers.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_setlouvers_items.sql

Verify EEC Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_start_items.sql

Verify EEC Command engineeringmode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*engineeringmode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_engineeringmode.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_engineeringmode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_engineeringmode_items.sql

Verify EEC Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_standby_items.sql

Verify EEC Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_command_disable_items.sql

Verify EEC Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_AppliedSettingsMatchStart_items.sql

Verify EEC Event nighttimefail SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*nighttimefail*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_nighttimefail.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_nighttimefail.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_nighttimefail_items.sql

Verify EEC Event RejectedCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*RejectedCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_RejectedCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_RejectedCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_RejectedCommand_items.sql

Verify EEC Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SettingsApplied_items.sql

Verify EEC Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_DetailedState_items.sql

Verify EEC Event daytimefail SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*daytimefail*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_daytimefail.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_daytimefail.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_daytimefail_items.sql

Verify EEC Event InternalCommand SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*InternalCommand*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_InternalCommand.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_InternalCommand.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_InternalCommand_items.sql

Verify EEC Event LoopTimeOutOfRange SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*LoopTimeOutOfRange*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_LoopTimeOutOfRange.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_LoopTimeOutOfRange.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_LoopTimeOutOfRange_items.sql

Verify EEC Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SummaryState_items.sql

Verify EEC Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_ErrorCode_items.sql

Verify EEC Event Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_Heartbeat_items.sql

Verify EEC Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=eec_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/eec_logevent_SettingVersions_items.sql

