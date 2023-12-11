*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    execute
Suite Setup    Log Many    ${STATES}[offline]

*** Variables ***

*** Test Cases ***
Execute Enabled to Offline
    [Tags]
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    bts    tts
    ${scripts}    ${states}=    Execute Integration Test    enabled_offline    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}    shutdown=${True}
