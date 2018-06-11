*** Settings ***
Documentation    This suite verifies SQL table creation for the DomeADB.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    DomeADB
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

Verify DomeADB Telemetry status SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*status*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_status.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_status.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_status_items.sql

Verify DomeADB State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_enable_items.sql

Verify DomeADB State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_disable_items.sql

Verify DomeADB State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_abort_items.sql

Verify DomeADB State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_enterControl_items.sql

Verify DomeADB State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_exitControl_items.sql

Verify DomeADB State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_standby_items.sql

Verify DomeADB State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_start_items.sql

Verify DomeADB State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_stop_items.sql

Verify DomeADB Command Crawl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*Crawl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Crawl.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Crawl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Crawl_items.sql

Verify DomeADB Command Move SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*Move*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Move.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Move.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Move_items.sql

Verify DomeADB Command VelocityMove SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*VelocityMove*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_VelocityMove.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_VelocityMove.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_VelocityMove_items.sql

Verify DomeADB Command Echo SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*Echo*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Echo.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Echo.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_command_Echo_items.sql

Verify DomeADB Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_StateChanged_items.sql

Verify DomeADB Event DriveEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*DriveEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveEnabled_items.sql

Verify DomeADB Event DriveDisabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*DriveDisabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveDisabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveDisabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveDisabled_items.sql

Verify DomeADB Event DriveReady SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*DriveReady*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveReady.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveReady.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveReady_items.sql

Verify DomeADB Event DriveOverTemp SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*DriveOverTemp*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveOverTemp.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveOverTemp.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveOverTemp_items.sql

Verify DomeADB Event DriveFault SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*DriveFault*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveFault.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveFault.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_DriveFault_items.sql

Verify DomeADB Event RotationEnabled SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*RotationEnabled*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_RotationEnabled.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_RotationEnabled.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_RotationEnabled_items.sql

Verify DomeADB Event RotationPrevented SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*RotationPrevented*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_RotationPrevented.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_RotationPrevented.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_RotationPrevented_items.sql

Verify DomeADB Event LockingPinEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*LockingPinEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_LockingPinEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_LockingPinEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_LockingPinEngaged_items.sql

Verify DomeADB Event LockingPinDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*LockingPinDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_LockingPinDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_LockingPinDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_LockingPinDisengaged_items.sql

Verify DomeADB Event BrakeEngaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*BrakeEngaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_BrakeEngaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_BrakeEngaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_BrakeEngaged_items.sql

Verify DomeADB Event BrakeDisengaged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*BrakeDisengaged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_BrakeDisengaged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_BrakeDisengaged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_BrakeDisengaged_items.sql

Verify DomeADB Event SpeedLimitReached SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*SpeedLimitReached*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitReached.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitReached.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitReached_items.sql

Verify DomeADB Event AccelerationLimitReached SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*AccelerationLimitReached*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitReached.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitReached.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitReached_items.sql

Verify DomeADB Event SpeedLimitSubsided SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*SpeedLimitSubsided*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitSubsided.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitSubsided.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SpeedLimitSubsided_items.sql

Verify DomeADB Event AccelerationLimitSubsided SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*AccelerationLimitSubsided*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitSubsided.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitSubsided.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_AccelerationLimitSubsided_items.sql

Verify DomeADB Event EchoResponse SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*EchoResponse*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_EchoResponse.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_EchoResponse.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_EchoResponse_items.sql

Verify DomeADB Event MotionModeChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*MotionModeChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_MotionModeChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_MotionModeChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_MotionModeChanged_items.sql

Verify DomeADB Event SubsystemError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=domeADB_*SubsystemError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SubsystemError.sqldef
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SubsystemError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/domeADB_logevent_SubsystemError_items.sql

