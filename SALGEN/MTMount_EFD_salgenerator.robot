*** Settings ***
Documentation    This suite builds the various interfaces for the MTMount.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    MTMount
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

Verify MTMount XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/MTMount_Commands.xml
    File Should Exist    ${SALWorkDir}/MTMount_Events.xml
    File Should Exist    ${SALWorkDir}/MTMount_Telemetry.xml

Salgen MTMount Validate
    [Documentation]    Validate the MTMount XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Az.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Alt.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Az_CW.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Az_OSS.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Alt_OSS.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Az_TC.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Alt_TC.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Bal.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_MC.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Cam_CW.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Cab_TC.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_DP_1.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_DP_2.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_MotionParameters.idl
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_closeMirrorCover.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_configure.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disableCamWrap.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enableCamWrap.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_moveToTarget.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_openMirrorCover.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_trackTarget.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_clearerror.idl
    Comment    Events
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_mountState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_mountWarning.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_mountError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_mountInPosition.idl

Salgen MTMount HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/MTMount_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/MTMount_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/MTMount_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    117

