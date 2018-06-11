*** Settings ***
Documentation    This suite verifies SQL table creation for the AtScheduler.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    AtScheduler
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

Verify AtScheduler Telemetry Heartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Heartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_Heartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_Heartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_Heartbeat_items.sql

Verify AtScheduler State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_enable_items.sql

Verify AtScheduler State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_disable_items.sql

Verify AtScheduler State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_abort_items.sql

Verify AtScheduler State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_enterControl_items.sql

Verify AtScheduler State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_exitControl_items.sql

Verify AtScheduler State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_standby_items.sql

Verify AtScheduler State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_start_items.sql

Verify AtScheduler State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_command_stop_items.sql

Verify AtScheduler Event target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=atScheduler_*target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/atScheduler_logevent_target.sqldef
    File Should Exist    ${SALWorkDir}/sql/atScheduler_logevent_target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/atScheduler_logevent_target_items.sql

