*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    execute
Suite Setup    Log Many    ${STATES}[offline]

*** Variables ***

*** Test Cases ***
Execute BigCamera Enabled to Offline
    [Tags]    bigcamera
    # Set the BigCamera name to MTCamera if running on the BTS, or CCCamera if running on TTS.
    ${big_camera}=    Set Variable If    "${env_efd}" == "base_efd"    MTCamera    CCCamera
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${big_camera}    Offline
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute OCPS2||3 Standby to Disabled
    [Tags]    mtocps
    # Set the OCPS name based on running on the BTS or TTS.
    ${big_ocps}=    Set Variable If    "${env_efd}" == "base_efd"    OCPS:3    OCPS:2
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${big_ocps}    Offline
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute Enabled to Offline
    [Tags]
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    bts    tts
    ${scripts}    ${states}=    Execute Integration Test    enabled_offline    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}    shutdown=${True}
