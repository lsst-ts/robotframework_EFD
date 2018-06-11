*** Settings ***
Documentation    This suite verifies SQL table creation for the VMS.
Force Tags    TSS-2618
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    VMS
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

Verify VMS Telemetry M1M3 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*M1M3*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_M1M3.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_M1M3.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_M1M3_items.sql

Verify VMS Telemetry TMA SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TMA*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_TMA.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_TMA.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_TMA_items.sql

Verify VMS Telemetry M2 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*M2*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_M2.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_M2.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_M2_items.sql

Verify VMS Telemetry CameraRotator SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*CameraRotator*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_CameraRotator.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_CameraRotator.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_CameraRotator_items.sql

Verify VMS Command Start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*Start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_command_Start.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_command_Start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_command_Start_items.sql

Verify VMS Command Enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*Enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_command_Enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_command_Enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_command_Enable_items.sql

Verify VMS Command Disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*Disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_command_Disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_command_Disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_command_Disable_items.sql

Verify VMS Command Standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*Standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_command_Standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_command_Standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_command_Standby_items.sql

Verify VMS Command Shutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*Shutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_command_Shutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_command_Shutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_command_Shutdown_items.sql

Verify VMS Event SummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*SummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SummaryState_items.sql

Verify VMS Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_ErrorCode_items.sql

Verify VMS Event DetailedState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*DetailedState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_DetailedState.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_DetailedState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_DetailedState_items.sql

Verify VMS Event SettingVersions SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*SettingVersions*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SettingVersions.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SettingVersions.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SettingVersions_items.sql

Verify VMS Event AppliedSettingsMatchStart SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*AppliedSettingsMatchStart*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_AppliedSettingsMatchStart.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_AppliedSettingsMatchStart.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_AppliedSettingsMatchStart_items.sql

Verify VMS Event SettingsApplied SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*SettingsApplied*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SettingsApplied.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SettingsApplied.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_SettingsApplied_items.sql

Verify VMS Event AcquisitionRate SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=vms_*AcquisitionRate*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_AcquisitionRate.sqldef
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_AcquisitionRate.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/vms_logevent_AcquisitionRate_items.sql

