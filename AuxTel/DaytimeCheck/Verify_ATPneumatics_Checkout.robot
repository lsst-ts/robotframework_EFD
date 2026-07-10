*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Process
Force Tags    at_daytime_checkout

*** Variables ***
${time_window}    10

*** Test Cases ***
Close ATPneumatics MainValve
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    run_command    2    ATPneumatics    closeMasterAirSupply
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATPneumatics mainValveState is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_mainValveState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    7    #CLOSED - MainValveState
    
Verify ATPneumatics mainAirSourcePressure is Zero when MainValve is Closed
    [Tags]
    Verify Topic Attribute    ATPneumatics    mainAirSourcePressure    ["pressure",]    [0,]

Execute ATPneumatics Daytime Checkout Test
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

Verify ATPneumatics mainAirSourcePressure when MainValve is Opened
    [Tags]
    Verify Topic Attribute    ATPneumatics    mainAirSourcePressure    ["pressure",]    [300000,]

Verify ATAOS Corrections Disabled
    [Documentation]    Corrections should be disabled, after running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Not Be True    $dataframe.atspectrograph.values
    Should Not Be True    $dataframe.focus.values
    Should Not Be True    $dataframe.hexapod.values
    Should Not Be True    $dataframe.m1.values
    Should Not Be True    $dataframe.m2.values
    Should Be True    $dataframe.moveWhileExposing.values    # Not a correction itself, more like a modifier...

Verify ATAOS m1CorrectionCompleted
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_m1CorrectionCompleted    ["*",]    1    None
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.azimuth.values}[0]    0
    Should Be Equal As Integers    ${dataframe.elevation.values}[0]    80
    Should Be True    abs(${dataframe.pressure.values}[0]) > 0
    Should Be True    abs(${dataframe.temperature.values}[0]) > 0

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
