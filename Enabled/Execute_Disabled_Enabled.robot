*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    execute
Suite Setup    Set EFD Values

*** Variables ***
${state}    Enabled
${cccamera_salver}    ${SALVersion}
${cccamera_xmlver}    ${XMLVersion}
${ccoods_salver}    ${SALVersion}
${ccoods_xmlver}    ${XMLVersion}
${ccheaderservice_salver}    ${SALVersion}
${ccheaderservice_xmlver}    ${XMLVersion}
${mtcamera_salver}    ${SALVersion}
${mtcamera_xmlver}    ${XMLVersion}
${mtoods_salver}    ${SALVersion}
${mtoods_xmlver}    ${XMLVersion}
${mtheaderservice_salver}    ${SALVersion}
${mtheaderservice_xmlver}    ${XMLVersion}
${ocps2_salver}    ${SALVersion}
${ocps2_xmlver}    ${XMLVersion}
${ocps3_salver}    ${SALVersion}
${ocps3_xmlver}    ${XMLVersion}

*** Test Cases ***
Execute ATCS Disabled to Enabled
    [Tags]    atcs    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    2
    FOR    ${csc}    IN    @{ATCS}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute LATISS Disabled to Enabled
    [Tags]    latiss    robot:continue-on-failure
    FOR    ${csc}    IN    @{LATISS}
        Log to Console    Enabling ${csc}...    no_newline=true
        @{script_args}=    Create List    ${state}    2
        Run Keyword If    "${csc}" == "ATCamera"    Append To List    ${script_args}    -a Normal
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute BigCamera Disabled to Enabled
    [Tags]    robot:continue-on-failure
    Set Tags    ${BigCamera}
    @{bigcamera_cscs}=    Set Variable If    "${env_efd}" == "base_efd"    ${MTCamera}    ${ComCam}
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{bigcamera_cscs}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute Calibration Disabled to Enabled
    [Tags]    calibration    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{Calibration}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute EnvSys Disabled to Enabled
    [Tags]    envsys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{EnvSys}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute GenCam Disabled to Enabled
    [Tags]    gencam    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{GenCam}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute MTCS Disabled to Enabled
    [Tags]    mtcs    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{MTCS}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute MTAirCompressors Disabled to Enabled
    [Tags]    mtaircompressor    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{AUTO_DISABLED}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute ObsSys Disabled to Enabled
    [Tags]    obssys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3
    FOR    ${csc}    IN    @{ObsSys}
        Log to Console    Enabling ${csc}...    no_newline=true
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Log to Console    Done.
    END

Execute Test:42 Disabled to Enabled
    [Tags]    test42
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Test:42    Enabled    1
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Log to Console    Done.
