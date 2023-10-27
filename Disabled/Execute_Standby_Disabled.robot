*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    disabled    execute

*** Variables ***

*** Test Cases ***
Execute AuxTel Standby to Disabled 
    [Tags]    atcs
    ${scripts}    ${states}=    Execute Integration Test    auxtel_standby_disabled
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
    ${scripts}    ${states}=    Execute Integration Test    maintel_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute ObsSys2 Standby to Disabled
    [Tags]    obssys2
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    "bts"    "tts"
    ${scripts}    ${states}=    Execute Integration Test    obssys_standby_disabled    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
