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
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_LimitSensors.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LimitSensors table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Telemetry LimitSensors EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_LimitSensors"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LimitSensors does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Telemetry Position EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_Position.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Position table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Telemetry Position EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_Position"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Position does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Telemetry Electrical EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_Electrical.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Electrical table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Telemetry Electrical EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_Electrical"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Electrical does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Telemetry TC EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_TC.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TC table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Telemetry TC EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_TC"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TC does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command enable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command enable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command disable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command disable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command abort EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command abort EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command enterControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command enterControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command exitControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command exitControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command standby EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command standby EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command start EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command start EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify Rotator State Command stop EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator State Command stop EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Command configureAcceleration EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_configureAcceleration.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configureAcceleration table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Command configureAcceleration EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_configureAcceleration"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configureAcceleration does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Command configureVelocity EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_configureVelocity.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configureVelocity table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Command configureVelocity EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_configureVelocity"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configureVelocity does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Command move EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_move.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the move table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Command move EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_move"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table move does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Command track EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_track.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the track table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Command track EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_track"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table track does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Command test EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_command_test.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the test table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Command test EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_command_test"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table test does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event error EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_error.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the error table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event error EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_error"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table error does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event interlock EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_interlock.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the interlock table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event interlock EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_interlock"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table interlock does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event limit EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_limit.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the limit table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event limit EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_limit"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table limit does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event moveOK EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_moveOK.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the moveOK table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event moveOK EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_moveOK"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table moveOK does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event tempError EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_tempError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the tempError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event tempError EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_tempError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table tempError does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event trackLost EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_trackLost.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the trackLost table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event trackLost EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_trackLost"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table trackLost does not exist
    Should Contain    ${output}    Empty set

Verify Rotator Event tracking EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/rotator_logevent_tracking.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the tracking table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Rotator Event tracking EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from rotator_logevent_tracking"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table tracking does not exist
    Should Contain    ${output}    Empty set

