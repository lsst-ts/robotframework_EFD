*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Process
Force Tags    at_telescope_dome_checkout

*** Variables ***
${time_window}    10

*** Test Cases ***
Execute AuxTel Telescope and Dome Checkout Test
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_telescope_dome_checkout
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify AuxTel is Parked
    [Tags]    robot:continue-on-failure
    # ATMCS
    Verify Telescope Parked    auxtel
    # ATDome
    ${dataframe}=    Get Recent Samples    ATDome    logevent_azimuthState    ["homed", "homeSwitch",]    1    None
    Should Be True    ${dataframe.homed.values}[0]
    Log    ${dataframe.homeSwitch.values}[0]

Verify ATMCS Tracking is Enabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    9    #TrackingEnabled

Verify ATMCS Tracking was Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    2    None
    Should Be Equal As Integers    ${dataframe.state.values}[1]    8    #TrackingDisabled
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_azimuthInPosition    ["inPosition",]    2    None
    Should Not Be True    ${dataframe.inPosition.values}[1]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_elevationInPosition    ["inPosition",]    2    None
    Should Not Be True    ${dataframe.inPosition.values}[1]

Verify ATPtg Tracking is AzEl
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPtg    logevent_detailedState    ["detailedState",]    1    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[0]    2    #DetailedStates_azEl

Verify ATPtg Tracking was Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPtg    logevent_detailedState    ["detailedState",]    2    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[1]    1    #DetailedStates_notTracking