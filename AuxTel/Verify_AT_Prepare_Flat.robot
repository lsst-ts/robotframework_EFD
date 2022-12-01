*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    auxtel_prep_flat

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Get Script Metadata
    [Tags]
    Common_Keywords.Get Script Metadata

Verify Runtime
    [Tags]    runtime    DM-36956
    Verify Script Runtime    ${script_start}    ${script_end}

Verify ATDome AzimuthInPosition
    [Tags]
    ${output}=    Get Topic Sent Time    ATDome    command_moveAzimuth
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATDome    command_moveAzimuth    logevent_azimuthInPosition    30
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["True",]

Verify ATDome azimuthState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_azimuthState    ["homed", "state",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #NotInMotion

Verify ATDome Position
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    position    ["azimuthPosition", "dropoutDoorOpeningPercentage", "mainDoorOpeningPercentage",]    1    None
    Should Be Equal As Integers    ${dataframe.azimuthPosition.values}[0]    20
    Should Be Equal As Integers    ${dataframe.dropoutDoorOpeningPercentage.values}[0]    0
    Should Be Equal As Integers    ${dataframe.mainDoorOpeningPercentage.values}[0]    0

Verify ATDome mainDoorState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_mainDoorState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #Closed

Verify ATDome dropoutDoorState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_dropoutDoorState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #Closed

Verify ATMCS Tracking Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_azimuthInPosition    ["*",]    1    None
    Should Not Be True    ${dataframe.inPosition.values}[0]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_elevationInPosition    ["*",]    1    None
    Should Not Be True    ${dataframe.inPosition.values}[0]

Verify ATMCS m3State
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_m3State    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #NASMYTH1
    
Verify ATPneumatics m1CoverState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    7    #Opened

Verify ATPneumatics m1CoverLimitSwitches Opened
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

Verify ATPneumatics m1State
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1State    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #OPENED - AirValveState

Verify ATPneumatics m2State
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m2State    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    #OPENED - AirValveState
