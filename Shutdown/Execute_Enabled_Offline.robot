*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown
Suite Setup    Log Many    ${STATES}[offline]

*** Variables ***

*** Test Cases ***
Execute Enabled to Offline
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    enabled_offline
    Verify Scripts Completed Successfully    ${scripts}    ${states}    shutdown=${True}
