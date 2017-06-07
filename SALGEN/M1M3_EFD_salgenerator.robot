*** Settings ***
Documentation    This suite builds the various interfaces for the M1M3.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    m1m3
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

Verify M1M3 XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/m1m3_Commands.xml
    File Should Exist    ${SALWorkDir}/m1m3_Events.xml
    File Should Exist    ${SALWorkDir}/m1m3_Telemetry.xml

Salgen M1M3 Validate
    [Documentation]    Validate the M1M3 XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_LimitSensors.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Metrology.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Application.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_LUT.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Actuators.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_TC.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Electrical.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Surface.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Support.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_disable.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_abort.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_enterControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_exitControl.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_standby.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_start.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_stop.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_configure.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_status.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_target.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_command_update.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_interlock.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_limitError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_targetDone.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_targetError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_tempError.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_updateDone.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_logevent_updateError.idl

Salgen M1M3 HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m1m3_Commands.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m1m3_Events.html
    File Should Exist    ${SALWorkDir}/html/${subSystem}/m1m3_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=m1m3*
    Log Many    @{files}

