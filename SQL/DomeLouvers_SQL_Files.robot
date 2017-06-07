*** Settings ***
Documentation    This suite verify SQL table creation for the DomeLouvers.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeLouvers
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

Verify DomeLouvers Telemetry status SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*status*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_status.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_status.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_status_items.sql

Verify DomeLouvers State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_enable_items.sql

Verify DomeLouvers State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_disable_items.sql

Verify DomeLouvers State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_abort_items.sql

Verify DomeLouvers State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_enterControl_items.sql

Verify DomeLouvers State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_exitControl_items.sql

Verify DomeLouvers State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_standby_items.sql

Verify DomeLouvers State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_start_items.sql

Verify DomeLouvers State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_stop_items.sql

Verify DomeLouvers Command SetPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*SetPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_SetPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_SetPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_SetPosition_items.sql

Verify DomeLouvers Command Echo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*Echo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_Echo.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_Echo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_command_Echo_items.sql

Verify DomeLouvers Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_StateChanged_items.sql

Verify DomeLouvers Event DriveEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*DriveEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveEnabled_items.sql

Verify DomeLouvers Event DriveDisabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*DriveDisabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveDisabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveDisabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveDisabled_items.sql

Verify DomeLouvers Event DriveReady SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*DriveReady*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveReady.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveReady.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveReady_items.sql

Verify DomeLouvers Event DriveOverTemp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*DriveOverTemp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveOverTemp.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveOverTemp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveOverTemp_items.sql

Verify DomeLouvers Event DriveFault SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*DriveFault*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveFault.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveFault.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_DriveFault_items.sql

Verify DomeLouvers Event MovementEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*MovementEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_MovementEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_MovementEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_MovementEnabled_items.sql

Verify DomeLouvers Event MovementPrevented SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*MovementPrevented*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_MovementPrevented.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_MovementPrevented.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_MovementPrevented_items.sql

Verify DomeLouvers Event EchoResponse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*EchoResponse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_EchoResponse.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_EchoResponse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_EchoResponse_items.sql

Verify DomeLouvers Event SubsystemError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLouvers_*SubsystemError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_SubsystemError.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_SubsystemError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLouvers_logevent_SubsystemError_items.sql

