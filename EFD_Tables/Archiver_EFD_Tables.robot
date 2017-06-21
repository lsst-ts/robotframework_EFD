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

Verify Archiver Telemetry SequencerHeartbeat EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_SequencerHeartbeat.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SequencerHeartbeat table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver Telemetry SequencerHeartbeat EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_SequencerHeartbeat"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SequencerHeartbeat does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command enable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command disable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command abort EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command standby EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command start EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command start EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify Archiver State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver State Command stop EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify Archiver Event archiverEntitySummaryState EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_logevent_archiverEntitySummaryState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the archiverEntitySummaryState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver Event archiverEntitySummaryState EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_logevent_archiverEntitySummaryState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table archiverEntitySummaryState does not exist
    Should Contain    ${output}    Empty set

Verify Archiver Event archiverEntityStartup EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_logevent_archiverEntityStartup.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the archiverEntityStartup table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver Event archiverEntityStartup EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_logevent_archiverEntityStartup"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table archiverEntityStartup does not exist
    Should Contain    ${output}    Empty set

Verify Archiver Event archiverEntityShutdown EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/archiver_logevent_archiverEntityShutdown.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the archiverEntityShutdown table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Archiver Event archiverEntityShutdown EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from archiver_logevent_archiverEntityShutdown"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table archiverEntityShutdown does not exist
    Should Contain    ${output}    Empty set

