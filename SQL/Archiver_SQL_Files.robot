*** Settings ***
Documentation    This suite verify SQL table creation for the Archiver.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Archiver
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

Verify Archiver Telemetry SequencerHeartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SequencerHeartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_SequencerHeartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_SequencerHeartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_SequencerHeartbeat_items.sql

Verify Archiver State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enable_items.sql

Verify Archiver State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_disable_items.sql

Verify Archiver State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_abort_items.sql

Verify Archiver State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enterControl_items.sql

Verify Archiver State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_exitControl_items.sql

Verify Archiver State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_standby_items.sql

Verify Archiver State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_start_items.sql

Verify Archiver State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_stop_items.sql

Verify Archiver Command setValue SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*setValue*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_setValue.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_setValue.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_setValue_items.sql

Verify Archiver Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_start_items.sql

Verify Archiver Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_exitControl_items.sql

Verify Archiver Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_abort_items.sql

Verify Archiver Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_disable_items.sql

Verify Archiver Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enable_items.sql

Verify Archiver Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_enterControl_items.sql

Verify Archiver Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_command_standby_items.sql

Verify Archiver Event archiverEntityShutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*archiverEntityShutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntityShutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntityShutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntityShutdown_items.sql

Verify Archiver Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_DetailedState_items.sql

Verify Archiver Event archiverEntityStartup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*archiverEntityStartup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntityStartup.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntityStartup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntityStartup_items.sql

Verify Archiver Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SummaryState_items.sql

Verify Archiver Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SettingsApplied_items.sql

Verify Archiver Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_SettingVersions_items.sql

Verify Archiver Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_AppliedSettingsMatchStart_items.sql

Verify Archiver Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_ErrorCode_items.sql

Verify Archiver Event archiverEntitySummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=archiver_*archiverEntitySummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntitySummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntitySummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/archiver_logevent_archiverEntitySummaryState_items.sql

