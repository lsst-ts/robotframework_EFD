*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     Collections
Force Tags    bigcamera_imaging    calibrations
Suite Setup    Run Keywords    Set EFD Values    AND    Set Variables

*** Variables ***

*** Test Cases ***
Move Dome to Flatfield Position
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_slew_dome    328    --ignore=mtm1m3,mtm2,mtaos,mthexapod_1,mthexapod_2,mtmount,mtptg,mtrotator
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify Dome Flatfield Position
    [Tags]    robot:continue-on-failure
    ${evt_df}=    Get Recent Samples    MTDome    azimuth    ["positionActual", "positionCommanded","velocityActual","velocityCommanded",]    1    None
    Should Not Be Empty    ${evt_df}
    Should Be Equal As Numbers    ${dome_flat}    ${evt_df.positionActual.values}[0]
    Should Be Equal As Numbers    ${dome_flat}    ${evt_df.positionCommanded.values}[0]
    Should Be Equal As Numbers    ${0}    ${evt_df.velocityActual.values}[0]
    Should Be Equal As Numbers    ${0}    ${evt_df.velocityCommanded.values}[0]

Engage MTDome Brakes
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    run_command    1    MTDome    stop    --parameters=engageBrakes:true,subSystemIds:1
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify MTDome Brakes are Engaged
    [Tags]    robot:continue-on-failure    OSW-1408
    ${dataframe}=    Get Recent Samples    MTDome    logevent_azMotion    ["state","inPosition"]    1    None
    Should Not Be Empty    ${dataframe}
    Log    ${dataframe}
    Should Be Equal As Numbers    ${dataframe.state.values}[0]    13    # MotionState_Stopped_Braked
    Should Be True    ${dataframe.inPosition.values}
    # The MTDome simulator currently does not publish logevent_brakesEngaged.
    ${dataframe}=    Get Recent Samples    MTDome    logevent_brakesEngaged    ["brakes"]    1    None
    # Should Not Be Empty    ${dataframe}
    Log    ${dataframe}
 
Move Telescope to Flatfield Position
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_point_azel    -126.2    22.0    --target_name=flatfield    --ignore=mtdome,mtdometrajectory
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify MTPtg Target
    [Documentation]    Ensure the telescope is pointed at the correct target, in this case at the Az/El of the flat-field screen.
    ...    This command is sent prior to the start of the script.
    [Tags]    robot:continue-on-failure
    Verify Time Delta    MTPtg    logevent_currentTarget    second=${seconds_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    MTPtg    command_azElTarget    second=${seconds_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    ${cmd_dataframe}=    Get Recent Samples    MTPtg    command_azElTarget    ["targetName", "azDegs", "elDegs",]    1    None
    Should Be Equal As Strings    ${cmd_dataframe.targetName.values}[0]    flatfield
    Should Be Equal As Numbers    ${cmd_dataframe.azDegs.values.round(6)}[0]    ${az_flat}
    Should Be Equal As Numbers    ${cmd_dataframe.elDegs.values.round(6)}[0]    ${el_flat}
    ${evt_dataframe}=    Get Recent Samples    MTPtg    logevent_currentTarget    ["targetName", "azDegs", "elDegs",]    1    None
    Should Be Equal As Strings    ${evt_dataframe.targetName.values}[0]    flatfield
    Should Be Equal As Numbers    ${evt_dataframe.azDegs.values.round(6)}[0]    ${az_flat}
    Should Be Equal As Numbers    ${evt_dataframe.elDegs.values.round(6)}[0]    ${el_flat}

Stop Telescope Tracking
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    run_command    1    MTPtg    stopTracking
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify MTPtg Tracking is Off
    [Tags]    robot:continue-on-failure
    ${evt_df}=    Get Recent Samples    MTPtg    logevent_trackPosting    ["status"]    1    None
    Should Not Be True    ${evt_df.status.values}[0]
    Verify Time Delta    MTPtg    logevent_trackPosting    second=${seconds_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    MTPtg    command_stopTracking    second=${seconds_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Open Mirror Covers
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_open_mirror_covers
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify Mirror Covers are Open
    [Tags]    robot:continue-on-failure
    ${evt_df}=    Get Recent Samples    MTMount    logevent_mirrorCoversMotionState    ["elementsState0","elementsState1","elementsState2","elementsState3","state"]    2    None
    Should Not Be Empty    ${evt_df}
    Log    ${evt_df}
    Should Be Equal As Integers    ${evt_df.iloc[0].elementsState0}    0    # 0 is RETRACTED, meaning the cover lock 0 is open.
    Should Be Equal As Integers    ${evt_df.iloc[0].elementsState1}    0    # 0 is RETRACTED, meaning the cover lock 1 is open.
    Should Be Equal As Integers    ${evt_df.iloc[0].elementsState2}    0    # 0 is RETRACTED, meaning the cover lock 2 is open.
    Should Be Equal As Integers    ${evt_df.iloc[0].elementsState3}    0    # 0 is RETRACTED, meaning the cover lock 3 is open.
    Should Be Equal As Integers    ${evt_df.iloc[0].state}    0    # 0 is RETRACTED, meaning the cover is open; aggragate state.

Verify BigCamera Filter
    [Tags]    robot:continue-on-failure
    ${evt_df}=    Get Recent Samples    ${BigCamera}    logevent_startSetFilter    ["filterName", "filterType"]    1    None
    Should Be Equal    ${evt_df.filterName.values}[0]    ${filter_name}
    Should Be Equal    ${evt_df.filterType.values}[0]    ${filter_type}

Load Camera Playlist
    [Tags]    execute    playlist
    ${result}=    Run Process    load_camera_playlist    ${bigcam}    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify Camera Playlist Loaded
    [Tags]    playlist
    Log    ${playlist_full_name}
    Wait Until Keyword Succeeds    5s    1s    Verify Topic Attribute    ${BigCamera}    command_play    ["playlist"]    ["${playlist_full_name}"]
    ${dataframe}=    Get Recent Samples    ${BigCamera}    command_play    ["*",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    ${playlist_full_name}

Execute BigCamera Flat Calibrations
    [Tags]    execute
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${integration_script}=    Set Variable If    "${env_efd}" == "base_efd"    lsstcam_calibrations    comcam_calibrations
    ${scripts}    ${states}=    Execute Integration Test    ${integration_script}    flat    --wait=30
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify Camera Image Sequence
    [Documentation]    Verify the Camera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${cmd_df}=    Get Recent Samples    ${BigCamera}    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_exps}    None
    ${evt_df}=    Get Recent Samples    ${BigCamera}    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_exps}    None
    @{image_names}=    Create List    @{evt_df.imageName.values}
    Log Many    @{image_names}
    Set Suite Variable    @{image_names}
    Verify Sequence    ${BigCamera}    command_takeImages    expTime    ${num_exps}    ${exp_time}
    Verify Sequence    ${BigCamera}    logevent_startIntegration    exposureTime    ${num_exps}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_exps}
        ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${i}]    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${i}]    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Integers    ${cmd_df.numImages.values}[${i}]    1
    END

Verify OODS ImageInOODS
    [Tags]    robot:continue-on-failure
    Log Many    @{image_names}
    Wait Until Keyword Succeeds    60 sec    10 sec    Verify Image in OODS    ${OODS}    ${image_names}[0]
    FOR    ${img}    IN    @{image_names}
        ${oods_image_df}=    Influxdb Query    ${OODS}    logevent_imageInOODS    camera,description,obsid    limit=200    where_clause=Where obsid=~/${img}/
        Log    ${oods_image_df.shape[0]}
        Should Be Equal As Integers    ${oods_image_df.shape[0]}    ${total_images}
    END
    #FOR    ${i}    IN RANGE    ${num_exps}
        #FOR    ${j}    IN RANGE    ${total_images}
            #${k}=    Evaluate    ${i} * ${total_images} + ${j}
            #${camera}=    Set Variable If    "${env_efd}" == "base_efd"    LSSTCam    LSSTComCam
            #Should Be Equal As Strings    ${dataframe.camera.values}[${k}]    ${camera}
            #Should Be Equal As Strings    ${dataframe.description.values}[${k}]    file ingested
            #Should Be Equal As Strings    ${dataframe.obsid.values}[${k}]    ${image_names}[0][${i}]
        #END
    #END

Verify HeaderService LargeFileObjectAvailable
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ${HeaderService}    logevent_largeFileObjectAvailable    ["id", "url",]    ${total_images}    None
    Log    ${image_names}
    Log    ${dataframe.id.values}
    Log    ${dataframe.id.count}
    FOR    ${i}    IN RANGE    ${num_exps}
        Should Be Equal As Strings    ${dataframe.id.values}[${i}]    ${image_names}[${i}]
        ${file_name}=    Catenate    SEPARATOR=    ${HeaderService}_header_    ${image_names}[${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.url.iloc[${i}].split("/")[-1]}    ${file_name}
    END
 
*** Keywords ***
Set Variables
    [Documentation]    The sequence length is defined by the number of exposures, num_exps.
    ...    The img_type_seq is defined by the sequence of image types, in reverse order (dataframes are in time-descending order).
    ${bigcam}=    Set Variable If    "${env_efd}" == "base_efd"    mt    cc
    Set Suite Variable    ${bigcam}
    Set Suite Variable    ${playlist_full_name}    bias_dark_flat
    # Flatfield position.
    Set Suite Variable    ${az_flat}    -126.2
    Set Suite Variable    ${el_flat}    22.0
    Set Suite Variable    ${dome_flat}    328
    # Total images.
    Set Suite Variable    ${num_exps}    30    # 10 Bias + 10 Dark + 10 Flat
    Set Suite Variable    ${comcam_images}    9    # ComCam has 9 CCDs.
    Set Suite Variable    ${lsstcam_images}    197    # LSSTCam has 189 science + 8 wavefront CCDs.
    ${total_images}=    Set Variable If    "${env_efd}" == "base_efd"    ${lsstcam_images}    ${comcam_images}
    Set Suite Variable    ${total_images}
    # Image type.
    @{n_flat}=    Evaluate    ["FLAT"] * 10
    @{n_dark}=    Evaluate    ["DARK"] * 10
    @{n_bias}=    Evaluate    ["BIAS"] * 10
    @{img_type_seq}=    Create List    @{n_flat}    @{n_dark}     @{n_bias}
    Set Suite Variable    @{img_type_seq}
    # Exposure time; BIAS images have 0 for the exposure time.
    @{bias_exp_time}=    Evaluate    [${0}] * 10
    @{dark_exp_time}=    Evaluate    [${20}] * 10
    @{flat_exp_time}=    Evaluate    [${5}] * 10
    @{exp_time}=    Create List    @{bias_exp_time}    @{dark_exp_time}    @{flat_exp_time}
    Set Suite Variable    @{exp_time}   
    # Filter and band.
    ${filter_type}=    Set Variable If    "${env_efd}" == "base_efd"    r    r
    ${filter_name}=    Set Variable If    "${env_efd}" == "base_efd"    r_57    r_03
    Set Suite Variable    ${filter_type}
    Set Suite Variable    ${filter_name}
    Set Suite Variable    @{disperser_band}    EMPTY
    Set Suite Variable    @{disperser_name}    EMPTY
