*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Process
Force Tags    at_daytime_checkout

*** Variables ***

*** Test Cases ***
Execute AuxTel Telescope and Dome Checkout Test
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_daytime_telescope_and_dome
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify AuxTel is Parked
    [Tags]    robot:continue-on-failure
    Verify Telescope Parked    auxtel
    Verify Dome Parked    auxtel

Verify ATMCS Tracking is Disabled
    [Tags]
    Comment    The Checkout scripts now disable ATMCS tracking as the last step.
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled

Verify ATMCS Tracking was Enabled
    [Tags]    robot:continue-on-failure
    Comment    When disabling tracking ATMCS goes from Enabled > Stopping > Disabled.
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    3    None
    Should Be Equal As Integers    ${dataframe.state.values}[2]    9    #TrackingEnabled
    Comment    When ATMCS is tracking, the inPosition flag is set to False.
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_azimuthInPosition    ["inPosition",]    3    None
    Should Not Be True    ${dataframe.inPosition.values}[2]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_elevationInPosition    ["inPosition",]    3    None
    Should Not Be True    ${dataframe.inPosition.values}[2]

Verify ATPtg Tracking was AzEl
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPtg    logevent_detailedState    ["detailedState",]    2    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[1]    2    #DetailedStates_azEl

Verify ATPtg Tracking is Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPtg    logevent_detailedState    ["detailedState",]    1    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[0]    1    #DetailedStates_notTracking

Verify Telescope is Parked
    [Tags]
    Verify Telescope Parked    auxtel
