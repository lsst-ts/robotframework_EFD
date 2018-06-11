*** Settings ***
Documentation    This suite builds the various interfaces for the Sequencer.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    sequencer
${timeout}    15s

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

Verify Sequencer XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/sequencer_Commands.xml
    File Should Exist    ${SALWorkDir}/sequencer_Events.xml
    File Should Exist    ${SALWorkDir}/sequencer_Telemetry.xml

Salgen Sequencer Validate
    [Documentation]    Validate the Sequencer XML definitions.
    [Tags]
    Write    cd ${SALWorkDir}
    ${output}=    Read Until Prompt
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
    Comment    Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_sequence.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_script.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerEntitySummaryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerEntityStartup.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerEntityShutdown.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerCommandIssued.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerCommandStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerCurrentScript.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerNextScript.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerScriptStart.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerScriptEnd.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerScriptError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_sequencerScriptEntititesInUse.idl

Salgen Sequencer HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/sequencer_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/sequencer_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/sequencer_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    81

