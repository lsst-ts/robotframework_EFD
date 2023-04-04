*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../Common_Keywords.resource

*** Variables ***
${time_window}    10

*** Test Cases ***
Execute AuxTel Standby to Disabled 
    [Tags]    atcs
    ${scripts}    ${states}=    Execute Integration Test    auxtel_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute EAS Standby to Disabled
    [Tags]    eas
    ${scripts}    ${states}=    Execute Integration Test    eas_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute GenCam Standby to Disabled
    [Tags]    gc
    ${scripts}    ${states}=    Execute Integration Test    gencam_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute MainTel Standby to Disabled
    [Tags]    maintel
    ${scripts}    ${states}=    Execute Integration Test    maintel_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute ObsSys2 Standby to Disabled
    [Tags]    obssys2
    ${scripts}    ${states}=    Execute Integration Test    obssys2_standby_disabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
