*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    execute
Suite Setup    Set EFD Values

*** Variables ***
${state}    Offline

*** Test Cases ***
Execute Watcher Enabled to Offline
    [Tags]    
    @{script_args}=    Create List    ${state}    2    mute_alarms    false
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Watcher    @{script_args}
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute ATCS Enabled to Offline
    [Tags]    atcs    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    2    mute_alarms    false
    FOR    ${csc}    IN    @{ATCS}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute LATISS Enabled to Offline
    [Tags]    latiss    robot:continue-on-failure
    FOR    ${csc}    IN    @{LATISS}
        @{script_args}=    Create List    ${state}    2    mute_alarms    false
        Run Keyword If    "${csc}" == "ATCamera"    Append To List    ${script_args}    -a Normal
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute BigCamera Enabled to Offline
    [Tags]    robot:continue-on-failure
    Set Tags    ${BigCamera}
    @{script_args}=    Create List    ${state}    1    mute_alarms    false
    @{bigcamera_cscs}=    Set Variable If    "${env_efd}" == "base_efd"    ${MTCamera}    ${ComCam}
    FOR    ${csc}    IN    @{bigcamera_cscs}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute Calibration Enabled to Offline
    [Tags]    calibration    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3    mute_alarms    false
    FOR    ${csc}    IN    @{Calibration}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute EnvSys Enabled to Offline
    [Tags]    envsys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3    mute_alarms    false
    FOR    ${csc}    IN    @{EnvSys}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute EnvSys_AE Enabled to Offline
    [Tags]    envsys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3    mute_alarms    false
    FOR    ${csc}    IN    @{EnvSys_AE}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute GenCam Enabled to Offline
    [Tags]    gencam    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1    mute_alarms    false
    FOR    ${csc}    IN    @{GenCam}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute MTCS Enabled to Offline
    [Tags]    mtcs    robot:continue-on-failure
    FOR    ${csc}    IN    @{MTCS}
        @{script_args}=    Create List    ${state}    1    mute_alarms    false
        Run Keyword If    "${csc}" == "MTM1M3"    Append To List    ${script_args}    -a Default
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute MTAirCompressors Enabled to Offline
    [Tags]    mtaircompressor    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    1    mute_alarms    false
    FOR    ${csc}    IN    @{AUTO_DISABLED}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute ObsSys Enabled to Offline
    [Tags]    obssys    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3    mute_alarms    false
    # Remove Watcher, as it is shutdown, explicitly, first.
    Remove Values From List    @{ObsSys}    Watcher
    FOR    ${csc}    IN    @{ObsSys}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END

Execute Test:42 Enabled to Offline
    [Tags]    test:42
    @{script_args}=    Create List    ${state}    1    mute_alarms    false
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Test:42    @{script_args}
    Verify Scripts Completed Successfully    ${scripts}    ${states}

# ScriptQueues must go last.
Execute ScriptQueues Enabled to Offline
    [Tags]    obssys_ae    robot:continue-on-failure
    @{script_args}=    Create List    ${state}    3    mute_alarms    false
    FOR    ${csc}    IN    @{ObsSys_AE}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    @{script_args}
        Verify Scripts Completed Successfully    ${scripts}    ${states}
    END
