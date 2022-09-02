*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Library     DateTime
Force Tags    at_night_ops

*** Variables ***
${time_window}    10

*** Test Cases ***
Get Script Metadata
    [Tags]    cwfs_align
    ${dataframe}=    Get Recent Samples    ScriptQueue    logevent_script    ["isStandard", "path", "scriptSalIndex", "timestampProcessStart",]    1    None
    ${datetime}=    Convert Date    ${dataframe.timestampProcessStart.values}[0]    result_format=datetime
    Log Many    isStandard= ${dataframe.isStandard.values}    path= ${dataframe.path.values}    scriptIndex= ${dataframe.scriptSalIndex.values}    datetime= ${datetime}

Verify ATAOS Corrections Enabled
    [Tags]    cwfs_align
    Verify Time Delta    ATAOS    command_enableCorrection    logevent_correctionEnabled    ${time_window}
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Be True    $dataframe.atspectrograph.values
    Should Be True    $dataframe.hexapod.values
    Should Be True    $dataframe.m1.values

Verify ATPtg TargetName
    [Tags]    cwfs_align
    Verify Topic Attribute    ATPtg    logevent_currentTarget    ["targetName",]    ["HD164461"]

Verify ATCamera ExposureTime
    [Tags]    cwfs_align
    Verify Topic Attribute    ATCamera    logevent_startIntegration    ["exposureTime",]    [5,]

Verify ATMCS AxesInPosition
    [Tags]    cwfs_align
    Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph ChangeFilter
    [Tags]    cwfs_align
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_filterInPosition    ${time_window}
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_reportedFilterPosition    ${time_window}
    Verify Topic Attribute    ATSpectrograph    logevent_filterInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph Filter
    [Tags]    cwfs_align    DM-35582
    Verify Topic Attribute    ATSpectrograph    logevent_reportedFilterPosition    ["band",]    ["r",]
    #Verify Topic Attribute    ATSpectrograph    logevent_reportedFilterPosition    ["name",]    ["SDSSr",]    #DM-35582

Verify ATSpectrograph ChangeDisperer
    [Tags]    cwfs_align
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_disperserInPosition    ${time_window}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_reportedDisperserPosition    ${time_window}
    Verify Topic Attribute    ATSpectrograph    logevent_disperserInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph Disperer
    [Tags]    cwfs_align    DM-35582
    Verify Topic Attribute    ATSpectrograph    logevent_reportedDisperserPosition    ["band",]    ["EMPTY",]
    #Verify Topic Attribute    ATSpectrograph    logevent_reportedDisperserPosition    ["name",]    ["empty_1",]    #DM-35582

Verify LinearStage MoveLinearStage
    [Tags]    cwfs_align
    ${dataframe}=    Get Recent Samples    LinearStage    command_moveLinearStage    ["*",]    1    None
    Should Be Empty    ${dataframe}
