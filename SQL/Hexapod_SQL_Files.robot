*** Settings ***
Documentation    This suite verifies SQL table creation for the Hexapod.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Hexapod
${timeout}    30s

*** Test Cases ***
Create SQL Session
    [Documentation]    Connect to the host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=SQL    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify Hexapod Telemetry Actuators SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Actuators*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_Actuators.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_Actuators.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_Actuators_items.sql

Verify Hexapod Telemetry Application SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Application*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_Application.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_Application.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_Application_items.sql

Verify Hexapod Telemetry Electrical SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Electrical*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_Electrical.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_Electrical.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_Electrical_items.sql

Verify Hexapod State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_enable_items.sql

Verify Hexapod State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_disable_items.sql

Verify Hexapod State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_abort_items.sql

Verify Hexapod State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_enterControl_items.sql

Verify Hexapod State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_exitControl_items.sql

Verify Hexapod State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_standby_items.sql

Verify Hexapod State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_start_items.sql

Verify Hexapod State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_stop_items.sql

Verify Hexapod Command configureAcceleration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*configureAcceleration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureAcceleration.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureAcceleration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureAcceleration_items.sql

Verify Hexapod Command configureLimits SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*configureLimits*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureLimits.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureLimits.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureLimits_items.sql

Verify Hexapod Command configureElevationRawLUT SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*configureElevationRawLUT*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureElevationRawLUT.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureElevationRawLUT.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureElevationRawLUT_items.sql

Verify Hexapod Command move SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*move*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_move.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_move.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_move_items.sql

Verify Hexapod Command positionSet SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*positionSet*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_positionSet.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_positionSet.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_positionSet_items.sql

Verify Hexapod Command rawPositionSet SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*rawPositionSet*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_rawPositionSet.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_rawPositionSet.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_rawPositionSet_items.sql

Verify Hexapod Command configureVelocity SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*configureVelocity*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureVelocity.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureVelocity.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureVelocity_items.sql

Verify Hexapod Command offset SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*offset*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_offset.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_offset.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_offset_items.sql

Verify Hexapod Command pivot SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*pivot*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_pivot.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_pivot.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_pivot_items.sql

Verify Hexapod Command clearError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*clearError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_clearError.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_clearError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_clearError_items.sql

Verify Hexapod Command test SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*test*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_test.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_test.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_test_items.sql

Verify Hexapod Command configureAzimuthRawLUT SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*configureAzimuthRawLUT*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureAzimuthRawLUT.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureAzimuthRawLUT.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureAzimuthRawLUT_items.sql

Verify Hexapod Command configureTemperatureRawLUT SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*configureTemperatureRawLUT*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureTemperatureRawLUT.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureTemperatureRawLUT.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_configureTemperatureRawLUT_items.sql

Verify Hexapod Command moveLUT SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*moveLUT*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_moveLUT.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_moveLUT.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_command_moveLUT_items.sql

Verify Hexapod Event interlock SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*interlock*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_interlock.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_interlock.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_interlock_items.sql

Verify Hexapod Event inPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*inPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_inPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_inPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_inPosition_items.sql

Verify Hexapod Event deviceError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=hexapod_*deviceError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_deviceError.sqldef
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_deviceError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/hexapod_logevent_deviceError_items.sql

