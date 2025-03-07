*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    execute
Suite Setup    Set EFD Values

*** Variables ***
${state}    Offline
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
Execute ATCS Enabled to Offline
    [Tags]    atcs    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    2
    FOR    ${csc}    IN    @{ATCS}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute LATISS Enabled to Offline
    [Tags]    latiss    robot:continue-on-failure
    FOR    ${csc}    IN    @{LATISS}
        @{script_args}=    Create List    ${state}    2
        Run Keyword If    "${csc}" == "ATCamera"    Append To List    ${script_args}    -a Normal
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute BigCamera Enabled to Offline
    [Tags]    robot:continue-on-failure
    Set Tags    ${BigCamera}
    @{script_args}=    Create List    ${state}    1
    @{bigcamera_cscs}=    Set Variable If    "${env_efd}" == "base_efd"    ${MTCamera}    ${ComCam}
    FOR    ${csc}    IN    @{bigcamera_cscs}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute Calibration Enabled to Offline
    [Tags]    calibration    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3
    FOR    ${csc}    IN    @{Calibration}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute EnvSys Enabled to Offline
    [Tags]    envsys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3
    FOR    ${csc}    IN    @{EnvSys}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute EnvSys_AE Enabled to Offline
    [Tags]    envsys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3
    FOR    ${csc}    IN    @{EnvSys_AE}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute GenCam Enabled to Offline
    [Tags]    gencam    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR    ${csc}    IN    @{GenCam}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute MTCS Enabled to Offline
    [Tags]    mtcs    robot:continue-on-failure
    FOR    ${csc}    IN    @{MTCS}
        @{script_args}=    Create List    ${state}    1
        Run Keyword If    "${csc}" == "MTM1M3"    Append To List    ${script_args}    -a Default
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute MTAirCompressors Enabled to Offline
    [Tags]    mtaircompressor    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1
    FOR ${csc}    IN    @{AUTO_DISABLED}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute ObsSys Enabled to Offline
    [Tags]    obssys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3
    FOR    ${csc}    IN    @{ObsSys}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute Test:42 Enabled to Offline
    [Tags]    test:42
    @{script_args}=    Create List    ${state}    1
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Test:42    @{script_args}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
