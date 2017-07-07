*** Settings ***
Documentation    This suite verify SQL table creation for the Camera.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Camera
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

Verify Camera Telemetry Cold EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Cold.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Cold table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Cold EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Cold"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Cold does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry SAS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_SAS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera SAS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry SAS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_SAS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera SAS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry SDS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_SDS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera SDS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry SDS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_SDS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera SDS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Filter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Filter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Filter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Filter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Filter"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Filter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Prot EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Prot.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Prot table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Prot EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Prot"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Prot does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry CCS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_CCS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera CCS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry CCS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_CCS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera CCS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Purge EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Purge.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Purge table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Purge EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Purge"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Purge does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry WDS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_WDS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera WDS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry WDS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_WDS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera WDS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Cluster_Encoder EFD table create
    [Tags]    sql    skipped
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Cluster_Encoder.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Cluster_Encoder table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Cluster_Encoder EFD table
    [Tags]    sql    skipped
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Cluster_Encoder"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Cluster_Encoder does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Shutter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Shutter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Shutter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Shutter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Shutter"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Shutter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry GDS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_GDS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera GDS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry GDS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_GDS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera GDS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry GAS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_GAS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera GAS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry GAS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_GAS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera GAS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry PCMS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_PCMS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera PCMS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry PCMS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_PCMS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera PCMS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Cryo EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_Cryo.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera Cryo table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry Cryo EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_Cryo"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera Cryo does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry WAS EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_WAS.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera WAS table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Telemetry WAS EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_WAS"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera WAS does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_enable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera enable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command enable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_enable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera enable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_disable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera disable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command disable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_disable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera disable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_abort.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera abort table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command abort EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_abort"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera abort does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_enterControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera enterControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_enterControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera enterControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_exitControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera exitControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_exitControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera exitControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_standby.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera standby table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command standby EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_standby"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera standby does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command start EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_start.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera start table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command start EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_start"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera start does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_stop.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera stop table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera State Command stop EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_stop"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera stop does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command configure EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_configure.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera configure table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command configure EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_configure"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera configure does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command initGuiders EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_initGuiders.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera initGuiders table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command initGuiders EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_initGuiders"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera initGuiders does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command initImage EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_initImage.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera initImage table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command initImage EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_initImage"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera initImage does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command setFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_setFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera setFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command setFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_setFilter"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera setFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command takeImages EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_command_takeImages.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera takeImages table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Command takeImages EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_command_takeImages"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera takeImages does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event ccsConfigured EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_ccsConfigured.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera ccsConfigured table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event ccsConfigured EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_ccsConfigured"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera ccsConfigured does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endInitializeGuider EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endInitializeGuider.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endInitializeGuider table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endInitializeGuider EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endInitializeGuider"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endInitializeGuider does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endInitializeImage EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endInitializeImage.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endInitializeImage table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endInitializeImage EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endInitializeImage"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endInitializeImage does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endLoadFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endLoadFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endLoadFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endLoadFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endLoadFilter"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endLoadFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endReadout EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endReadout.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endReadout table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endReadout EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endReadout"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endReadout does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endRotateCarousel EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endRotateCarousel.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endRotateCarousel table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endRotateCarousel EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endRotateCarousel"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endRotateCarousel does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endSetFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endSetFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endSetFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endSetFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endSetFilter"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endSetFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endShutterClose EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endShutterClose.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endShutterClose table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endShutterClose EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endShutterClose"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endShutterClose does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endShutterOpen EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endShutterOpen.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endShutterOpen table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endShutterOpen EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endShutterOpen"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endShutterOpen does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endTakeImage EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endTakeImage.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endTakeImage table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endTakeImage EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endTakeImage"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endTakeImage does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endUnloadFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_endUnloadFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera endUnloadFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event endUnloadFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_endUnloadFilter"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera endUnloadFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event notReadyToTakeImage EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_notReadyToTakeImage.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera notReadyToTakeImage table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event notReadyToTakeImage EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_notReadyToTakeImage"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera notReadyToTakeImage does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event prepareToTakeImage EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_prepareToTakeImage.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera prepareToTakeImage table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event prepareToTakeImage EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_prepareToTakeImage"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera prepareToTakeImage does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event readyToTakeImage EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_readyToTakeImage.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera readyToTakeImage table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event readyToTakeImage EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_readyToTakeImage"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera readyToTakeImage does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startIntegration EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startIntegration.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startIntegration table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startIntegration EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startIntegration"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startIntegration does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startLoadFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startLoadFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startLoadFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startLoadFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startLoadFilter"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startLoadFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startReadout EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startReadout.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startReadout table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startReadout EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startReadout"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startReadout does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startRotateCarousel EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startRotateCarousel.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startRotateCarousel table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startRotateCarousel EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startRotateCarousel"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startRotateCarousel does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startSetFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startSetFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startSetFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startSetFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startSetFilter"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startSetFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startShutterClose EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startShutterClose.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startShutterClose table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startShutterClose EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startShutterClose"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startShutterClose does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startShutterOpen EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startShutterOpen.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startShutterOpen table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startShutterOpen EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startShutterOpen"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startShutterOpen does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startUnloadFilter EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/camera_logevent_startUnloadFilter.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the camera startUnloadFilter table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Camera Event startUnloadFilter EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from camera_logevent_startUnloadFilter"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table camera startUnloadFilter does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

