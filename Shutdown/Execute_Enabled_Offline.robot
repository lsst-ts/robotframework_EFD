*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    execute
Suite Setup    Run Keywords    Set EFD Values    AND    Log Many    ${STATES}[offline]

*** Variables ***
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
Execute BigCamera Enabled to Offline
    [Tags]
    Set Tags    ${BigCamera}
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${BigCamera}    Offline
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute EPM:1 Enabled to Offline
    [Tags]    epm:1
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    EPM    Offline    -x 1
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MTPtg Enabled to Offline
    [Tags]    mtptg 
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTPtg    Offline
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute OCPS2||3 Enabled to Offline
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    OCPS    Offline    -x ${OcpsIndex}
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute MTM1M3 Enabled to Offline
    [Tags]    mtm1m3
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTM1M3    Offline
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute Test:42 Enabled to Offline
    [Tags]    test:42
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Test    Offline    -x 42
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute Enabled to Offline
    [Tags]
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    bts    tts
    ${scripts}    ${states}=    Execute Integration Test    enabled_offline    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}    shutdown=${True}
