*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    execute

*** Variables ***

*** Test Cases ***
Execute AuxTel Disabled to Enabled
    [Tags]    atcs
    ${scripts}    ${states}=    Execute Integration Test    auxtel_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute BigCamera Disabled to Enabled
    [Tags]    bigcamera
    # Set the BigCamera name to MTCamera if running on the BTS, or CCCamera if running on TTS.
    ${big_camera}=    Set Variable If    "${env_efd}" == "base_efd"    MTCamera    CCCamera
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${big_camera}    Enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute EAS Disabled to Enabled
    [Tags]    eas
    ${scripts}    ${states}=    Execute Integration Test    eas_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MainTel Disabled to Enabled
    [Tags]    mtcs
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    bts    tts
    ${scripts}    ${states}=    Execute Integration Test    maintel_disabled_enabled    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute GenCam Disabled to Enabled
    [Tags]    gc
    ${scripts}    ${states}=    Execute Integration Test    gencam_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute ObsSys Disabled to Enabled
    [Tags]    obssys
    ${scripts}    ${states}=    Execute Integration Test    obssys_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute OCPS2||3 Disabled to Enabled
    [Tags]    mtocps
    # Set the OCPS name based on running on the BTS or TTS.
    ${big_ocps}=    Set Variable If    "${env_efd}" == "base_efd"    OCPS:3    OCPS:2
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${big_ocps}    Enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
