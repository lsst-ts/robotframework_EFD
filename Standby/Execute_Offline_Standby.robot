*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    standby    execute

*** Variables ***
${time_window}    10

*** Test Cases ***
Execute AuxTel Offline to Standby
    [Tags]    auxtel
    ${scripts}    ${states}=    Execute Integration Test    auxtel_offline_standby
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MainTel Offline to Standby
    [Tags]    maintel
    ${scripts}    ${states}=    Execute Integration Test    maintel_offline_standby
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
