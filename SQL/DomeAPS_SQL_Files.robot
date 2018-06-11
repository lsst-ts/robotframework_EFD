*** Settings ***
Documentation    This suite verifies SQL table creation for the DomeAPS.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeAPS
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

Verify DomeAPS Telemetry status SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*status*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_status.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_status.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_status_items.sql

Verify DomeAPS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_enable_items.sql

Verify DomeAPS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_disable_items.sql

Verify DomeAPS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_abort_items.sql

Verify DomeAPS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_enterControl_items.sql

Verify DomeAPS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_exitControl_items.sql

Verify DomeAPS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_standby_items.sql

Verify DomeAPS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_start_items.sql

Verify DomeAPS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_stop_items.sql

Verify DomeAPS Command Close SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*Close*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Close.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Close.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Close_items.sql

Verify DomeAPS Command Open SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*Open*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Open.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Open.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Open_items.sql

Verify DomeAPS Command Echo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*Echo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Echo.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Echo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_command_Echo_items.sql

Verify DomeAPS Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_StateChanged_items.sql

Verify DomeAPS Event DriveEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*DriveEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveEnabled_items.sql

Verify DomeAPS Event DriveDisabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*DriveDisabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveDisabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveDisabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveDisabled_items.sql

Verify DomeAPS Event DriveReady SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*DriveReady*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveReady.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveReady.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveReady_items.sql

Verify DomeAPS Event DriveOverTemp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*DriveOverTemp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveOverTemp.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveOverTemp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveOverTemp_items.sql

Verify DomeAPS Event DriveFault SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*DriveFault*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveFault.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveFault.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_DriveFault_items.sql

Verify DomeAPS Event MovementEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*MovementEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_MovementEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_MovementEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_MovementEnabled_items.sql

Verify DomeAPS Event MovementPrevented SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*MovementPrevented*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_MovementPrevented.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_MovementPrevented.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_MovementPrevented_items.sql

Verify DomeAPS Event LockingPinEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*LockingPinEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinEngaged_items.sql

Verify DomeAPS Event LockingPinDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*LockingPinDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinDisengaged_items.sql

Verify DomeAPS Event LockingPinHomed SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*LockingPinHomed*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinHomed.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinHomed.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinHomed_items.sql

Verify DomeAPS Event LockingPinFloating SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*LockingPinFloating*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinFloating.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinFloating.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_LockingPinFloating_items.sql

Verify DomeAPS Event CentralLockingPinEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*CentralLockingPinEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinEngaged_items.sql

Verify DomeAPS Event CentralLockingPinDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*CentralLockingPinDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinDisengaged_items.sql

Verify DomeAPS Event CentralLockingPinHomed SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*CentralLockingPinHomed*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinHomed.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinHomed.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinHomed_items.sql

Verify DomeAPS Event CentralLockingPinFloating SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*CentralLockingPinFloating*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinFloating.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinFloating.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_CentralLockingPinFloating_items.sql

Verify DomeAPS Event BrakeEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*BrakeEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_BrakeEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_BrakeEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_BrakeEngaged_items.sql

Verify DomeAPS Event BrakeDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*BrakeDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_BrakeDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_BrakeDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_BrakeDisengaged_items.sql

Verify DomeAPS Event EchoResponse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*EchoResponse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_EchoResponse.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_EchoResponse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_EchoResponse_items.sql

Verify DomeAPS Event APSSubsystemError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeAPS_*APSSubsystemError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_APSSubsystemError.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_APSSubsystemError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeAPS_logevent_APSSubsystemError_items.sql

