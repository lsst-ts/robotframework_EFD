*** Settings ***
Documentation    This suite builds the various interfaces for the CatchupArchiver.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    catchuparchiver
${timeout}    1500s

*** Test Cases ***
Create SALGEN Session
    [Documentation]    Connect to the host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=SALGEN    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify CatchupArchiver XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/catchuparchiver_Events.xml
    File Should Exist    ${SALWorkDir}/catchuparchiver_Telemetry.xml

Salgen CatchupArchiver Validate
    [Documentation]    Validate the CatchupArchiver XML definitions.
    [Tags]
    Write    cd ${SALWorkDir}
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} validate
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Should Contain    ${output}    Processing ${subSystem}
    Should Contain    ${output}    Completed ${subSystem} validation
    Directory Should Exist    ${SALWorkDir}/idl-templates
    Directory Should Exist    ${SALWorkDir}/idl-templates/validated
    @{files}=    List Directory    ${SALWorkDir}/idl-templates    pattern=*${subSystem}*
    Log Many    @{files}
    Comment    Telemetry
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_SequencerHeartbeat.idl
    Comment    State Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_abort.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enterControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_exitControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_stop.idl
    Comment    Commands
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_catchuparchiverEntitySummaryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_catchuparchiverEntityStartup.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_catchuparchiverEntityShutdown.idl

Salgen CatchupArchiver HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/catchuparchiver_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/catchuparchiver_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=catchuparchiver*
    Log Many    @{files}

