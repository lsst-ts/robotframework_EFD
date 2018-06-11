*** Settings ***
Documentation    This suite verifies SQL table creation for the SummitFacility.
Force Tags    TSS-2622
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    SummitFacility
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

Verify SummitFacility Telemetry ServerStatus SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*ServerStatus*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_ServerStatus.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_ServerStatus.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_ServerStatus_items.sql

Verify SummitFacility State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_enable_items.sql

Verify SummitFacility State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_disable_items.sql

Verify SummitFacility State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_abort_items.sql

Verify SummitFacility State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_enterControl_items.sql

Verify SummitFacility State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_exitControl_items.sql

Verify SummitFacility State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_standby_items.sql

Verify SummitFacility State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_start_items.sql

Verify SummitFacility State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_stop_items.sql

Verify SummitFacility Command Enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*Enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Enable_items.sql

Verify SummitFacility Command ExitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*ExitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_ExitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_ExitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_ExitControl_items.sql

Verify SummitFacility Command Start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*Start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Start.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Start_items.sql

Verify SummitFacility Command EnterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*EnterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_EnterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_EnterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_EnterControl_items.sql

Verify SummitFacility Command Standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*Standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Standby_items.sql

Verify SummitFacility Command Disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*Disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_command_Disable_items.sql

Verify SummitFacility Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_AppliedSettingsMatchStart_items.sql

Verify SummitFacility Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_SummaryState_items.sql

Verify SummitFacility Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_ErrorCode_items.sql

Verify SummitFacility Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=summitFacility_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/summitFacility_logevent_SettingVersions_items.sql

