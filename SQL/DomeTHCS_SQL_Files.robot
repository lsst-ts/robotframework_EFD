*** Settings ***
Documentation    This suite verify SQL table creation for the DomeTHCS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeTHCS
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

Verify DomeTHCS Telemetry status SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*status*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_status.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_status.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_status_items.sql

Verify DomeTHCS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_enable_items.sql

Verify DomeTHCS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_disable_items.sql

Verify DomeTHCS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_abort_items.sql

Verify DomeTHCS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_enterControl_items.sql

Verify DomeTHCS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_exitControl_items.sql

Verify DomeTHCS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_standby_items.sql

Verify DomeTHCS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_start_items.sql

Verify DomeTHCS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_stop_items.sql

Verify DomeTHCS Command Echo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*Echo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_Echo.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_Echo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_command_Echo_items.sql

Verify DomeTHCS Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_StateChanged_items.sql

Verify DomeTHCS Event MovementEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*MovementEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_MovementEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_MovementEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_MovementEnabled_items.sql

Verify DomeTHCS Event MovementPrevented SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*MovementPrevented*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_MovementPrevented.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_MovementPrevented.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_MovementPrevented_items.sql

Verify DomeTHCS Event EchoResponse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*EchoResponse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_EchoResponse.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_EchoResponse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_EchoResponse_items.sql

Verify DomeTHCS Event SubsystemError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeTHCS_*SubsystemError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_SubsystemError.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_SubsystemError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeTHCS_logevent_SubsystemError_items.sql

