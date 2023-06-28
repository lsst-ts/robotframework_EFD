*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    auxtel_prep_flat

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Execute AuxTel Prepare for Flat
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_prepare_for_flat
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATDome AzimuthInPosition
    [Tags]
    ${output}=    Get Topic Sent Time    ATDome    command_moveAzimuth
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["True",]

Verify ATDome azimuthState is NotInMotion
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_azimuthState    ["homed", "state",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #NotInMotion

Verify ATDome Position
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    position    ["azimuthPosition", "dropoutDoorOpeningPercentage", "mainDoorOpeningPercentage",]    1    None
    Should Be Equal As Integers    ${dataframe.azimuthPosition.values}[0]    20
    Should Be Equal As Integers    ${dataframe.dropoutDoorOpeningPercentage.values}[0]    0
    Should Be Equal As Integers    ${dataframe.mainDoorOpeningPercentage.values}[0]    0

Verify ATDome mainDoorState is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_mainDoorState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #Closed

Verify ATDome dropoutDoorState is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_dropoutDoorState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #Closed

Verify ATDomeTrajectory followingMode is False
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDomeTrajectory    logevent_followingMode    ["*",]    1    None
    Should Not Be True    ${dataframe.enabled.values}[0]

Verify ATHexapod inPosition is True
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHexapod    logevent_inPosition    ["*",]    1    None
    Should Be True    ${dataframe.inPosition.values}[0]

Verify ATMCS allAxesInPosition
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_allAxesInPosition    ["*",]    2    None
    Should Be True    ${dataframe.inPosition.values}[1]    #True when Mount reaches the flatfield position.
    Should Not Be True    ${dataframe.inPosition.values}[0]    #Goes back to False a few seconds later, in preparation for the next move.

Verify ATMCS Tracking Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_azimuthInPosition    ["*",]    1    None
    Should Not Be True    ${dataframe.inPosition.values}[0]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_elevationInPosition    ["*",]    1    None
    Should Not Be True    ${dataframe.inPosition.values}[0]

Verify ATMCS m3State is NASMYTH2
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_m3State    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    7    #NASMYTH2
    
Verify ATPneumatics m1CoverState is Opened
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    7    #Opened

Verify ATPneumatics m1CoverLimitSwitches are Opened
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverLimitSwitches    ["*",]    1    None
    Should Be True    ${dataframe.cover1OpenedActive.values}[0]
    Should Be True    ${dataframe.cover2OpenedActive.values}[0]
    Should Be True    ${dataframe.cover3OpenedActive.values}[0]
    Should Be True    ${dataframe.cover4OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover1ClosedActive.values}[0]
    Should Not Be True    ${dataframe.cover2ClosedActive.values}[0]
    Should Not Be True    ${dataframe.cover3ClosedActive.values}[0]
    Should Not Be True    ${dataframe.cover4ClosedActive.values}[0]

Verify ATPneumatics mainValveState is Opened
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_mainValveState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #OPENED - MainValveState

Verify ATPneumatics m1State is Opened
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1State    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #OPENED - AirValveState

Verify ATPneumatics m2State is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m2State    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    7    #CLOSED - AirValveState
