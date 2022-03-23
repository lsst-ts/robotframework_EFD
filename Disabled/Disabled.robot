*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***

*** Test Cases ***
Verify ATCS CSCs Disabled
    [Tags]    atcs
    FOR    ${csc}    IN    @{ATCS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify AT_Light_Cal CSCs Disabled
    [Tags]    at_light_cal    skipped
    FOR    ${csc}    IN    @{AT_Light_Cal}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify ComCam CSCs Disabled
    [Tags]    comcam
    FOR    ${csc}    IN    @{ComCam}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify EAS CSCs Disabled
    [Tags]    eas
    FOR    ${csc}    IN    @{EAS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify EAS_AE CSCs Disabled
    [Tags]    eas_ae
    FOR    ${csc}    IN    @{EAS_AE}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify LATISS CSCs Disabled
    [Tags]    latiss
    FOR    ${csc}    IN    @{LATISS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify MTCS CSCs Disabled
    [Tags]    mtcs
    FOR    ${csc}    IN    @{MTCS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify ObsSys1 CSCs Disabled
    [Tags]    obssys1
    FOR    ${csc}    IN    @{ObsSys1}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END

Verify ObsSys2 CSCs Disabled
    [Tags]    obssys2
    FOR    ${csc}    IN    @{ObsSys2}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[disabled]    ${csc}
    END
