*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    disabled    execute
Suite Setup    Set EFD Values

*** Variables ***

*** Test Cases ***
Execute AuxTel Standby to Disabled 
    [Tags]    atcs
    ${scripts}    ${states}=    Execute Integration Test    auxtel_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute BigCamera Standby to Disabled
    [Tags]
    Set Tags    ${BigCamera}
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${BigCamera}    Disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
    
Execute EAS Standby to Disabled
    [Tags]    eas
    ${scripts}    ${states}=    Execute Integration Test    eas_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute GenCam Standby to Disabled
    [Tags]    gc
    ${scripts}    ${states}=    Execute Integration Test    gencam_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MainTel Standby to Disabled
    [Tags]    maintel
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    bts    tts
    ${scripts}    ${states}=    Execute Integration Test    maintel_standby_disabled    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MTM1M3 Standby to Disabled
    [Tags]    mtm1m3
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTM1M3    Disabled    -a Default
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute ObsSys Standby to Disabled
    [Tags]    obssys
    ${scripts}    ${states}=    Execute Integration Test    obssys_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute EPM:1 Standby to Disabled 
    [Tags]    epm:1
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    EPM    Disabled    -x 1
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MTPtg Standby to Disabled
    [Tags]    mtptg
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTPtg    Disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute OCPS2||3 Standby to Disabled
    [Tags]
    Set Tag    OCPS:${OcpsIndex}
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    OCPS    Disabled    -x ${OcpsIndex}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute Test:42 Standby to Disabled
    [Tags]    test:42
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Test    Disabled    -x 42
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
