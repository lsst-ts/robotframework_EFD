*** Settings ***
Documentation    This suite builds the various interfaces for the AtMonochromator.
Force Tags    
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    atMonochromator
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

Verify AtMonochromator XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/atMonochromator_Commands.xml
    File Should Exist    ${SALWorkDir}/atMonochromator_Events.xml
    File Should Exist    ${SALWorkDir}/atMonochromator_Telemetry.xml

Salgen AtMonochromator Validate
    [Documentation]    Validate the AtMonochromator XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Timestamp.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_LoopTime_ms.idl
    Comment    Commands
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_exitControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enterControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ChangeWavelength.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_CalibrateWavelength.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_Power.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_SelectGrating.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_PowerWhiteLight.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_SetCoolingTemperature.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ChangeLightIntensity.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_ChangeSlitWidth.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_updateMonochromatorSetup.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedSettingsMatchStart.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ErrorCode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingVersions.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SummaryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DetailedState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_InternalCommand.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_Heartbeat.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LoopTimeOutOfRange.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedCommand.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_CoolingMonitoring.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingsAppliedMonoCommunication.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LightStatus.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SelectedGrating.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_Wavelength.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LightIntensity.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SlitWidth.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_inPosition.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_MonochromatorConnected.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingsAppliedMonoHeartbeat.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingsAppliedLoop.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingsAppliedMonochromatorRanges.idl

Salgen AtMonochromator HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/atMonochromator_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/atMonochromator_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/atMonochromator_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    114

