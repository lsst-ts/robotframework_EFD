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
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Az table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Az EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Az does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Alt EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Alt.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Alt table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Alt EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Alt"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Alt does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Az_CW EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az_CW.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Az_CW table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Az_CW EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az_CW"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Az_CW does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Az_OSS EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az_OSS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Az_OSS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Az_OSS EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az_OSS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Az_OSS does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Alt_OSS EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Alt_OSS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Alt_OSS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Alt_OSS EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Alt_OSS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Alt_OSS does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Az_TC EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Az_TC.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Az_TC table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Az_TC EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Az_TC"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Az_TC does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Alt_TC EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Alt_TC.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Alt_TC table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Alt_TC EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Alt_TC"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Alt_TC does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Bal EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Bal.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Bal table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Bal EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Bal"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Bal does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry MC EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_MC.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MC table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry MC EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_MC"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MC does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Cam_CW EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Cam_CW.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Cam_CW table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Cam_CW EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Cam_CW"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Cam_CW does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry Cab_TC EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_Cab_TC.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Cab_TC table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry Cab_TC EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_Cab_TC"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Cab_TC does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry DP_1 EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_DP_1.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DP_1 table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry DP_1 EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_DP_1"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DP_1 does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry DP_2 EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_DP_2.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DP_2 table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry DP_2 EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_DP_2"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DP_2 does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Telemetry MotionParameters EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_MotionParameters.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the MotionParameters table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Telemetry MotionParameters EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_MotionParameters"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table MotionParameters does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command enable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command enable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command disable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command disable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command abort EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command abort EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command enterControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command enterControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command exitControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command exitControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command standby EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command standby EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command start EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command start EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify MTMount State Command stop EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount State Command stop EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command closeMirrorCover EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_closeMirrorCover.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the closeMirrorCover table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command closeMirrorCover EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_closeMirrorCover"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table closeMirrorCover does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command configure EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_configure.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configure table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command configure EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_configure"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configure does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command disableCamWrap EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_disableCamWrap.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disableCamWrap table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command disableCamWrap EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_disableCamWrap"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disableCamWrap does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command enableCamWrap EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_enableCamWrap.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enableCamWrap table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command enableCamWrap EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_enableCamWrap"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enableCamWrap does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command moveToTarget EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_moveToTarget.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the moveToTarget table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command moveToTarget EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_moveToTarget"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table moveToTarget does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command openMirrorCover EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_openMirrorCover.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the openMirrorCover table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command openMirrorCover EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_openMirrorCover"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table openMirrorCover does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command trackTarget EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_trackTarget.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the trackTarget table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command trackTarget EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_trackTarget"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table trackTarget does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Command clearerror EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_command_clearerror.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the clearerror table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Command clearerror EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_command_clearerror"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table clearerror does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Event mountState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the mountState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Event mountState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table mountState does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Event mountWarning EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountWarning.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the mountWarning table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Event mountWarning EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountWarning"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table mountWarning does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Event mountError EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the mountError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Event mountError EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table mountError does not exist
    Should Contain    ${output}    Empty set

Verify MTMount Event mountInPosition EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/MTMount_logevent_mountInPosition.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the mountInPosition table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify MTMount Event mountInPosition EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from MTMount_logevent_mountInPosition"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table mountInPosition does not exist
    Should Contain    ${output}    Empty set

