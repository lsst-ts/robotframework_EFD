*** Settings ***
Documentation    This suite builds the various interfaces for the TCS.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    tcs
${timeout}    1500s

*** Test Cases ***
Create SALGEN Session
    [Documentation]    Connect to the SAL host.
    [Tags]    smoke
    Comment    Connect to host.
    Open Connection    host=${Host}    alias=SALGEN    timeout=${timeout}    prompt=${Prompt}
    Comment    Login.
    Log    ${ContInt}
    Login With Public Key    ${UserName}    keyfile=${KeyFile}    password=${PassWord}
    Directory Should Exist    ${SALInstall}
    Directory Should Exist    ${SALHome}

Verify TCS XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/tcs_Commands.xml
    File Should Exist    ${SALWorkDir}/tcs_Events.xml
    File Should Exist    ${SALWorkDir}/tcs_Telemetry.xml

Salgen TCS Validate
    [Documentation]    Validate the TCS XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_PointingModel.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_AOCS.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_TimeKeeper.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_Site.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_Target.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_PointingControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_TrackRefSys.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_ZEMAX.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_PointingLog.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_DawdleFilter.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_OpticsVt.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_WEP.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_TrackingTarget.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_kernel_FK5Target.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_LoopTime_ms.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Timestamp.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_abort.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enterControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_exitControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_stop.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_wfpCalculate.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_wfpSimulate.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_injectError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_wfpDataReady.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_zemaxError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_InternalCommand.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_DetailedState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_Heartbeat.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_LoopTimeOutOfRange.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_RejectedCommand.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_HeartbeatIn.idl

Salgen TCS HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/tcs_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/tcs_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/tcs_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=tcs*
    Log Many    @{files}

