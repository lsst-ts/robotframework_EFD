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
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Metrology.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod Metrology table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Metrology EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Metrology"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod Metrology does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry LimitSensors EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_LimitSensors.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod LimitSensors table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry LimitSensors EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_LimitSensors"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod LimitSensors does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Electrical EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Electrical.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod Electrical table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Electrical EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Electrical"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod Electrical does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Application EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Application.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod Application table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Application EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Application"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod Application does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Actuators EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_Actuators.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod Actuators table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry Actuators EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_Actuators"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod Actuators does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry TC EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_TC.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod TC table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Telemetry TC EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_TC"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod TC does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command enable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_enable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod enable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command enable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_enable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod enable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command disable EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_disable.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod disable table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command disable EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_disable"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod disable does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command abort EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_abort.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod abort table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command abort EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_abort"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod abort does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command enterControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_enterControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod enterControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command enterControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_enterControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod enterControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command exitControl EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_exitControl.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod exitControl table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command exitControl EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_exitControl"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod exitControl does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command standby EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_standby.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod standby table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command standby EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_standby"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod standby does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command start EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_start.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod start table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command start EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_start"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod start does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command stop EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_stop.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod stop table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod State Command stop EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_stop"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod stop does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureAcceleration EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureAcceleration.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod configureAcceleration table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureAcceleration EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureAcceleration"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod configureAcceleration does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureLimits EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureLimits.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod configureLimits table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureLimits EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureLimits"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod configureLimits does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureLut EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureLut.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod configureLut table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureLut EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureLut"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod configureLut does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command move EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_move.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod move table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command move EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_move"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod move does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureVelocity EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_configureVelocity.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod configureVelocity table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command configureVelocity EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_configureVelocity"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod configureVelocity does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command offset EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_offset.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod offset table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command offset EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_offset"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod offset does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command pivot EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_pivot.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod pivot table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command pivot EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_pivot"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod pivot does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command test EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_command_test.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod test table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Command test EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_command_test"    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod test does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event error EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_error.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod error table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event error EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_error"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod error does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event interlock EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_interlock.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod interlock table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event interlock EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_interlock"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod interlock does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event limit EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_limit.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod limit table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event limit EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_limit"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod limit does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event slewOK EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_slewOK.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod slewOK table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event slewOK EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_slewOK"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod slewOK does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event tempError EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_tempError.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod tempError table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event tempError EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_tempError"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod tempError does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event trackLost EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_trackLost.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod trackLost table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event trackLost EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_trackLost"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod trackLost does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event tracking EFD table create
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD < ${SALWorkDir}/sql/hexapod_logevent_tracking.sqldef    return_stderr=True    return_rc=True
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Failed to create the hexapod tracking table
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${output}    ${EMPTY}
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

Verify Hexapod Event tracking EFD table
    [Tags]    sql    
    ${output}    ${error}    ${rc}=    Execute Command    mysql --user=${EFDUser} --password=${EFDPass} -h ${EFDHost} -D EFD -v -v -e "select * from hexapod_logevent_tracking"    return_stderr=True    return_rc=True
    Log    ${output}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${rc}    0    values=False    msg=Table hexapod tracking does not exist
    Run Keyword And Continue On Failure    Should Contain    ${output}    Empty set
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${error}    ${EMPTY}

