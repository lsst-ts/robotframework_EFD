*** Settings ***
Documentation    This suite verify SQL table creation for the MTMount.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    MTMount
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

Verify MTMount Telemetry Az SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Az*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_items.sql

Verify MTMount Telemetry Alt SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Alt*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_items.sql

Verify MTMount Telemetry Az_CW SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Az_CW*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_CW.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_CW.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_CW_items.sql

Verify MTMount Telemetry Az_OSS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Az_OSS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_OSS.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_OSS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_OSS_items.sql

Verify MTMount Telemetry Alt_OSS SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Alt_OSS*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_OSS.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_OSS.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_OSS_items.sql

Verify MTMount Telemetry Az_TC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Az_TC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_TC.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_TC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Az_TC_items.sql

Verify MTMount Telemetry Alt_TC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Alt_TC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_TC.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_TC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Alt_TC_items.sql

Verify MTMount Telemetry Bal SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Bal*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Bal.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Bal.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Bal_items.sql

Verify MTMount Telemetry MC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*MC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_MC.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_MC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_MC_items.sql

Verify MTMount Telemetry Cam_CW SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Cam_CW*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Cam_CW.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Cam_CW.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Cam_CW_items.sql

Verify MTMount Telemetry Cab_TC SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Cab_TC*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_Cab_TC.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_Cab_TC.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_Cab_TC_items.sql

Verify MTMount Telemetry DP_1 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*DP_1*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_DP_1.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_DP_1.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_DP_1_items.sql

Verify MTMount Telemetry DP_2 SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*DP_2*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_DP_2.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_DP_2.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_DP_2_items.sql

Verify MTMount Telemetry MotionParameters SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*MotionParameters*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_MotionParameters.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_MotionParameters.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_MotionParameters_items.sql

Verify MTMount State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enable_items.sql

Verify MTMount State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_disable_items.sql

Verify MTMount State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_abort_items.sql

Verify MTMount State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enterControl_items.sql

Verify MTMount State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_exitControl_items.sql

Verify MTMount State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_standby_items.sql

Verify MTMount State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_start_items.sql

Verify MTMount State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_stop_items.sql

Verify MTMount Command closeMirrorCover SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*closeMirrorCover*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_closeMirrorCover.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_closeMirrorCover.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_closeMirrorCover_items.sql

Verify MTMount Command configure SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*configure*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_configure.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_configure.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_configure_items.sql

Verify MTMount Command disableCamWrap SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*disableCamWrap*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_disableCamWrap.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_disableCamWrap.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_disableCamWrap_items.sql

Verify MTMount Command enableCamWrap SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*enableCamWrap*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enableCamWrap.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enableCamWrap.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_enableCamWrap_items.sql

Verify MTMount Command moveToTarget SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*moveToTarget*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_moveToTarget.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_moveToTarget.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_moveToTarget_items.sql

Verify MTMount Command openMirrorCover SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*openMirrorCover*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_openMirrorCover.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_openMirrorCover.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_openMirrorCover_items.sql

Verify MTMount Command trackTarget SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*trackTarget*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_trackTarget.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_trackTarget.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_trackTarget_items.sql

Verify MTMount Command clearerror SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*clearerror*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_clearerror.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_clearerror.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_command_clearerror_items.sql

Verify MTMount Event mountState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*mountState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountState.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountState_items.sql

Verify MTMount Event mountWarning SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*mountWarning*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountWarning.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountWarning.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountWarning_items.sql

Verify MTMount Event mountError SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*mountError*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountError.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountError.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountError_items.sql

Verify MTMount Event mountInPosition SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=MTMount_*mountInPosition*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountInPosition.sqldef
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountInPosition.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/MTMount_logevent_mountInPosition_items.sql

