*** Settings ***
Documentation    This suite verify SQL table creation for the Dome.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    Dome
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

Verify Dome Telemetry Summary SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=*Summary*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_Summary.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_Summary.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_Summary_items.sql

Verify Dome State Command enable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*enable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_enable.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_enable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_enable_items.sql

Verify Dome State Command disable SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*disable*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_disable.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_disable.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_disable_items.sql

Verify Dome State Command abort SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*abort*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_abort.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_abort.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_abort_items.sql

Verify Dome State Command enterControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*enterControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_enterControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_enterControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_enterControl_items.sql

Verify Dome State Command exitControl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*exitControl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_exitControl.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_exitControl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_exitControl_items.sql

Verify Dome State Command standby SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*standby*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_standby.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_standby.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_standby_items.sql

Verify Dome State Command start SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*start*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_start.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_start.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_start_items.sql

Verify Dome State Command stop SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*stop*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_stop.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_stop.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_stop_items.sql

Verify Dome Command Crawl SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*Crawl*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_Crawl.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_Crawl.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_Crawl_items.sql

Verify Dome Command Move SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*Move*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_Move.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_Move.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_Move_items.sql

Verify Dome Command Park SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*Park*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_Park.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_Park.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_Park_items.sql

Verify Dome Command SetLouvers SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*SetLouvers*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_SetLouvers.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_SetLouvers.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_SetLouvers_items.sql

Verify Dome Command CloseShutter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*CloseShutter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_CloseShutter.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_CloseShutter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_CloseShutter_items.sql

Verify Dome Command OpenShutter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*OpenShutter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_OpenShutter.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_OpenShutter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_OpenShutter_items.sql

Verify Dome Command StopShutter SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*StopShutter*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_command_StopShutter.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_command_StopShutter.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_command_StopShutter_items.sql

Verify Dome Event StateChanged SQL defintion files exist
    [Tags]    sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=dome_*StateChanged*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/sql/dome_logevent_StateChanged.sqldef
    File Should Exist    ${SALWorkDir}/sql/dome_logevent_StateChanged.sqlwrt
    File Should Exist    ${SALWorkDir}/sql/dome_logevent_StateChanged_items.sql

