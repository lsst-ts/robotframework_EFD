*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled    execute
Suite Setup    Set EFD Values

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
Execute AuxTel Disabled to Enabled
    [Tags]    atcs
    ${scripts}    ${states}=    Execute Integration Test    auxtel_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute BigCamera Disabled to Enabled
    [Tags]
    Set Tags    ${BigCamera}
    Log Many    @{bigcamera_cscs}    # Defined in Common_Keywords.Set Efd Values
    FOR    ${csc}    IN    @{bigcamera_cscs}
        ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    ${csc}    Enabled
        Verify Scripts Completed Successfully    ${scripts}    ${states}
        Report If Failed    ${scripts}    ${states}
    END

Execute EAS Disabled to Enabled
    [Tags]    eas
    ${scripts}    ${states}=    Execute Integration Test    eas_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MainTel Disabled to Enabled
    [Tags]    mtcs
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${test_env}=    Set Variable If    "${env_efd}" == "base_efd"    bts    tts
    ${scripts}    ${states}=    Execute Integration Test    maintel_disabled_enabled    ${test_env}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MTM1M3 Disabled to Enabled
    [Tags]    mtm1m3
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTM1M3    Enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute GenCam Disabled to Enabled
    [Tags]    gc
    ${scripts}    ${states}=    Execute Integration Test    gencam_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute ObsSys Disabled to Enabled
    [Tags]    obssys
    ${scripts}    ${states}=    Execute Integration Test    obssys_disabled_enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute EPM:1 Disabled to Enabled
    [Tags]    epm:1
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    EPM    Enabled    -x 1
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute MTPtg Disabled to Enabled
    [Tags]    mtptg
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTPtg    Enabled
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute OCPS2||3 Disabled to Enabled
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    OCPS    Enabled    -x ${OcpsIndex}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}

Execute Test:42 Disabled to Enabled
    [Tags]    test:42
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    Test    Enabled    -x 42
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Report If Failed    ${scripts}    ${states}
