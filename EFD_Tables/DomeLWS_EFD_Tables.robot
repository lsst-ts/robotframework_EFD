*** Settings ***
Documentation    This suite verify SQL table creation for the DomeLWS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeLWS
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

Verify DomeLWS Telemetry status EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_status.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the status table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Telemetry status EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_status"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table status does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command enable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command disable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command abort EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command standby EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command start EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command start EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS State Command stop EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Command CrawlLWS EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_CrawlLWS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the CrawlLWS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Command CrawlLWS EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_CrawlLWS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table CrawlLWS does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Command MoveLWS EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_MoveLWS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MoveLWS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Command MoveLWS EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_MoveLWS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MoveLWS does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Command VelocityMoveLWS EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_VelocityMoveLWS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the VelocityMoveLWS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Command VelocityMoveLWS EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_VelocityMoveLWS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table VelocityMoveLWS does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Command EchoLWS EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_EchoLWS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the EchoLWS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Command EchoLWS EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_EchoLWS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table EchoLWS does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event StateChanged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_StateChanged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the StateChanged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event StateChanged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_StateChanged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table StateChanged does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event DriveEnabled EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveEnabled.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveEnabled table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event DriveEnabled EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveEnabled"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveEnabled does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event DriveDisabled EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveDisabled.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveDisabled table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event DriveDisabled EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveDisabled"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveDisabled does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event DriveReady EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveReady.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveReady table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event DriveReady EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveReady"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveReady does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event DriveOverTemp EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveOverTemp.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveOverTemp table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event DriveOverTemp EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveOverTemp"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveOverTemp does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event DriveFault EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveFault.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DriveFault table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event DriveFault EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveFault"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DriveFault does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event MovementEnabled EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_MovementEnabled.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MovementEnabled table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event MovementEnabled EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_MovementEnabled"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MovementEnabled does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event MovementPrevented EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_MovementPrevented.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MovementPrevented table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event MovementPrevented EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_MovementPrevented"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MovementPrevented does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event LockingPinEngaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinEngaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LockingPinEngaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event LockingPinEngaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinEngaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LockingPinEngaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event LockingPinDisengaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinDisengaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LockingPinDisengaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event LockingPinDisengaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinDisengaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LockingPinDisengaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event LockingPinHomed EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinHomed.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LockingPinHomed table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event LockingPinHomed EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinHomed"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LockingPinHomed does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event LockingPinFloating EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinFloating.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LockingPinFloating table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event LockingPinFloating EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinFloating"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LockingPinFloating does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event BrakeEngaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_BrakeEngaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the BrakeEngaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event BrakeEngaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_BrakeEngaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table BrakeEngaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event BrakeDisengaged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_BrakeDisengaged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the BrakeDisengaged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event BrakeDisengaged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_BrakeDisengaged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table BrakeDisengaged does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event SpeedLimitReached EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitReached.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SpeedLimitReached table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event SpeedLimitReached EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_SpeedLimitReached"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SpeedLimitReached does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event AccelerationLimitReached EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitReached.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AccelerationLimitReached table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event AccelerationLimitReached EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_AccelerationLimitReached"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AccelerationLimitReached does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event SpeedLimitSubsided EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitSubsided.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SpeedLimitSubsided table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event SpeedLimitSubsided EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_SpeedLimitSubsided"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SpeedLimitSubsided does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event AccelerationLimitSubsided EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitSubsided.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AccelerationLimitSubsided table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event AccelerationLimitSubsided EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_AccelerationLimitSubsided"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AccelerationLimitSubsided does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event EchoResponse EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_EchoResponse.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the EchoResponse table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event EchoResponse EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_EchoResponse"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table EchoResponse does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event MotionModeChanged EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_MotionModeChanged.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MotionModeChanged table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event MotionModeChanged EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_MotionModeChanged"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MotionModeChanged does not exist
    Should Contain    ${output}    Empty set

Verify DomeLWS Event SubsystemError EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_SubsystemError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the SubsystemError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify DomeLWS Event SubsystemError EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_SubsystemError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table SubsystemError does not exist
    Should Contain    ${output}    Empty set

