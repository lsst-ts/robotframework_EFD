*** Settings ***
Documentation    This suite verifies SQL table creation for the EFD.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    EFD
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

Verify EFD Telemetry Summary SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Summary*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_Summary.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_Summary.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_Summary_items.sql

Verify EFD State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_enable_items.sql

Verify EFD State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_disable_items.sql

Verify EFD State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_abort_items.sql

Verify EFD State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_enterControl_items.sql

Verify EFD State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_exitControl_items.sql

Verify EFD State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_standby_items.sql

Verify EFD State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_start_items.sql

Verify EFD State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_command_stop_items.sql

Verify EFD Event LargeFileObjectAvailable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=efd_*LargeFileObjectAvailable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/efd_logevent_LargeFileObjectAvailable.sqldef
    File Should Exist    ${SALWorkDir}/sql/efd_logevent_LargeFileObjectAvailable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/efd_logevent_LargeFileObjectAvailable_items.sql

