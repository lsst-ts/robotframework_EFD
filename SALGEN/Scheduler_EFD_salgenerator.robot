*** Settings ***
Documentation    This suite builds the various interfaces for the Scheduler.
Suite Setup    Log Many    ${Host}    ${timeout}    ${SALVersion}
Suite Teardown    Close All Connections
Library    SSHLibrary
Resource    ../Global_Vars.robot

*** Variables ***
${subSystem}    scheduler
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

Verify Scheduler XML Defintions exist
    [Tags]
    File Should Exist    ${SALWorkDir}/scheduler_Telemetry.xml

Salgen Scheduler Validate
    [Documentation]    Validate the Scheduler XML definitions.
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
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_timeHandler.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_cloud.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_seeing.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_filterSwap.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_schedulerConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_driverConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_field.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_obsSiteConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_telescopeConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_rotatorConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_domeConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_cameraConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_slewConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_opticsLoopCorrConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_parkConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_generalPropConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_sequencePropConfig.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_observatoryState.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_target.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_observation.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_interestedProposal.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_parameters.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_Application.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_program.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_progress.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_rankingData.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_econstraints.idl
    File Should Exist    ${SALWorkDir}/idl-templates/${subSystem}_iconstraints.idl
    Comment    Commands
    Comment    Events

Salgen Scheduler HTML
    [Documentation]    Create web form interfaces.
    [Tags]
    ${input}=    Write    ${SALHome}/scripts/salgenerator ${subSystem} html
    ${output}=    Read Until Prompt
    Log    ${output}
    Should Contain    ${output}    SAL generator - V${SALVersion}
    Directory Should Exist    ${SALWorkDir}/html/salgenerator/${subSystem}
    @{files}=    List Directory    ${SALWorkDir}/html/salgenerator/${subSystem}    pattern=*${subSystem}*
    Log Many    @{files}
    File Should Exist    ${SALWorkDir}/html/${subSystem}/scheduler_Telemetry.html

Verify SQL directory exists
    [Tags]    sql
    Directory Should Exist    ${SALWorkDir}/sql
    @{files}=    List Directory    ${SALWorkDir}/sql    pattern=${subSystem}_*
    Log Many    @{files}
    Should Not Be Empty    ${files}
    Comment    Length is calculated in the bash generation script.
    Length Should Be    ${files}    84

