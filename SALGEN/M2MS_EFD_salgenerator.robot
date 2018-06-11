*** Settings ***
Documentation    This suite builds the various interfaces for the M2MS.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    m2ms
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

Verify M2MS XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/m2ms_Commands.xml
    File Should Exist    ${SALWorkDir}/m2ms_Events.xml
    File Should Exist    ${SALWorkDir}/m2ms_Telemetry.xml

Salgen M2MS Validate
    [Documentation]    Validate the M2MS XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_MirrorPositionMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_AxialForcesMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TangentForcesMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_ZenithAngleMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_AxialActuatorAbsolutePositionSteps.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TangentActuatorAbsolutePositionSteps.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_AxialActuatorPositionAbsoluteEncoderPositionMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TangentActuatorPositionAbsoluteEncoderPositionMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_PowerStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TemperaturesMeasured.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_RawDisplacement.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_StepVectorUpdate.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TargetForces.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_SystemStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_RawTelemetry.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_ActuatorLimitSwitches.idl
    Comment    Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyBendingMode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ApplyForce.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_SetCorrectionMode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_PositionMirror.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_MoveAxialActuator.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_M2SummaryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_M2DetailedState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_M2FaultState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_M2AssemblyInPosition.idl

Salgen M2MS HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m2ms_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m2ms_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m2ms_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    114

