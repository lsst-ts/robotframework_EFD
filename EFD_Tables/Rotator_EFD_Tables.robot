*** Settings ***
Documentation    This suite verify SQL table creation for the Rotator.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Rotator
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

Verify Rotator Telemetry LimitSensors EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_LimitSensors.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator LimitSensors table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry LimitSensors EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_LimitSensors"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator LimitSensors does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry Position EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_Position.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator Position table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry Position EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_Position"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator Position does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry Electrical EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_Electrical.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator Electrical table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry Electrical EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_Electrical"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator Electrical does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry TC EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_TC.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator TC table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Telemetry TC EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_TC"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator TC does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_enable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator enable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command enable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_enable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator enable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_disable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator disable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command disable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_disable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator disable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_abort.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator abort table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command abort EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_abort"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator abort does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_enterControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator enterControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_enterControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator enterControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_exitControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator exitControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_exitControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator exitControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_standby.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator standby table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command standby EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_standby"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator standby does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command start EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_start.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator start table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command start EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_start"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator start does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_stop.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator stop table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator State Command stop EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_stop"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator stop does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command configureAcceleration EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_configureAcceleration.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator configureAcceleration table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command configureAcceleration EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_configureAcceleration"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator configureAcceleration does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command configureVelocity EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_configureVelocity.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator configureVelocity table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command configureVelocity EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_configureVelocity"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator configureVelocity does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command move EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_move.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator move table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command move EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_move"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator move does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command track EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_track.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator track table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command track EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_track"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator track does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command test EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_test.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator test table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Command test EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_test"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator test does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event error EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_error.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator error table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event error EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_error"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator error does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event interlock EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_interlock.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator interlock table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event interlock EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_interlock"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator interlock does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event limit EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_limit.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator limit table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event limit EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_limit"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator limit does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event moveOK EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_moveOK.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator moveOK table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event moveOK EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_moveOK"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator moveOK does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event tempError EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_tempError.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator tempError table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event tempError EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_tempError"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator tempError does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event trackLost EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_trackLost.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator trackLost table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event trackLost EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_trackLost"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator trackLost does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event tracking EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_tracking.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotator tracking table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Rotator Event tracking EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_tracking"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotator tracking does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

