*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Library     DateTime
Force Tags    at_night_ops    cwfs_align

*** Variables ***
${time_window}    10

*** Test Cases ***
Get Script Metadata
    [Tags]
    Common_Keywords.Get Script Metadata

Verify ATAOS Corrections Enabled
    [Documentation]    Corrections should already be enabled, ensure nothing was changed prior to running this script.
    [Tags]
    Verify Time Delta    ATAOS    command_enableCorrection    logevent_correctionEnabled    ${time_window}
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Be True    $dataframe.atspectrograph.values
    Should Be True    $dataframe.hexapod.values
    Should Be True    $dataframe.m1.values

Verify ATCamera Playlist Loaded
    [Documentation]    Playlist should already be loaded, ensure nothing was changed prior to running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["playlist", "repeat", "private_identity", "private_origin",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    cwfs-test_take_sequence.playlist
    Should Not Be True    ${dataframe.repeat.values}[0]

Verify ATPtg TargetName
    [Tags]
    Verify Topic Attribute    ATPtg    logevent_currentTarget    ["targetName",]    ["HD164461"]

Verify ATCamera ExposureTime
    [Tags]
    Verify Topic Attribute    ATCamera    logevent_startIntegration    ["exposureTime",]    [5,]

Verify ATHexapod Position
    [Documentation]    The CWFS_Align script does not effect the Hexapod [u, v, w] positions.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHexapod    logevent_positionUpdate    ["positionU", "positionV", "positionW", "positionX", "positionY", "positionZ"]    1    None
    Should Be Equal As Numbers    ${dataframe.positionU.values}[0]    0.35
    Should Be Equal As Numbers    ${dataframe.positionV.values}[0]    0.22
    Should Be Equal As Numbers    ${dataframe.positionW.values}[0]    0

Verify Initial Offset
    [Documentation]    The first offset the script applies each iteration is 0.8 mm to the z-axis.
    ...    The script executes 3 iterations, with 8 ATAOS correctionOffsets events published each iteration.
    ...    Retrieve 3*8 + 1 samples: 24 from the script, plus the previous value to test initial offset.
    ...    The script also issues 4 ATAOS offset commands each iteration. Retrieve all 12 samples.
    [Tags]
    ${command_dataframe}=    Get Recent Samples    ATAOS    command_offset    ["x", "y", "z"]    12    None
    Set Suite Variable    ${command_dataframe}
    ${event_dataframe}=    Get Recent Samples    ATAOS    logevent_correctionOffsets    ["x", "y", "z"]    25    None
    Set Suite Variable    ${event_dataframe}
    @{list}=    Create List    ${0.0}    ${0.0}    ${0.8}
    Comment    First Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[3].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[8][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[7][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[7].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[16][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[15][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[11].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[24][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[23][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8

Verify Extra-Focal Offset
    [Documentation]    The second offset the script applies each iteration is -(0.8 * 2 + 0.0011)mm to the z-axis.
    [Tags]
    @{list}=    Create List    ${0.0}    ${0.0}    ${-1.6011}
    Comment    First Iteration.  Note: ATAOS publishes 2 intervening correctionOffsets Events.
    Lists Should Be Equal    ${command_dataframe.iloc[2].values.round(4)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[5][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[4][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -1.6011
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[6].values.round(4)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[13][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[12][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -1.6011
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[10].values.round(4)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[21][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[20][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -1.6011

Verify Return to InFocus Position
    [Documentation]    The third offset the script applies each iteration is 0.8 mm to the z-axis.
    [Tags]
    @{list}=    Create List    ${0.0}    ${0.0}    ${0.8}
    Comment    First Iteration.  Note: ATAOS publishes 2 intervening correctionOffsets Events.
    Lists Should Be Equal    ${command_dataframe.iloc[1].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[2][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[1][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[5].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[10][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[9][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[9].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[18][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[17][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8

Verify Final Offset Position
    [Documentation]    The final offset the script applies each iteration is from the result of cwfs analysis.
    [Tags]
    Comment    First Iteration. Offset: x=-0.086100, y=-0.027342, z=-0.002962
    @{list}=    Create List    ${-0.0861}    ${-0.0273}    ${-0.0030}
    Lists Should Be Equal    ${command_dataframe.iloc[0].values.round(4)}    ${list}
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[1][0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[0][0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Should Be Equal As Numbers    ${delta}    -0.086100    precision=3
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[1][1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[0][1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Should Be Equal As Numbers    ${delta}    -0.027342    precision=3
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[1][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[0][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -0.002962    precision=3
    Comment    Second Iteration. Offset:  x=-0.307060, y=0.034502, z=0.013209
    @{list}=    Create List    ${-0.3071}    ${0.0345}    ${0.0132}
    Lists Should Be Equal    ${command_dataframe.iloc[4].values.round(3)}    ${list}
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[9][0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[8][0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Should Be Equal As Numbers    ${delta}    -0.307060    precision=3
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[9][1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[8][1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Should Be Equal As Numbers    ${delta}    0.034502    precision=3
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[9][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[8][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.013209    precision=3
    Comment    Third iteration. Offset: x=-0.955054, y=0.176058, z=-0.038303
    @{list}=    Create List    ${-0.9551}    ${0.1761}    ${-0.0383}
    Lists Should Be Equal    ${command_dataframe.iloc[8].values.round(3)}    ${list}
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[17][0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[16][0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Should Be Equal As Numbers    ${delta}    -0.955054    precision=3
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[17][1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[16][1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Should Be Equal As Numbers    ${delta}    0.176058    precision=3
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[17][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[16][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -0.038303    precision=3

Verify ATMCS AxesInPosition
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph ChangeFilter
    [Tags]
    ${output}=    Get Topic Sent Time    ATSpectrograph    command_changeFilter
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_filterInPosition    ${time_window}
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_reportedFilterPosition    ${time_window}
    Verify Topic Attribute    ATSpectrograph    logevent_filterInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph Filter
    [Tags]    DM-35582
    Verify Topic Attribute    ATSpectrograph    logevent_reportedFilterPosition    ["band",]    ["r",]
    #Verify Topic Attribute    ATSpectrograph    logevent_reportedFilterPosition    ["name",]    ["SDSSr",]    #DM-35582

Verify ATSpectrograph ChangeDisperer
    [Tags]
    ${output}=    Get Topic Sent Time    ATSpectrograph    command_changeDisperser
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_disperserInPosition    ${time_window}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_reportedDisperserPosition    ${time_window}
    Verify Topic Attribute    ATSpectrograph    logevent_disperserInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph Disperser
    [Tags]    DM-35582
    Verify Topic Attribute    ATSpectrograph    logevent_reportedDisperserPosition    ["band",]    ["EMPTY",]
    #Verify Topic Attribute    ATSpectrograph    logevent_reportedDisperserPosition    ["name",]    ["empty_1",]    #DM-35582

Verify LinearStage MoveLinearStage
    [Tags]
    ${dataframe}=    Get Recent Samples    LinearStage    command_moveLinearStage    ["*",]    1    None
    Should Be Empty    ${dataframe}
