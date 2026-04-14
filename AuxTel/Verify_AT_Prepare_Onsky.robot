*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    auxtel_prep_onsky

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Load Camera Playlist
    [Tags]    execute
    ${result}=    Run Process    load_camera_playlist    at    bias    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify ATCamera Playlist Loaded
    [Documentation]    Playlist should already be loaded, ensure nothing was changed prior to running this script.
    [Tags]
    Wait Until Keyword Succeeds    5s    1s    Verify Topic Attribute    ATCamera    command_play    ["playlist"]    ["bias"]
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["playlist", "repeat", "private_identity", "private_origin",]    1    None

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

Verify ATCamera Image Sequence
    [Documentation]    Verify the ATCamera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    Set Suite Variable    ${num_images}    ${1}    # Needed by Verify ATOODS ImageInOODS test case.
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${0}
    ${img_type_seq}=    Set Variable    BIAS    # Sequence is reversed; EFD is in time-descending order.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Verify Topic Attribute    ATCamera    command_takeImages    ["expTime",]    [${exp_time},]
    Verify Topic Attribute    ATCamera    logevent_startIntegration    ["exposureTime",]    [${exp_time},]
    ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${0}]    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${0}]    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.numImages.values}[${0}]    1

Verify ATOODS ImageInOODS
    [Tags]
    Wait Until Keyword Succeeds    60 sec    10 sec    Verify Image in OODS    ATOODS    ${image_names}[0][0]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    Should Be Equal As Strings    ${dataframe.camera.values}[${0}]    LATISS
    Should Be Equal As Strings    ${dataframe.description.values}[${0}]    file ingested
    Should Be Equal As Strings    ${dataframe.obsid.values}[${0}]    ${image_names}[0][${0}]

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    Should Be Equal As Strings    ${dataframe.iloc[${0}].id}    ${image_names}[0][${0}]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${0}]    .yaml
    Should Be Equal As Strings    ${dataframe.iloc[0].url.split("/")[-1]}    ${file_name}
