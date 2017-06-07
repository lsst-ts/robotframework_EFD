*** Settings ***
Documentation    This suite verify SQL table creation for the Rotator.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Rotator
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

Verify Rotator Telemetry LimitSensors SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LimitSensors*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_LimitSensors.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_LimitSensors.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_LimitSensors_items.sql

Verify Rotator Telemetry Position SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Position*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_Position.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_Position.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_Position_items.sql

Verify Rotator Telemetry Electrical SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Electrical*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_Electrical.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_Electrical.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_Electrical_items.sql

Verify Rotator Telemetry TC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_TC.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_TC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_TC_items.sql

Verify Rotator State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_enable_items.sql

Verify Rotator State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_disable_items.sql

Verify Rotator State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_abort_items.sql

Verify Rotator State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_enterControl_items.sql

Verify Rotator State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_exitControl_items.sql

Verify Rotator State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_standby_items.sql

Verify Rotator State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_start_items.sql

Verify Rotator State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_stop_items.sql

Verify Rotator Command configureAcceleration SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*configureAcceleration*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_configureAcceleration.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_configureAcceleration.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_configureAcceleration_items.sql

Verify Rotator Command configureVelocity SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*configureVelocity*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_configureVelocity.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_configureVelocity.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_configureVelocity_items.sql

Verify Rotator Command move SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*move*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_move.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_move.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_move_items.sql

Verify Rotator Command track SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*track*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_track.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_track.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_track_items.sql

Verify Rotator Command test SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*test*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_command_test.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_command_test.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_command_test_items.sql

Verify Rotator Event error SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*error*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_error.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_error.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_error_items.sql

Verify Rotator Event interlock SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*interlock*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_interlock.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_interlock.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_interlock_items.sql

Verify Rotator Event limit SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*limit*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_limit.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_limit.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_limit_items.sql

Verify Rotator Event moveOK SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*moveOK*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_moveOK.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_moveOK.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_moveOK_items.sql

Verify Rotator Event tempError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*tempError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_tempError.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_tempError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_tempError_items.sql

Verify Rotator Event trackLost SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*trackLost*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_trackLost.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_trackLost.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_trackLost_items.sql

Verify Rotator Event tracking SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=rotator_*tracking*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_tracking.sqldef
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_tracking.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/rotator_logevent_tracking_items.sql

