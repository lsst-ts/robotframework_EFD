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

Execute EAS Disabled to Enabled
    [Tags]    eas
    ${scripts}    ${states}=    Execute Integration Test    eas_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MainTel Disabled to Enabled
    [Tags]    mtcs
    ${scripts}    ${states}=    Execute Integration Test    maintel_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute GenCam Disabled to Enabled
    [Tags]    gc
    ${scripts}    ${states}=    Execute Integration Test    gencam_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute ObsSys2 Disabled to Enabled
    [Tags]    obssys2
    ${scripts}    ${states}=    Execute Integration Test    obssys_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
