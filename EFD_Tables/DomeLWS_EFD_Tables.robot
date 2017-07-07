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
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_status.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS status table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Telemetry status EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_status"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS status does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_enable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS enable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command enable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_enable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS enable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_disable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS disable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command disable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_disable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS disable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_abort.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS abort table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command abort EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_abort"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS abort does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_enterControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS enterControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_enterControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS enterControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_exitControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS exitControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_exitControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS exitControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_standby.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS standby table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command standby EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_standby"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS standby does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command start EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_start.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS start table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command start EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_start"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS start does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_stop.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS stop table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS State Command stop EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_stop"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS stop does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command CrawlLWS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_CrawlLWS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS CrawlLWS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command CrawlLWS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_CrawlLWS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS CrawlLWS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command MoveLWS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_MoveLWS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS MoveLWS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command MoveLWS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_MoveLWS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS MoveLWS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command VelocityMoveLWS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_VelocityMoveLWS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS VelocityMoveLWS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command VelocityMoveLWS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_VelocityMoveLWS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS VelocityMoveLWS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command EchoLWS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_command_EchoLWS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS EchoLWS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Command EchoLWS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_command_EchoLWS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS EchoLWS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event StateChanged EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_StateChanged.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS StateChanged table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event StateChanged EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_StateChanged"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS StateChanged does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveEnabled EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveEnabled.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS DriveEnabled table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveEnabled EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveEnabled"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS DriveEnabled does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveDisabled EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveDisabled.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS DriveDisabled table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveDisabled EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveDisabled"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS DriveDisabled does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveReady EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveReady.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS DriveReady table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveReady EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveReady"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS DriveReady does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveOverTemp EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveOverTemp.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS DriveOverTemp table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveOverTemp EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveOverTemp"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS DriveOverTemp does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveFault EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_DriveFault.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS DriveFault table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event DriveFault EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_DriveFault"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS DriveFault does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event MovementEnabled EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_MovementEnabled.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS MovementEnabled table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event MovementEnabled EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_MovementEnabled"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS MovementEnabled does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event MovementPrevented EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_MovementPrevented.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS MovementPrevented table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event MovementPrevented EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_MovementPrevented"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS MovementPrevented does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinEngaged EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinEngaged.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS LockingPinEngaged table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinEngaged EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinEngaged"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS LockingPinEngaged does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinDisengaged EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinDisengaged.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS LockingPinDisengaged table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinDisengaged EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinDisengaged"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS LockingPinDisengaged does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinHomed EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinHomed.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS LockingPinHomed table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinHomed EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinHomed"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS LockingPinHomed does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinFloating EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_LockingPinFloating.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS LockingPinFloating table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event LockingPinFloating EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_LockingPinFloating"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS LockingPinFloating does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event BrakeEngaged EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_BrakeEngaged.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS BrakeEngaged table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event BrakeEngaged EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_BrakeEngaged"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS BrakeEngaged does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event BrakeDisengaged EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_BrakeDisengaged.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS BrakeDisengaged table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event BrakeDisengaged EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_BrakeDisengaged"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS BrakeDisengaged does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event SpeedLimitReached EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitReached.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS SpeedLimitReached table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event SpeedLimitReached EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_SpeedLimitReached"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS SpeedLimitReached does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event AccelerationLimitReached EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitReached.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS AccelerationLimitReached table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event AccelerationLimitReached EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_AccelerationLimitReached"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS AccelerationLimitReached does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event SpeedLimitSubsided EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitSubsided.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS SpeedLimitSubsided table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event SpeedLimitSubsided EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_SpeedLimitSubsided"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS SpeedLimitSubsided does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event AccelerationLimitSubsided EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitSubsided.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS AccelerationLimitSubsided table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event AccelerationLimitSubsided EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_AccelerationLimitSubsided"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS AccelerationLimitSubsided does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event EchoResponse EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_EchoResponse.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS EchoResponse table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event EchoResponse EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_EchoResponse"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS EchoResponse does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event MotionModeChanged EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_MotionModeChanged.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS MotionModeChanged table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event MotionModeChanged EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_MotionModeChanged"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS MotionModeChanged does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event SubsystemError EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/domeLWS_logevent_SubsystemError.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeLWS SubsystemError table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify DomeLWS Event SubsystemError EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from domeLWS_logevent_SubsystemError"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeLWS SubsystemError does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

