*** Settings ***
Documentation    This suite verify SQL table creation for the OCS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    OCS
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

Verify OCS Telemetry SequencerHeartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SequencerHeartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_SequencerHeartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_SequencerHeartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_SequencerHeartbeat_items.sql

Verify OCS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_enable_items.sql

Verify OCS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_disable_items.sql

Verify OCS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_abort_items.sql

Verify OCS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_enterControl_items.sql

Verify OCS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_exitControl_items.sql

Verify OCS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_standby_items.sql

Verify OCS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_start_items.sql

Verify OCS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_stop_items.sql

Verify OCS Command sequence SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*sequence*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_sequence.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_sequence.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_sequence_items.sql

Verify OCS Command script SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*script*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_command_script.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_command_script.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_command_script_items.sql

Verify OCS Event ocsEntitySummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsEntitySummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntitySummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntitySummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntitySummaryState_items.sql

Verify OCS Event ocsEntityStartup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsEntityStartup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntityStartup.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntityStartup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntityStartup_items.sql

Verify OCS Event ocsEntityShutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsEntityShutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntityShutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntityShutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsEntityShutdown_items.sql

Verify OCS Event ocsCommandIssued SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsCommandIssued*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCommandIssued.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCommandIssued.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCommandIssued_items.sql

Verify OCS Event ocsCommandStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsCommandStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCommandStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCommandStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCommandStatus_items.sql

Verify OCS Event ocsCurrentScript SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsCurrentScript*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCurrentScript.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCurrentScript.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsCurrentScript_items.sql

Verify OCS Event ocsNextScript SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsNextScript*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsNextScript.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsNextScript.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsNextScript_items.sql

Verify OCS Event ocsScriptStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsScriptStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptStart_items.sql

Verify OCS Event ocsScriptEnd SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsScriptEnd*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptEnd.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptEnd.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptEnd_items.sql

Verify OCS Event ocsScriptError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsScriptError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptError.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptError_items.sql

Verify OCS Event ocsScriptEntititesInUse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=ocs_*ocsScriptEntititesInUse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptEntititesInUse.sqldef
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptEntititesInUse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/ocs_logevent_ocsScriptEntititesInUse_items.sql

