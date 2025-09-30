*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    standby    execute
Suite Setup    Set EFD Values

*** Variables ***
${state}    Standby
${cccamera_salver}    ${SALVersion}
${cccamera_xmlver}    ${XMLVersion}
${ccoods_salver}    ${SALVersion}
${ccoods_xmlver}    ${XMLVersion}
${ccheaderservice_salver}    ${SALVersion}
${ccheaderservice_xmlver}    ${XMLVersion}
${mtcamera_salver}    ${SALVersion}
${mtcamera_xmlver}    ${XMLVersion}
${mtoods_salver}    ${SALVersion}
${mtoods_xmlver}    ${XMLVersion}
${mtheaderservice_salver}    ${SALVersion}
${mtheaderservice_xmlver}    ${XMLVersion}
${ocps2_salver}    ${SALVersion}
${ocps2_xmlver}    ${XMLVersion}
${ocps3_salver}    ${SALVersion}
${ocps3_xmlver}    ${XMLVersion}

*** Test Cases ***
Execute AuxTel Offline to Standby
    [Tags]    atcamera
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ATCamera    ${state}    2
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute BigCamera Offline to Standby
    [Tags]
    Set Tags    ${BigCamera}
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${BigCamera}    ${state}    1
    Verify Scripts Completed Successfully    ${scripts}    ${states}
