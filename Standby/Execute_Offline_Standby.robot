*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    standby    execute

*** Variables ***

*** Test Cases ***
Execute AuxTel Offline to Standby
    [Tags]    auxtel
    ${scripts}    ${states}=    Execute Integration Test    auxtel_offline_standby
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MainTel Offline to Standby
    [Tags]    maintel    bigcamera
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${integration_script}=    Set Variable If    "${env_efd}" == "base_efd"    lsstcam_offline_standby    comcam_offline_standby
    ${scripts}    ${states}=    Execute Integration Test    ${integration_script}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
