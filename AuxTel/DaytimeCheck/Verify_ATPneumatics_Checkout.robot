*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Process
Force Tags    daytime_at_atpneumatics

*** Variables ***
${time_window}    10

*** Test Cases ***
Execute ATPneumatics Checkout Test
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_daytime_atpneumatics
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify AuxTel is Parked
    [Tags]
    Verify Telescope Parked    auxtel

Verify ATPneumatics mainValveState is Opened
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_mainValveState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #OPENED - MainValveState

Verify ATAOS Corrections Disabled
    [Documentation]    Corrections should be disabled, after running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Not Be True    $dataframe.atspectrograph.values
    Should Not Be True    $dataframe.focus.values
    Should Not Be True    $dataframe.hexapod.values
    Should Not Be True    $dataframe.m1.values
    Should Not Be True    $dataframe.m2.values
    Should Not Be True    $dataframe.moveWhileExposing.values

Verify ATAOS m1CorrectionCompleted
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    m1CorrectionCompleted    ["*",]    1    None
    Log    ${dataframe}

Verify ATPneumatics m1CoverState is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #CLOSED

Verify ATPneumatics m1VentsPosition Closed
    [Tags]
    Verify Topic Attribute    ATPneumatics    logevent_m1VentsPosition    ["position",]    [${1},]

Verify ATMCS Tracking Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_azimuthInPosition    ["*",]    1    None
    Should Not Be True    ${dataframe.inPosition.values}[0]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_elevationInPosition    ["*",]    1    None
    Should Not Be True    ${dataframe.inPosition.values}[0]
