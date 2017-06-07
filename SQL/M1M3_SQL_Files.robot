*** Settings ***
Documentation    This suite verify SQL table creation for the M1M3.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    M1M3
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

Verify M1M3 Telemetry LimitSensors SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LimitSensors*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_LimitSensors.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_LimitSensors.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_LimitSensors_items.sql

Verify M1M3 Telemetry Metrology SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Metrology*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_Metrology.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_Metrology.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_Metrology_items.sql

Verify M1M3 Telemetry Application SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Application*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_Application.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_Application.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_Application_items.sql

Verify M1M3 Telemetry LUT SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*LUT*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_LUT.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_LUT.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_LUT_items.sql

Verify M1M3 Telemetry Actuators SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Actuators*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_Actuators.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_Actuators.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_Actuators_items.sql

Verify M1M3 Telemetry TC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_TC.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_TC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_TC_items.sql

Verify M1M3 Telemetry Electrical SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Electrical*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_Electrical.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_Electrical.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_Electrical_items.sql

Verify M1M3 Telemetry Surface SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Surface*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_Surface.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_Surface.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_Surface_items.sql

Verify M1M3 Telemetry Support SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Support*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_Support.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_Support.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_Support_items.sql

Verify M1M3 State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enable_items.sql

Verify M1M3 State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_disable_items.sql

Verify M1M3 State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_abort_items.sql

Verify M1M3 State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_enterControl_items.sql

Verify M1M3 State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_exitControl_items.sql

Verify M1M3 State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_standby_items.sql

Verify M1M3 State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_start_items.sql

Verify M1M3 State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_stop_items.sql

Verify M1M3 Command configure SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*configure*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_configure.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_configure.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_configure_items.sql

Verify M1M3 Command status SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*status*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_status.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_status.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_status_items.sql

Verify M1M3 Command target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_target.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_target_items.sql

Verify M1M3 Command update SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*update*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_update.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_update.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_command_update_items.sql

Verify M1M3 Event interlock SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*interlock*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_interlock.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_interlock.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_interlock_items.sql

Verify M1M3 Event limitError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*limitError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_limitError.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_limitError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_limitError_items.sql

Verify M1M3 Event targetDone SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*targetDone*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_targetDone.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_targetDone.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_targetDone_items.sql

Verify M1M3 Event targetError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*targetError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_targetError.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_targetError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_targetError_items.sql

Verify M1M3 Event tempError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*tempError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_tempError.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_tempError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_tempError_items.sql

Verify M1M3 Event updateDone SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*updateDone*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_updateDone.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_updateDone.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_updateDone_items.sql

Verify M1M3 Event updateError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3_*updateError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_updateError.sqldef
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_updateError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/m1m3_logevent_updateError_items.sql

