*** Settings ***
Documentation    This suite builds the various interfaces for the Rotator.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    rotator
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

Verify Rotator XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/rotator_Commands.xml
    File Should Exist    ${SALWorkDir}/rotator_Events.xml
    File Should Exist    ${SALWorkDir}/rotator_Telemetry.xml

Salgen Rotator Validate
    [Documentation]    Validate the Rotator XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_LimitSensors.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Position.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Electrical.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TC.idl
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_configureAcceleration.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_configureVelocity.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_move.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_track.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_test.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_error.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_interlock.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_limit.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_moveOK.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_tempError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_trackLost.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_tracking.idl

Salgen Rotator HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/rotator_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/rotator_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/rotator_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    87

