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
Create EFD_Tables Session
    [Documentation]    Connect to the host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=EFD_Tables    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify Sequencer Telemetry SequencerHeartbeat EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_SequencerHeartbeat.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SequencerHeartbeat table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Telemetry SequencerHeartbeat EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_SequencerHeartbeat"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SequencerHeartbeat does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command enable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command enable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command disable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command disable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command abort EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command abort EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command enterControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command enterControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command exitControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command exitControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command standby EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command standby EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command start EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command start EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer State Command stop EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer State Command stop EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Command sequence EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_sequence.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequence table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Command sequence EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_sequence"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequence does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Command script EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_command_script.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the script table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Command script EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_command_script"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table script does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerEntitySummaryState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerEntitySummaryState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerEntitySummaryState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerEntitySummaryState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerEntitySummaryState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerEntitySummaryState does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerEntityStartup EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityStartup.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerEntityStartup table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerEntityStartup EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerEntityStartup"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerEntityStartup does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerEntityShutdown EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerEntityShutdown.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerEntityShutdown table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerEntityShutdown EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerEntityShutdown"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerEntityShutdown does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerCommandIssued EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandIssued.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerCommandIssued table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerCommandIssued EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerCommandIssued"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerCommandIssued does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerCommandStatus EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerCommandStatus.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerCommandStatus table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerCommandStatus EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerCommandStatus"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerCommandStatus does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerCurrentScript EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerCurrentScript.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerCurrentScript table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerCurrentScript EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerCurrentScript"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerCurrentScript does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerNextScript EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerNextScript.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerNextScript table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerNextScript EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerNextScript"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerNextScript does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerScriptStart EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptStart.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerScriptStart table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerScriptStart EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerScriptStart"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerScriptStart does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerScriptEnd EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEnd.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerScriptEnd table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerScriptEnd EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerScriptEnd"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerScriptEnd does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerScriptError EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerScriptError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerScriptError EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerScriptError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerScriptError does not exist
    Should Contain    ${output}    Empty set

Verify Sequencer Event sequencerScriptEntititesInUse EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/sequencer_logevent_sequencerScriptEntititesInUse.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencerScriptEntititesInUse table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Sequencer Event sequencerScriptEntititesInUse EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from sequencer_logevent_sequencerScriptEntititesInUse"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencerScriptEntititesInUse does not exist
    Should Contain    ${output}    Empty set

