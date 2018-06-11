*** Settings ***
Documentation    This suite builds the various interfaces for the DomeAPS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    domeAPS
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

Verify DomeAPS XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/domeAPS_Commands.xml
    File Should Exist    ${SALWorkDir}/domeAPS_Events.xml
    File Should Exist    ${SALWorkDir}/domeAPS_Telemetry.xml

Salgen DomeAPS Validate
    [Documentation]    Validate the DomeAPS XML definitions.
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
    Comment    Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Close.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Open.idl
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LockingPinEngaged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LockingPinDisengaged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LockingPinHomed.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LockingPinFloating.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CentralLockingPinEngaged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CentralLockingPinDisengaged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CentralLockingPinHomed.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CentralLockingPinFloating.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_BrakeEngaged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_BrakeDisengaged.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_EchoResponse.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_APSSubsystemError.idl

Salgen DomeAPS HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/domeAPS_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/domeAPS_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/domeAPS_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    72

