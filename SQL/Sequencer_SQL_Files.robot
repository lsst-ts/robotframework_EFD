*** Settings ***
Documentation    This suite verify SQL table creation for the Sequencer.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Sequencer
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

Verify Sequencer Telemetry SequencerHeartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SequencerHeartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_SequencerHeartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_SequencerHeartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_SequencerHeartbeat_items.sql

Verify Sequencer State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_enable_items.sql

Verify Sequencer State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_disable_items.sql

Verify Sequencer State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_abort_items.sql

Verify Sequencer State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_enterControl_items.sql

Verify Sequencer State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_exitControl_items.sql

Verify Sequencer State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_standby_items.sql

Verify Sequencer State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_start_items.sql

Verify Sequencer State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_stop_items.sql

Verify Sequencer Command sequence SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequence*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_sequence.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_sequence.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_sequence_items.sql

Verify Sequencer Command script SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*script*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_script.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_script.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_command_script_items.sql

Verify Sequencer Event sequencerEntitySummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerEntitySummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntitySummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntitySummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntitySummaryState_items.sql

Verify Sequencer Event sequencerEntityStartup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerEntityStartup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityStartup.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityStartup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityStartup_items.sql

Verify Sequencer Event sequencerEntityShutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerEntityShutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityShutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityShutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityShutdown_items.sql

Verify Sequencer Event sequencerCommandIssued SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerCommandIssued*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandIssued.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandIssued.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandIssued_items.sql

Verify Sequencer Event sequencerCommandStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerCommandStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandStatus_items.sql

Verify Sequencer Event sequencerCurrentScript SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerCurrentScript*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCurrentScript.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCurrentScript.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerCurrentScript_items.sql

Verify Sequencer Event sequencerNextScript SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerNextScript*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerNextScript.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerNextScript.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerNextScript_items.sql

Verify Sequencer Event sequencerScriptStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerScriptStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptStart_items.sql

Verify Sequencer Event sequencerScriptEnd SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerScriptEnd*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEnd.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEnd.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEnd_items.sql

Verify Sequencer Event sequencerScriptError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerScriptError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptError.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptError_items.sql

Verify Sequencer Event sequencerScriptEntititesInUse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=sequencer_*sequencerScriptEntititesInUse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEntititesInUse.sqldef
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEntititesInUse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEntititesInUse_items.sql

