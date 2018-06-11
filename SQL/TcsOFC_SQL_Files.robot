*** Settings ***
Documentation    This suite verifies SQL table creation for the TcsOFC.
Force Tags    TSS-2625
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    TcsOFC
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

Verify TcsOFC Telemetry DegreeOfFreedom SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*DegreeOfFreedom*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_DegreeOfFreedom.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_DegreeOfFreedom.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_DegreeOfFreedom_items.sql

Verify TcsOFC State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_enable_items.sql

Verify TcsOFC State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_disable_items.sql

Verify TcsOFC State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_abort_items.sql

Verify TcsOFC State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_enterControl_items.sql

Verify TcsOFC State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_exitControl_items.sql

Verify TcsOFC State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_standby_items.sql

Verify TcsOFC State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_start_items.sql

Verify TcsOFC State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_stop_items.sql

Verify TcsOFC Command ApplyForces SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*ApplyForces*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_ApplyForces.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_ApplyForces.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_command_ApplyForces_items.sql

Verify TcsOFC Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_logevent_ErrorCode_items.sql

Verify TcsOFC Event NoEnoughZernikeTerm SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsOfc_*NoEnoughZernikeTerm*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_logevent_NoEnoughZernikeTerm.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_logevent_NoEnoughZernikeTerm.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsOfc_logevent_NoEnoughZernikeTerm_items.sql

