*** Settings ***
Documentation    This suite verify SQL table creation for the MTMount.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    MTMount
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

Verify MTMount Telemetry Az EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Az table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Az does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Alt EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Alt.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Alt table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Alt EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Alt"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Alt does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az_CW EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az_CW.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Az_CW table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az_CW EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az_CW"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Az_CW does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az_OSS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az_OSS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Az_OSS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az_OSS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az_OSS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Az_OSS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Alt_OSS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Alt_OSS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Alt_OSS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Alt_OSS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Alt_OSS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Alt_OSS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az_TC EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az_TC.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Az_TC table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Az_TC EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az_TC"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Az_TC does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Alt_TC EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Alt_TC.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Alt_TC table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Alt_TC EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Alt_TC"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Alt_TC does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Bal EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Bal.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Bal table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Bal EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Bal"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Bal does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry MC EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_MC.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount MC table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry MC EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_MC"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount MC does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Cam_CW EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Cam_CW.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Cam_CW table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Cam_CW EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Cam_CW"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Cam_CW does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Cab_TC EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Cab_TC.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount Cab_TC table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry Cab_TC EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Cab_TC"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount Cab_TC does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry DP_1 EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_DP_1.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount DP_1 table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry DP_1 EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_DP_1"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount DP_1 does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry DP_2 EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_DP_2.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount DP_2 table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry DP_2 EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_DP_2"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount DP_2 does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry MotionParameters EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_MotionParameters.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount MotionParameters table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Telemetry MotionParameters EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_MotionParameters"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount MotionParameters does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_enable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount enable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command enable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_enable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount enable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_disable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount disable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command disable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_disable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount disable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_abort.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount abort table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command abort EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_abort"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount abort does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_enterControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount enterControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_enterControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount enterControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_exitControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount exitControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_exitControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount exitControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_standby.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount standby table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command standby EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_standby"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount standby does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command start EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_start.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount start table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command start EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_start"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount start does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_stop.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount stop table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount State Command stop EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_stop"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount stop does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command closeMirrorCover EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_closeMirrorCover.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount closeMirrorCover table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command closeMirrorCover EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_closeMirrorCover"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount closeMirrorCover does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command configure EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_configure.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount configure table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command configure EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_configure"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount configure does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command disableCamWrap EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_disableCamWrap.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount disableCamWrap table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command disableCamWrap EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_disableCamWrap"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount disableCamWrap does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command enableCamWrap EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_enableCamWrap.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount enableCamWrap table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command enableCamWrap EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_enableCamWrap"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount enableCamWrap does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command moveToTarget EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_moveToTarget.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount moveToTarget table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command moveToTarget EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_moveToTarget"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount moveToTarget does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command openMirrorCover EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_openMirrorCover.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount openMirrorCover table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command openMirrorCover EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_openMirrorCover"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount openMirrorCover does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command trackTarget EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_trackTarget.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount trackTarget table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command trackTarget EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_trackTarget"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount trackTarget does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command clearerror EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_clearerror.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount clearerror table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Command clearerror EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_clearerror"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount clearerror does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountState EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountState.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount mountState table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountState EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountState"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount mountState does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountWarning EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountWarning.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount mountWarning table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountWarning EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountWarning"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount mountWarning does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountError EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountError.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount mountError table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountError EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountError"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount mountError does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountInPosition EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountInPosition.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MTMount mountInPosition table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify MTMount Event mountInPosition EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountInPosition"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MTMount mountInPosition does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

