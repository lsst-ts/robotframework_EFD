*** Settings ***
Documentation    This suite verifies SQL table creation for the DomeLWS.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeLWS
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

Verify DomeLWS Telemetry status SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*status*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_status.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_status.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_status_items.sql

Verify DomeLWS State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_enable_items.sql

Verify DomeLWS State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_disable_items.sql

Verify DomeLWS State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_abort_items.sql

Verify DomeLWS State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_enterControl_items.sql

Verify DomeLWS State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_exitControl_items.sql

Verify DomeLWS State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_standby_items.sql

Verify DomeLWS State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_start_items.sql

Verify DomeLWS State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_stop_items.sql

Verify DomeLWS Command CrawlLWS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*CrawlLWS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_CrawlLWS.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_CrawlLWS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_CrawlLWS_items.sql

Verify DomeLWS Command MoveLWS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*MoveLWS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_MoveLWS.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_MoveLWS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_MoveLWS_items.sql

Verify DomeLWS Command VelocityMoveLWS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*VelocityMoveLWS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_VelocityMoveLWS.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_VelocityMoveLWS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_VelocityMoveLWS_items.sql

Verify DomeLWS Command EchoLWS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*EchoLWS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_EchoLWS.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_EchoLWS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_command_EchoLWS_items.sql

Verify DomeLWS Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_StateChanged_items.sql

Verify DomeLWS Event DriveEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*DriveEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveEnabled_items.sql

Verify DomeLWS Event DriveDisabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*DriveDisabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveDisabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveDisabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveDisabled_items.sql

Verify DomeLWS Event DriveReady SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*DriveReady*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveReady.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveReady.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveReady_items.sql

Verify DomeLWS Event DriveOverTemp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*DriveOverTemp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveOverTemp.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveOverTemp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveOverTemp_items.sql

Verify DomeLWS Event DriveFault SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*DriveFault*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveFault.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveFault.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_DriveFault_items.sql

Verify DomeLWS Event MovementEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*MovementEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MovementEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MovementEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MovementEnabled_items.sql

Verify DomeLWS Event MovementPrevented SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*MovementPrevented*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MovementPrevented.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MovementPrevented.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MovementPrevented_items.sql

Verify DomeLWS Event LockingPinEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*LockingPinEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinEngaged_items.sql

Verify DomeLWS Event LockingPinDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*LockingPinDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinDisengaged_items.sql

Verify DomeLWS Event LockingPinHomed SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*LockingPinHomed*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinHomed.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinHomed.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinHomed_items.sql

Verify DomeLWS Event LockingPinFloating SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*LockingPinFloating*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinFloating.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinFloating.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_LockingPinFloating_items.sql

Verify DomeLWS Event BrakeEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*BrakeEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_BrakeEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_BrakeEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_BrakeEngaged_items.sql

Verify DomeLWS Event BrakeDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*BrakeDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_BrakeDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_BrakeDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_BrakeDisengaged_items.sql

Verify DomeLWS Event SpeedLimitReached SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*SpeedLimitReached*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitReached.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitReached.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitReached_items.sql

Verify DomeLWS Event AccelerationLimitReached SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*AccelerationLimitReached*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitReached.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitReached.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitReached_items.sql

Verify DomeLWS Event SpeedLimitSubsided SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*SpeedLimitSubsided*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitSubsided.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitSubsided.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SpeedLimitSubsided_items.sql

Verify DomeLWS Event AccelerationLimitSubsided SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*AccelerationLimitSubsided*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitSubsided.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitSubsided.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_AccelerationLimitSubsided_items.sql

Verify DomeLWS Event EchoResponse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*EchoResponse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_EchoResponse.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_EchoResponse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_EchoResponse_items.sql

Verify DomeLWS Event MotionModeChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*MotionModeChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MotionModeChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MotionModeChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_MotionModeChanged_items.sql

Verify DomeLWS Event SubsystemError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeLWS_*SubsystemError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SubsystemError.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SubsystemError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeLWS_logevent_SubsystemError_items.sql

