*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Process
Force Tags    at_night_ops    wep_align
Suite Setup    Check If Failed

*** Variables ***

*** Test Cases ***
Execute AuxTel Reset Offsets
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_reset_offsets
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATAOS Corrections Enabled
    [Documentation]    Corrections should already be enabled, ensure nothing was changed prior to running this script.
    [Tags]
    Verify Time Delta    ATAOS    logevent_correctionEnabled    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATAOS    command_enableCorrection    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Be True    $dataframe.atspectrograph.values
    Should Be True    $dataframe.hexapod.values
    Should Be True    $dataframe.m1.values

Load Camera Playlist
    [Tags]    execute
    ${result}=    Run Process    load_camera_playlist    at    cwfs    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify ATCamera Playlist Loaded
    [Documentation]    Playlist should already be loaded, ensure nothing was changed prior to running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["playlist", "repeat", "private_identity", "private_origin",]    1    None
    Should Be Equal    ${dataframe.iloc[0].playlist}    cwfs-test_take_sequence

Execute AuxTel LATISS WEP Align test
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_latiss_wep_align
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify ATPtg Target
    [Tags]    robot:continue-on-failure
    ${output}=    Get Topic Sent Time    ATPtg    command_raDecTarget
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATPtg    logevent_currentTarget    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATPtg    command_raDecTarget    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
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
        ${evt_image_type}=    Fetch From Left    ${evt_df.iloc[${i}].additionalValues}    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.iloc[${i}].keyValueMap}    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.iloc[${i}].numImages}    1
        Should Be True    ${cmd_df.iloc[${i}].shutter}
    END

Verify ATOODS ImageInOODS
    [Tags]
    Wait Until Keyword Succeeds    60 sec    10 sec    Verify Image in OODS    ATOODS    ${image_names}[0][0]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.iloc[${i}].camera}    LATISS
        Should Be Equal As Strings    ${dataframe.iloc[${i}].description}    file ingested
        Should Be Equal As Strings    ${dataframe.iloc[${i}].obsid}    ${image_names}[0][${i}]
    END

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.iloc[${i}].id}    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.iloc[${i}].url.split("/")[-1]}    ${file_name}
    END

Verify ATHexapod Position
    [Documentation]    The WEP_Align script does not effect the Hexapod [u, v, w] positions.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHexapod    logevent_positionUpdate    ["positionU", "positionV", "positionW", "positionX", "positionY", "positionZ"]    1    None
    Should Be Equal As Numbers    ${dataframe.iloc[0].positionU}    0.35
    Should Be Equal As Numbers    ${dataframe.iloc[0].positionV}    0.22
    Should Be Equal As Numbers    ${dataframe.iloc[0].positionW}    0

Verify ATMCS AxesInPosition
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_allAxesInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph ChangeFilter
    [Tags]
    ${output}=    Get Topic Sent Time    ATSpectrograph    command_changeFilter
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATSpectrograph    logevent_filterInPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeFilter    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    logevent_reportedFilterPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeFilter    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
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
    Verify Time Delta    ATSpectrograph    logevent_disperserInPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    logevent_reportedDisperserPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
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
    Lists Should Be Equal    ${command_dataframe.iloc[3].round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[8].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[7].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[7].round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[16].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[15].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[11].round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[24].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[23].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8

Verify Extra-Focal Offset
    [Documentation]    The second offset the script applies each iteration is -(0.8 * 2 + 0.0011)mm to the z-axis.
    [Tags]    robot:continue-on-failure
    @{list}=    Create List    ${0.0}    ${0.0}    ${-1.6011}
    Comment    First Iteration.  Note: ATAOS publishes 2 intervening correctionOffsets Events.
    Lists Should Be Equal    ${command_dataframe.iloc[2].round(4)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[5].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[4].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -1.6011
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[6].round(4)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[13].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[12].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -1.6011
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[10].round(4)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[21].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[20].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    -1.6011

Verify Return to InFocus Position
    [Documentation]    The third offset the script applies each iteration is 0.8 mm to the z-axis.
    [Tags]    robot:continue-on-failure
    @{list}=    Create List    ${0.0}    ${0.0}    ${0.801}
    Comment    First Iteration.  Note: ATAOS publishes 2 intervening correctionOffsets Events.
    Lists Should Be Equal    ${command_dataframe.iloc[1].round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[2].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[1].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8011
    Comment    Second Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[5].round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[10].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[9].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8011
    Comment    Third Iteration.
    Lists Should Be Equal    ${command_dataframe.iloc[9].round(3)}    ${list}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[18].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[17].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Should Be Equal As Numbers    ${delta}    0.8011

Verify Final Offset Position
    [Documentation]    The final offset the script applies each iteration is from the result of WEP analysis.
    [Tags]    robot:continue-on-failure
    Comment    First iteration. Expected Offsets: x=-0.957500, y=0.187200, z=-0.038000
    Set Test Variable    ${tol}    ${0.05}
    ${index}=    Set Variable    ${0}
    @{expected}=    Create List    ${-0.957500}    ${0.187200}    ${-0.038000}
    @{actual}=    Convert To List    ${command_dataframe.iloc[8].round(4)}
    FOR    ${number}    IN    @{actual}
        Compare Numbers    ${number}    ${expected}[${index}]    ${tol}
        ${index}=    Evaluate    ${index} + 1
    END
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[17].iloc[0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[16].iloc[0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Compare Numbers    ${delta}    ${expected}[0]    ${tol}
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[17].iloc[1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[16].iloc[1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Compare Numbers    ${delta}    ${expected}[1]    ${tol}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[17].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[16].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Compare Numbers    ${delta}    ${expected}[2]    ${tol}
    Comment    Second Iteration. Offset:  x=-0.308000, y=0.025900, z=0.013000
    ${index}=    Set Variable    ${0}
    @{expected}=    Create List    ${-0.308000}    ${0.025900}    ${0.013000}
    @{actual}=    Convert To List    ${command_dataframe.iloc[4].round(4)}
    FOR    ${number}    IN    @{actual}
        Compare Numbers    ${number}    ${expected}[${index}]    ${tol}
        ${index}=    Evaluate    ${index} + 1
    END
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[9].iloc[0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[8].iloc[0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Compare Numbers    ${delta}    ${expected}[0]    ${tol}
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[9].iloc[1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[8].iloc[1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Compare Numbers    ${delta}    ${expected}[1]    ${tol}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[9].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[8].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Compare Numbers    ${delta}    ${expected}[2]    ${tol}
    Comment    Third Iteration. Offset: x=-0.085300, y=-0.030000, z=-0.003100
    ${index}=    Set Variable    ${0}
    @{expected}=    Create List    ${-0.084500}    ${-0.031000}    ${-0.003100}
    @{actual}=    Convert To List    ${command_dataframe.iloc[0].round(4)}
    FOR    ${number}    IN    @{actual}    
        Compare Numbers    ${number}    ${expected}[${index}]    ${tol}
        ${index}=    Evaluate    ${index} + 1
    END
    ${initial_x}=    Set Variable    ${event_dataframe.iloc[1].iloc[0]}
    ${offset_x}=    Set Variable    ${event_dataframe.iloc[0].iloc[0]}
    ${delta}=    Evaluate    ${offset_x} - ${initial_x}
    Compare Numbers    ${delta}    ${expected}[0]    ${tol}
    ${initial_y}=    Set Variable    ${event_dataframe.iloc[1].iloc[1]}
    ${offset_y}=    Set Variable    ${event_dataframe.iloc[0].iloc[1]}
    ${delta}=    Evaluate    ${offset_y} - ${initial_y}
    Compare Numbers    ${delta}    ${expected}[1]    ${tol}
    ${initial_z}=    Set Variable    ${event_dataframe.iloc[1].iloc[2]}
    ${offset_z}=    Set Variable    ${event_dataframe.iloc[0].iloc[2]}
    ${delta}=    Evaluate    ${offset_z} - ${initial_z}
    Compare Numbers    ${delta}    ${expected}[2]    ${tol}
