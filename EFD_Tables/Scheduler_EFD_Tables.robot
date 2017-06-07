*** Settings ***
Documentation    This suite verify SQL table creation for the Scheduler.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Scheduler
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

Verify Scheduler Telemetry timeHandler EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_timeHandler.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the timeHandler table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry timeHandler EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_timeHandler"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table timeHandler does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry cloud EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_cloud.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the cloud table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry cloud EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_cloud"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table cloud does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry seeing EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_seeing.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the seeing table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry seeing EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_seeing"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table seeing does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry filterSwap EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_filterSwap.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the filterSwap table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry filterSwap EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_filterSwap"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table filterSwap does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry schedulerConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_schedulerConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the schedulerConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry schedulerConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_schedulerConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table schedulerConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry driverConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_driverConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the driverConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry driverConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_driverConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table driverConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry field EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_field.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the field table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry field EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_field"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table field does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry obsSiteConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_obsSiteConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the obsSiteConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry obsSiteConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_obsSiteConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table obsSiteConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry telescopeConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_telescopeConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the telescopeConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry telescopeConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_telescopeConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table telescopeConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry rotatorConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_rotatorConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rotatorConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry rotatorConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_rotatorConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rotatorConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry domeConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_domeConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the domeConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry domeConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_domeConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table domeConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry cameraConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_cameraConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the cameraConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry cameraConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_cameraConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table cameraConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry slewConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_slewConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the slewConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry slewConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_slewConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table slewConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry opticsLoopCorrConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_opticsLoopCorrConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the opticsLoopCorrConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry opticsLoopCorrConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_opticsLoopCorrConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table opticsLoopCorrConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry parkConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_parkConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the parkConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry parkConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_parkConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table parkConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry generalPropConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_generalPropConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the generalPropConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry generalPropConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_generalPropConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table generalPropConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry sequencePropConfig EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_sequencePropConfig.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the sequencePropConfig table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry sequencePropConfig EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_sequencePropConfig"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table sequencePropConfig does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry blockPusher EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_blockPusher.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the blockPusher table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry blockPusher EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_blockPusher"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table blockPusher does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry observatoryState EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_observatoryState.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the observatoryState table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry observatoryState EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_observatoryState"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table observatoryState does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry target EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_target.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the target table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry target EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_target"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table target does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry observation EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_observation.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the observation table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry observation EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_observation"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table observation does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry interestedProposal EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_interestedProposal.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the interestedProposal table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry interestedProposal EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_interestedProposal"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table interestedProposal does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry parameters EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_parameters.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the parameters table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry parameters EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_parameters"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table parameters does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry Application EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_Application.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Application table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry Application EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_Application"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Application does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry program EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_program.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the program table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry program EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_program"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table program does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry progress EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_progress.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the progress table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry progress EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_progress"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table progress does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry rankingData EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_rankingData.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the rankingData table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry rankingData EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_rankingData"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table rankingData does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry econstraints EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_econstraints.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the econstraints table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry econstraints EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_econstraints"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table econstraints does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler Telemetry iconstraints EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_iconstraints.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the iconstraints table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler Telemetry iconstraints EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_iconstraints"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table iconstraints does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command enable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command enable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command disable EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command disable EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command abort EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command abort EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command enterControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command enterControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command exitControl EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command exitControl EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command standby EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command standby EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command start EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command start EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify Scheduler State Command stop EFD table create
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/scheduler_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Scheduler State Command stop EFD table
    [Tags]    sql
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from scheduler_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

