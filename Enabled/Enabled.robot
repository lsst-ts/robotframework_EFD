*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library    QueryEfd
Library    Collections
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify ATCS CSCs Enabled
    [Tags]    atcs
    FOR    ${csc}    IN    @{ATCS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify AT_Light_Cal CSCs Enabled
    [Tags]    at_light_cal    skipped
    FOR    ${csc}    IN    @{AT_Light_Cal}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify ComCam CSCs Enabled
    [Tags]    comcam
    FOR    ${csc}    IN    @{ComCam}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify EAS CSCs Enabled
    [Tags]    eas
    FOR    ${csc}    IN    @{EAS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify EAS_AE CSCs Enabled
    [Tags]    eas_ae
    FOR    ${csc}    IN    @{EAS_AE}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify LATISS CSCs Enabled
    [Tags]    latiss
    FOR    ${csc}    IN    @{LATISS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify MTCS CSCs Enabled
    [Tags]    mtcs
    FOR    ${csc}    IN    @{MTCS}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify ObsSys1 CSCs Enabled
    [Tags]    obssys1
    FOR    ${csc}    IN    @{ObsSys1}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END

Verify ObsSys2 CSCs Enabled
    [Tags]    obssys2
    FOR    ${csc}    IN    @{ObsSys2}
        Run Keyword and Continue on Failure    Verify Summary State    ${STATES}[enabled]    ${csc}
    END
