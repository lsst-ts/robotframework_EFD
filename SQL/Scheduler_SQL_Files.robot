*** Settings ***
Documentation    This suite verify SQL table creation for the Scheduler.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Scheduler
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

Verify Scheduler Telemetry timeHandler SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*timeHandler*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_timeHandler.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_timeHandler.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_timeHandler_items.sql

Verify Scheduler Telemetry cloud SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*cloud*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_cloud.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_cloud.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_cloud_items.sql

Verify Scheduler Telemetry seeing SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*seeing*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_seeing.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_seeing.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_seeing_items.sql

Verify Scheduler Telemetry filterSwap SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*filterSwap*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_filterSwap.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_filterSwap.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_filterSwap_items.sql

Verify Scheduler Telemetry schedulerConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*schedulerConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_schedulerConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_schedulerConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_schedulerConfig_items.sql

Verify Scheduler Telemetry driverConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*driverConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_driverConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_driverConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_driverConfig_items.sql

Verify Scheduler Telemetry field SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*field*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_field.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_field.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_field_items.sql

Verify Scheduler Telemetry obsSiteConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*obsSiteConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_obsSiteConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_obsSiteConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_obsSiteConfig_items.sql

Verify Scheduler Telemetry telescopeConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*telescopeConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_telescopeConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_telescopeConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_telescopeConfig_items.sql

Verify Scheduler Telemetry rotatorConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*rotatorConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_rotatorConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_rotatorConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_rotatorConfig_items.sql

Verify Scheduler Telemetry domeConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*domeConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_domeConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_domeConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_domeConfig_items.sql

Verify Scheduler Telemetry cameraConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*cameraConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_cameraConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_cameraConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_cameraConfig_items.sql

Verify Scheduler Telemetry slewConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*slewConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_slewConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_slewConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_slewConfig_items.sql

Verify Scheduler Telemetry opticsLoopCorrConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*opticsLoopCorrConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_opticsLoopCorrConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_opticsLoopCorrConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_opticsLoopCorrConfig_items.sql

Verify Scheduler Telemetry parkConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*parkConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_parkConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_parkConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_parkConfig_items.sql

Verify Scheduler Telemetry generalPropConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*generalPropConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_generalPropConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_generalPropConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_generalPropConfig_items.sql

Verify Scheduler Telemetry sequencePropConfig SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*sequencePropConfig*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_sequencePropConfig.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_sequencePropConfig.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_sequencePropConfig_items.sql

Verify Scheduler Telemetry observatoryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*observatoryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_observatoryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_observatoryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_observatoryState_items.sql

Verify Scheduler Telemetry target SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*target*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_target.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_target.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_target_items.sql

Verify Scheduler Telemetry observation SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*observation*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_observation.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_observation.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_observation_items.sql

Verify Scheduler Telemetry interestedProposal SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*interestedProposal*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_interestedProposal.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_interestedProposal.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_interestedProposal_items.sql

Verify Scheduler Telemetry parameters SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*parameters*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_parameters.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_parameters.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_parameters_items.sql

Verify Scheduler Telemetry Application SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Application*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_Application.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_Application.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_Application_items.sql

Verify Scheduler Telemetry program SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*program*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_program.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_program.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_program_items.sql

Verify Scheduler Telemetry progress SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*progress*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_progress.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_progress.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_progress_items.sql

Verify Scheduler Telemetry rankingData SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*rankingData*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_rankingData.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_rankingData.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_rankingData_items.sql

Verify Scheduler Telemetry econstraints SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*econstraints*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_econstraints.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_econstraints.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_econstraints_items.sql

Verify Scheduler Telemetry iconstraints SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*iconstraints*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_iconstraints.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_iconstraints.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_iconstraints_items.sql

Verify Scheduler State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_enable_items.sql

Verify Scheduler State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_disable_items.sql

Verify Scheduler State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_abort_items.sql

Verify Scheduler State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_enterControl_items.sql

Verify Scheduler State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_exitControl_items.sql

Verify Scheduler State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_standby_items.sql

Verify Scheduler State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_start_items.sql

Verify Scheduler State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=scheduler_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/scheduler_command_stop_items.sql

