*** Settings ***
Documentation    This suite verify SQL table creation for the TCS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    TCS
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

Verify TCS Telemetry kernel_PointingModel EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_PointingModel.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_PointingModel table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_PointingModel EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_PointingModel"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_PointingModel does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry AOCS EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_AOCS.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the AOCS table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry AOCS EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_AOCS"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table AOCS does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_TimeKeeper EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_TimeKeeper.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_TimeKeeper table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_TimeKeeper EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_TimeKeeper"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_TimeKeeper does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_Site EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_Site.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_Site table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_Site EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_Site"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_Site does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_Target EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_Target.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_Target table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_Target EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_Target"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_Target does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_PointingControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_PointingControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_PointingControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_PointingControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_PointingControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_PointingControl does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_TrackRefSys EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_TrackRefSys.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_TrackRefSys table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_TrackRefSys EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_TrackRefSys"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_TrackRefSys does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry ZEMAX EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_ZEMAX.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the ZEMAX table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry ZEMAX EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_ZEMAX"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table ZEMAX does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_PointingLog EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_PointingLog.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_PointingLog table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_PointingLog EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_PointingLog"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_PointingLog does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_DawdleFilter EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_DawdleFilter.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_DawdleFilter table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_DawdleFilter EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_DawdleFilter"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_DawdleFilter does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_OpticsVt EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_OpticsVt.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_OpticsVt table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_OpticsVt EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_OpticsVt"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_OpticsVt does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry WEP EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_WEP.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the WEP table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry WEP EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_WEP"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table WEP does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_TrackingTarget EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_TrackingTarget.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_TrackingTarget table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_TrackingTarget EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_TrackingTarget"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_TrackingTarget does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry kernel_FK5Target EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_kernel_FK5Target.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the kernel_FK5Target table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry kernel_FK5Target EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_kernel_FK5Target"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table kernel_FK5Target does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry LoopTime_ms EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_LoopTime_ms.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LoopTime_ms table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry LoopTime_ms EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_LoopTime_ms"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LoopTime_ms does not exist
    Should Contain    ${output}    Empty set

Verify TCS Telemetry Timestamp EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_Timestamp.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Timestamp table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Telemetry Timestamp EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_Timestamp"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Timestamp does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command enable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command enable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command disable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command disable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command abort EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command abort EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command enterControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command enterControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command exitControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command exitControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command standby EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command standby EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command start EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command start EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify TCS State Command stop EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS State Command stop EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify TCS Command wfpCalculate EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_wfpCalculate.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the wfpCalculate table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Command wfpCalculate EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_wfpCalculate"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table wfpCalculate does not exist
    Should Contain    ${output}    Empty set

Verify TCS Command wfpSimulate EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_wfpSimulate.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the wfpSimulate table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Command wfpSimulate EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_wfpSimulate"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table wfpSimulate does not exist
    Should Contain    ${output}    Empty set

Verify TCS Command injectError EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_command_injectError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the injectError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Command injectError EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_command_injectError"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table injectError does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event wfpDataReady EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_wfpDataReady.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the wfpDataReady table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event wfpDataReady EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_wfpDataReady"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table wfpDataReady does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event zemaxError EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_zemaxError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the zemaxError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event zemaxError EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_zemaxError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table zemaxError does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event InternalCommand EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_InternalCommand.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the InternalCommand table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event InternalCommand EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_InternalCommand"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table InternalCommand does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event DetailedState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_DetailedState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the DetailedState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event DetailedState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_DetailedState"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table DetailedState does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event Heartbeat EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_Heartbeat.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Heartbeat table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event Heartbeat EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_Heartbeat"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Heartbeat does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event LoopTimeOutOfRange EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_LoopTimeOutOfRange.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LoopTimeOutOfRange table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event LoopTimeOutOfRange EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_LoopTimeOutOfRange"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LoopTimeOutOfRange does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event RejectedCommand EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_RejectedCommand.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the RejectedCommand table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event RejectedCommand EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_RejectedCommand"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table RejectedCommand does not exist
    Should Contain    ${output}    Empty set

Verify TCS Event HeartbeatIn EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/tcs_logevent_HeartbeatIn.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the HeartbeatIn table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify TCS Event HeartbeatIn EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from tcs_logevent_HeartbeatIn"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table HeartbeatIn does not exist
    Should Contain    ${output}    Empty set

