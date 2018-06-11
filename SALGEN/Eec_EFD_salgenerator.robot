*** Settings ***
Documentation    This suite builds the various interfaces for the Eec.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    eec
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

Verify Eec XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/eec_Commands.xml
    File Should Exist    ${SALWorkDir}/eec_Events.xml
    File Should Exist    ${SALWorkDir}/eec_Telemetry.xml

Salgen Eec Validate
    [Documentation]    Validate the Eec XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_hvactelem.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Timestamp.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_nightsetpoint.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_eectelem.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_LoopTime_ms.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_daysetpoint.idl
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_operatormode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_nighttimemode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_exitControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_sethvac.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_daytimemode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_setlouvers.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_engineeringmode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disable.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_AppliedSettingsMatchStart.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_nighttimefail.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedCommand.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingsApplied.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DetailedState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_daytimefail.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_InternalCommand.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LoopTimeOutOfRange.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SummaryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_ErrorCode.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_Heartbeat.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_SettingVersions.idl

Salgen Eec HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/eec_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/eec_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/eec_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    126

