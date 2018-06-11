*** Settings ***
Documentation    This suite builds the various interfaces for the DomeLouvers.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    domeLouvers
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

Verify DomeLouvers XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/domeLouvers_Commands.xml
    File Should Exist    ${SALWorkDir}/domeLouvers_Events.xml
    File Should Exist    ${SALWorkDir}/domeLouvers_Telemetry.xml

Salgen DomeLouvers Validate
    [Documentation]    Validate the DomeLouvers XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_status.idl
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_SetPosition.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Echo.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_StateChanged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DriveEnabled.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DriveDisabled.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DriveReady.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DriveOverTemp.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DriveFault.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_MovementEnabled.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_MovementPrevented.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_EchoResponse.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SubsystemError.idl

Salgen DomeLouvers HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/domeLouvers_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/domeLouvers_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/domeLouvers_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    78

