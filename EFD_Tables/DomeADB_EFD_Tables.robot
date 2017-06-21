*** Settings ***
Documentation    This suite verify SQL table creation for the DomeADB.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeADB
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

Verify DomeADB Telemetry status EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_status.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the status table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Telemetry status EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_status"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table status does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command enable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command disable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command abort EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command standby EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command start EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command start EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB State Command stop EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Command Crawl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_Crawl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Crawl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Command Crawl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_Crawl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Crawl does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Command Move EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_Move.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Move table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Command Move EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_Move"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Move does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Command VelocityMove EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_VelocityMove.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the VelocityMove table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Command VelocityMove EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_VelocityMove"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table VelocityMove does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Command Echo EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_command_Echo.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Echo table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Command Echo EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_command_Echo"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Echo does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event StateChanged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_StateChanged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the StateChanged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event StateChanged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_StateChanged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table StateChanged does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event DriveEnabled EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_DriveEnabled.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveEnabled table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event DriveEnabled EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_DriveEnabled"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveEnabled does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event DriveDisabled EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_DriveDisabled.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveDisabled table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event DriveDisabled EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_DriveDisabled"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveDisabled does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event DriveReady EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_DriveReady.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveReady table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event DriveReady EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_DriveReady"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveReady does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event DriveOverTemp EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_DriveOverTemp.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveOverTemp table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event DriveOverTemp EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_DriveOverTemp"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveOverTemp does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event DriveFault EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_DriveFault.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveFault table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event DriveFault EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_DriveFault"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveFault does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event RotationEnabled EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_RotationEnabled.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the RotationEnabled table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event RotationEnabled EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_RotationEnabled"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table RotationEnabled does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event RotationPrevented EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_RotationPrevented.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the RotationPrevented table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event RotationPrevented EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_RotationPrevented"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table RotationPrevented does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event LockingPinEngaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_LockingPinEngaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LockingPinEngaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event LockingPinEngaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_LockingPinEngaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LockingPinEngaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event LockingPinDisengaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_LockingPinDisengaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LockingPinDisengaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event LockingPinDisengaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_LockingPinDisengaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LockingPinDisengaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event BrakeEngaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_BrakeEngaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the BrakeEngaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event BrakeEngaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_BrakeEngaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table BrakeEngaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event BrakeDisengaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_BrakeDisengaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the BrakeDisengaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event BrakeDisengaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_BrakeDisengaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table BrakeDisengaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event SpeedLimitReached EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitReached.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SpeedLimitReached table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event SpeedLimitReached EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_SpeedLimitReached"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SpeedLimitReached does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event AccelerationLimitReached EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitReached.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AccelerationLimitReached table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event AccelerationLimitReached EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_AccelerationLimitReached"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AccelerationLimitReached does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event SpeedLimitSubsided EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitSubsided.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SpeedLimitSubsided table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event SpeedLimitSubsided EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_SpeedLimitSubsided"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SpeedLimitSubsided does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event AccelerationLimitSubsided EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitSubsided.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AccelerationLimitSubsided table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event AccelerationLimitSubsided EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_AccelerationLimitSubsided"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AccelerationLimitSubsided does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event EchoResponse EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_EchoResponse.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the EchoResponse table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event EchoResponse EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_EchoResponse"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table EchoResponse does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event MotionModeChanged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_MotionModeChanged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MotionModeChanged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event MotionModeChanged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_MotionModeChanged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MotionModeChanged does not exist
    Should Contain    ${output}    Empty set

Verify DomeADB Event SubsystemError EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeADB_logevent_SubsystemError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SubsystemError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeADB Event SubsystemError EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeADB_logevent_SubsystemError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SubsystemError does not exist
    Should Contain    ${output}    Empty set

