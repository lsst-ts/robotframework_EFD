*** Settings ***
Documentation    This suite verify SQL table creation for the Hexapod.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Hexapod
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

Verify Hexapod Telemetry Metrology EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Metrology.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Metrology table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Telemetry Metrology EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Metrology"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Metrology does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Telemetry LimitSensors EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_LimitSensors.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the LimitSensors table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Telemetry LimitSensors EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_LimitSensors"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table LimitSensors does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Telemetry Electrical EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Electrical.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Electrical table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Telemetry Electrical EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Electrical"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Electrical does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Telemetry Application EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Application.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Application table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Telemetry Application EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Application"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Application does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Telemetry Actuators EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Actuators.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the Actuators table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Telemetry Actuators EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Actuators"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table Actuators does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Telemetry TC EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_TC.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the TC table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Telemetry TC EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_TC"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table TC does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_enable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command enable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_enable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enable does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_disable.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the disable table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command disable EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_disable"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table disable does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_abort.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the abort table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command abort EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_abort"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table abort does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_enterControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the enterControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_enterControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table enterControl does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_exitControl.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the exitControl table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_exitControl"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table exitControl does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_standby.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the standby table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command standby EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_standby"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table standby does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command start EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_start.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the start table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command start EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_start"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table start does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_stop.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the stop table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod State Command stop EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_stop"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table stop does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command configureAcceleration EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureAcceleration.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configureAcceleration table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command configureAcceleration EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureAcceleration"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configureAcceleration does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command configureLimits EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureLimits.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configureLimits table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command configureLimits EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureLimits"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configureLimits does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command configureLut EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureLut.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configureLut table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command configureLut EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureLut"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configureLut does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command move EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_move.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the move table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command move EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_move"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table move does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command configureVelocity EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureVelocity.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the configureVelocity table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command configureVelocity EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureVelocity"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table configureVelocity does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command offset EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_offset.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the offset table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command offset EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_offset"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table offset does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command pivot EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_pivot.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the pivot table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command pivot EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_pivot"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table pivot does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Command test EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_test.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the test table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Command test EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_test"    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table test does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event error EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_error.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the error table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event error EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_error"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table error does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event interlock EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_interlock.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the interlock table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event interlock EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_interlock"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table interlock does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event limit EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_limit.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the limit table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event limit EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_limit"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table limit does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event slewOK EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_slewOK.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the slewOK table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event slewOK EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_slewOK"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table slewOK does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event tempError EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_tempError.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the tempError table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event tempError EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_tempError"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table tempError does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event trackLost EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_trackLost.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the trackLost table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event trackLost EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_trackLost"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table trackLost does not exist
    Should Contain    ${output}    Empty set

Verify Hexapod Event tracking EFD table create
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_tracking.sqldef    return_rc=True
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the tracking table
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Hexapod Event tracking EFD table
    [Tags]    sql    
    ${output}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_tracking"    return_rc=True
    Log    ${output}
    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table tracking does not exist
    Should Contain    ${output}    Empty set

