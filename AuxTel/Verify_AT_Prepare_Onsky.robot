*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    auxtel_prep_onsky
Suite Setup    Check If Failed

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Execute AuxTel Prepare for OnSky test
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_prepare_for_onsky
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATDome AzimuthInPosition
    [Tags]
    ${output}=    Get Topic Sent Time    ATDome    command_moveAzimuth
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATDome    logevent_azimuthInPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATDome    command_moveAzimuth    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["True",]

Verify ATDome azimuthState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_azimuthState    ["homed", "state",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #NotInMotion

Verify ATDome Position
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    position    ["azimuthPosition", "dropoutDoorOpeningPercentage", "mainDoorOpeningPercentage",]    1    None
    Should Be Equal As Integers    ${dataframe.azimuthPosition.values}[0]    90
    Should Be Equal As Integers    ${dataframe.dropoutDoorOpeningPercentage.values}[0]    0
    Should Be Equal As Integers    ${dataframe.mainDoorOpeningPercentage.values}[0]    100

Verify ATDome mainDoorState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_mainDoorState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    2    #Opened

Verify ATDome dropoutDoorState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_dropoutDoorState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    1    #Closed

Verify ATAOS Enabled Corrections
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["atspectrograph", "focus", "hexapod", "m1", "m2", "moveWhileExposing",]    1    None
    Should Be True    ${dataframe.atspectrograph.values}[0]    
    Should Not Be True    ${dataframe.focus.values}[0]    
    Should Be True    ${dataframe.hexapod.values}[0]    
    Should Be True    ${dataframe.m1.values}[0]    
    Should Not Be True    ${dataframe.m2.values}[0]    
    Should Not Be True    ${dataframe.moveWhileExposing.values}[0]    

Verify ATMCS Tracking Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled
    
Verify ATPneumatics m1CoverState
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    7    #Opened
