*** Settings ***
Documentation    This suite verify SQL table creation for the CatchupArchiver.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    CatchupArchiver
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

Verify CatchupArchiver Telemetry SequencerHeartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SequencerHeartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_SequencerHeartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_SequencerHeartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_SequencerHeartbeat_items.sql

Verify CatchupArchiver State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_enable_items.sql

Verify CatchupArchiver State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_disable_items.sql

Verify CatchupArchiver State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_abort_items.sql

Verify CatchupArchiver State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_enterControl_items.sql

Verify CatchupArchiver State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_exitControl_items.sql

Verify CatchupArchiver State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_standby_items.sql

Verify CatchupArchiver State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_start_items.sql

Verify CatchupArchiver State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_command_stop_items.sql

Verify CatchupArchiver Event catchuparchiverEntitySummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*catchuparchiverEntitySummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntitySummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntitySummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntitySummaryState_items.sql

Verify CatchupArchiver Event catchuparchiverEntityStartup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*catchuparchiverEntityStartup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntityStartup.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntityStartup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntityStartup_items.sql

Verify CatchupArchiver Event catchuparchiverEntityShutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver_*catchuparchiverEntityShutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntityShutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntityShutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/catchuparchiver_logevent_catchuparchiverEntityShutdown_items.sql

