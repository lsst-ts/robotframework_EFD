*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Library     DateTime
Force Tags    at_night_ops

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATSpectrograph ChangeFilter
    [Tags]    cwfs_align
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_filterInPosition    ${time_window}
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_reportedFilterPosition    ${time_window}
    Verify Topic Attribute    ATSpectrograph    logevent_filterInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph ChangeDisperer
    [Tags]    cwfs_align
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_disperserInPosition    ${time_window}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_reportedDisperserPosition    ${time_window}
    Verify Topic Attribute    ATSpectrograph    logevent_disperserInPosition    ["inPosition",]    [True,]

Verify LinearStage MoveLinearStage
    [Tags]    cwfs_align
    ${dataframe}=    Get Recent Samples    LinearStage    command_moveLinearStage    ["*",]    1    None
    Should Be Empty    ${dataframe}

Verify ATDome AzimuthInPosition
    [Tags]    acq_take_image
    Verify Time Delta    ATDome    command_moveAzimuth    logevent_azimuthInPosition    60
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["True",]
    
