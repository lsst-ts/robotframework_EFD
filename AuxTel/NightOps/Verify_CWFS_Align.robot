*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    at_night_ops    cwfs_align

*** Variables ***
${time_window}    10

*** Test Cases ***
Get Script Metadata
    [Tags]
    Common_Keywords.Get Script Metadata

Verify Runtime
    [Tags]    runtime
    Verify Script Runtime    ${script_start}    ${script_end}

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

Verify ATPtg Target
    [Tags]    robot:continue-on-failure
    ${output}=    Get Topic Sent Time    ATPtg    command_raDecTarget
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATPtg    command_raDecTarget    logevent_currentTarget    ${time_window}
    Verify Topic Attribute    ATPtg    command_raDecTarget    ["targetName"]    ["HD164461"]
    Verify Topic Attribute    ATPtg    command_raDecTarget    ["ra"]    [${18.913095}]
    Verify Topic Attribute    ATPtg    command_raDecTarget    ["declination"]    [${-87.605843}]
    Verify Topic Attribute    ATPtg    logevent_currentTarget    ["targetName",]    ["HD164461"]
    Verify Topic Attribute    ATPtg    logevent_currentTarget    ["raHours",]    [${18.913095}]
    Verify Topic Attribute    ATPtg    logevent_currentTarget    ["decDegs",]    [${-87.605843}]

Verify ATCamera Image Sequence
    [Documentation]    Verify the ATCamera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    Set Suite Variable    ${num_images}    ${7}    # Needed by Verify ATOODS ImageInOODS test case.
    ${seq_length}=    Set Variable    ${7}
    @{exp_time}=    Set Variable    ${5}    ${5}    ${5}    ${5}    ${5}    ${5}    ${5}
    @{img_type_seq}=    Set Variable    ACQ    CWFS    CWFS    CWFS    CWFS    CWFS    CWFS    # Sequence is reversed; EFD is in time-descending order.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Verify Sequence    ATCamera    command_takeImages    expTime    ${seq_length}    ${exp_time}
    Verify Sequence    ATCamera    logevent_startIntegration    exposureTime    ${seq_length}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_images}
        ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${i}]    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${i}]    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.numImages.values}[${i}]    1
        Should Be True    ${cmd_df.shutter.values}[${i}]
    END

Verify ATOODS ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.camera.values}[${i}]    LATISS
        Should Be Equal As Strings    ${dataframe.description.values}[${i}]    file ingested
        Should Be Equal As Strings    ${dataframe.obsid.values}[${i}]    ${image_names}[0][${i}]
    END

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.id.values}[${i}]    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.url[${i}].split("/")[-1]}    ${file_name}
    END

Verify ATHexapod Position
    [Documentation]    The CWFS_Align script does not effect the Hexapod [u, v, w] positions.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHexapod    logevent_positionUpdate    ["positionU", "positionV", "positionW", "positionX", "positionY", "positionZ"]    1    None
    Should Be Equal As Numbers    ${dataframe.positionU.values}[0]    0.35
    Should Be Equal As Numbers    ${dataframe.positionV.values}[0]    0.22
    Should Be Equal As Numbers    ${dataframe.positionW.values}[0]    0

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

Verify Initial Offset
    [Documentation]    The first offset the script applies each iteration is 0.8 mm to the z-axis.
    ...    The script executes 3 iterations, with 8 ATAOS correctionOffsets events published each iteration.
    ...    Retrieve 3*8 + 1 samples: 24 from the script, plus the previous value to test initial offset.
    ...    The script also issues 4 ATAOS offset commands each iteration. Retrieve all 12 samples.
    [Tags]    robot:continue-on-failure
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
    [Tags]    robot:continue-on-failure
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
    [Tags]    robot:continue-on-failure
    @{list}=    Create List    ${0.0}    ${0.0}    ${0.801}
    Comment    First Iteration.  Note: ATAOS publishes 2 intervening correctionOffsets Events.
    Lists Should Be Equal    ${command_dataframe.iloc[1].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[2][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[1][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8011
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[5].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[10][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[9][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8011
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[9].values.round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[18][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[17][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8011

Verify Final Offset Position
    [Documentation]    The final offset the script applies each iteration is from the result of cwfs analysis.
    [Tags]    robot:continue-on-failure
    Comment    First iteration. Expected Offsets: x=-0.957500, y=0.187200, z=-0.038000
    Set Test Variable    ${tol}    ${0.05}
    ${index}=    Set Variable    ${0}
    @{expected}=    Create List    ${-0.957500}    ${0.187200}    ${-0.038000}
    @{actual}=    Convert To List    ${command_dataframe.iloc[8].values.round(4)}
    FOR    ${number}    IN    @{actual}
        Compare Numbers    ${number}    ${expected}[${index}]    ${tol}
        ${index}=    Evaluate    ${index} + 1
    END
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[17][0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[16][0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Compare Numbers    ${delta}    ${expected}[0]    ${tol}
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[17][1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[16][1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Compare Numbers    ${delta}    ${expected}[1]    ${tol}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[17][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[16][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Compare Numbers    ${delta}    ${expected}[2]    ${tol}
    Comment    Second Iteration. Offset:  x=-0.308000, y=0.025900, z=0.013000
    ${index}=    Set Variable    ${0}
    @{expected}=    Create List    ${-0.308000}    ${0.025900}    ${0.013000}
    @{actual}=    Convert To List    ${command_dataframe.iloc[4].values.round(4)}
    FOR    ${number}    IN    @{actual}
        Compare Numbers    ${number}    ${expected}[${index}]    ${tol}
        ${index}=    Evaluate    ${index} + 1
    END
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[9][0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[8][0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Compare Numbers    ${delta}    ${expected}[0]    ${tol}
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[9][1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[8][1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Compare Numbers    ${delta}    ${expected}[1]    ${tol}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[9][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[8][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Compare Numbers    ${delta}    ${expected}[2]    ${tol}
    Comment    Third Iteration. Offset: x=-0.085300, y=-0.030000, z=-0.003100
    ${index}=    Set Variable    ${0}
    @{expected}=    Create List    ${-0.084500}    ${-0.031000}    ${-0.003100}
    @{actual}=    Convert To List    ${command_dataframe.iloc[0].values.round(4)}
    FOR    ${number}    IN    @{actual}    
        Compare Numbers    ${number}    ${expected}[${index}]    ${tol}
        ${index}=    Evaluate    ${index} + 1
    END
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[1][0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[0][0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Compare Numbers    ${delta}    ${expected}[0]    ${tol}
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[1][1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[0][1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Compare Numbers    ${delta}    ${expected}[1]    ${tol}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[1][2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[0][2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Compare Numbers    ${delta}    ${expected}[2]    ${tol}
