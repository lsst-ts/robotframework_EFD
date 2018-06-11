*** Settings ***
Documentation    This suite verifies SQL table creation for the TcsWEP.
Force Tags    TSS-2626
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    TcsWEP
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

Verify TcsWEP Telemetry WavefrontError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*WavefrontError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_WavefrontError.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_WavefrontError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_WavefrontError_items.sql

Verify TcsWEP Telemetry TargetSciSensorIdList SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*TargetSciSensorIdList*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_TargetSciSensorIdList.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_TargetSciSensorIdList.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_TargetSciSensorIdList_items.sql

Verify TcsWEP State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_enable_items.sql

Verify TcsWEP State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_disable_items.sql

Verify TcsWEP State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_abort_items.sql

Verify TcsWEP State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_enterControl_items.sql

Verify TcsWEP State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_exitControl_items.sql

Verify TcsWEP State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_standby_items.sql

Verify TcsWEP State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_start_items.sql

Verify TcsWEP State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_command_stop_items.sql

Verify TcsWEP Event WavefrontErrorCalculated SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*WavefrontErrorCalculated*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_WavefrontErrorCalculated.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_WavefrontErrorCalculated.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_WavefrontErrorCalculated_items.sql

Verify TcsWEP Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_StateChanged_items.sql

Verify TcsWEP Event NoEnoughWfsNum SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*NoEnoughWfsNum*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_NoEnoughWfsNum.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_NoEnoughWfsNum.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_NoEnoughWfsNum_items.sql

Verify TcsWEP Event ErrorCode SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcsWEP_*ErrorCode*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_ErrorCode.sqldef
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_ErrorCode.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/tcsWEP_logevent_ErrorCode_items.sql

