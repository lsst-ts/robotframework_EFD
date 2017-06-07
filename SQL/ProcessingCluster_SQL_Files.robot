*** Settings ***
Documentation    This suite verify SQL table creation for the ProcessingCluster.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    ProcessingCluster
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

Verify ProcessingCluster Telemetry SequencerHeartbeat SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*SequencerHeartbeat*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_SequencerHeartbeat.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_SequencerHeartbeat.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_SequencerHeartbeat_items.sql

Verify ProcessingCluster State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_enable_items.sql

Verify ProcessingCluster State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_disable_items.sql

Verify ProcessingCluster State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_abort_items.sql

Verify ProcessingCluster State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_enterControl_items.sql

Verify ProcessingCluster State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_exitControl_items.sql

Verify ProcessingCluster State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_standby_items.sql

Verify ProcessingCluster State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_start_items.sql

Verify ProcessingCluster State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_command_stop_items.sql

Verify ProcessingCluster Event processingclusterEntitySummaryState SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*processingclusterEntitySummaryState*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntitySummaryState.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntitySummaryState.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntitySummaryState_items.sql

Verify ProcessingCluster Event processingclusterEntityStartup SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*processingclusterEntityStartup*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntityStartup.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntityStartup.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntityStartup_items.sql

Verify ProcessingCluster Event processingclusterEntityShutdown SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=processingcluster_*processingclusterEntityShutdown*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntityShutdown.sqldef
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntityShutdown.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/processingcluster_logevent_processingclusterEntityShutdown_items.sql

