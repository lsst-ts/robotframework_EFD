*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     Collections
Force Tags    calibrations
Suite Setup    Run Keywords    Check If Failed    AND    Set EFD Values    AND    Set Variables

*** Variables ***

*** Test Cases ***
Load Camera Playlist
    [Tags]    execute    playlist
    ${result}=    Run Process    load_camera_playlist    cc    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify Camera Playlist Loaded
    [Tags]    playlist
    Log    ${playlist_full_name}
    ${dataframe}=    Get Recent Samples    ${BigCamera}    command_play    ["*",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    ${playlist_full_name}

Execute BigCamera Flat Calibrations
    [Tags]    execute    bigcamera
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${integration_script}=    Set Variable If    "${env_efd}" == "base_efd"    lsstcam_calibrations    comcam_calibrations
    ${scripts}    ${states}=    Execute Integration Test    ${integration_script}    flat
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify MTPtg Target
    [Documentation]    Ensure the telescope is pointed at the correct target, in this case at the Az/El of the flat-field screen.
    ...    This command is sent prior to the start of the script.
    [Tags]    bigcamera    robot:continue-on-failure
    Verify Time Delta    MTPtg    command_raDecTarget    logevent_currentTarget
    ${cmd_dataframe}=    Get Recent Samples    MTPtg    command_raDecTarget    ["targetName", "ra", "declination",]    1    None
    Should Be Equal    ${cmd_dataframe.targetName.values}[0]    Flatfield position
    ${evt_dataframe}=    Get Recent Samples    MTPtg    logevent_currentTarget    ["targetName", "azDegs", "elDegs",]    1    None
    Should Be Equal    ${evt_dataframe.targetName.values}[0]    Flatfield position
    Should Be Equal    ${evt_dataframe.azDegs.values.round(6)}[0]    ${0}
    Should Be Equal    ${evt_dataframe.elDegs.values.round(6)}[0]    ${0}

Verify MTPtg Tracking is Off
    [Tags]    bigcamera
    ${evt_df}=    Get Recent Samples    MTPtg    logevent_trackPosting    ["status"]    1    None
    Should Not Be True    ${evt_df.status.values}[0]
    Verify Time Delta    MTPtg    command_stopTracking    logevent_trackPosting    

Verify BigCamera Filter
    [Tags]    bigcamera
    ${evt_df}=    Get Recent Samples    ${BigCamera}    logevent_startSetFilter    ["filterName", "filterType"]    1    None
    Should Be Equal    ${evt_df.filterName.values}[0]    ${filter_name}
    Should Be Equal    ${evt_df.filterType.values}[0]    ${filter_type}

Verify Camera Image Sequence
    [Documentation]    Verify the Camera images are the correct type, with the correct exposure time.
    [Tags]    bigcamera    robot:continue-on-failure
    ${cmd_df}=    Get Recent Samples    ${BigCamera}    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ${BigCamera}    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Log Many    ${image_names}
    Verify Sequence    ${BigCamera}    command_takeImages    expTime    ${num_images}    ${exp_time}
    Verify Sequence    ${BigCamera}    logevent_startIntegration    exposureTime    ${num_images}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_images}
        ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${i}]    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${i}]    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.numImages.values}[${i}]    1
    END

Verify OODS ImageInOODS
    [Tags]    bigcamera    robot:continue-on-failure
    Wait Until Keyword Succeeds    60 sec    10 sec    Verify Image in OODS    ${OODS}    ${image_names}[0][0]
    ${total_images}=    Evaluate    ${num_images} * 9    # ComCam has 9 CCDs, so there are 9 times the images.
    Set Suite Variable    ${total_images}
    ${dataframe}=    Get Recent Samples    ${OODS}    logevent_imageInOODS    ["camera", "description", "obsid",]    ${total_images}    None
    Log    ${image_names}
    Log    ${dataframe.obsid.values}
    FOR    ${i}    IN RANGE    ${num_images}
        FOR    ${j}    IN RANGE    ${9}    # ComCam has 9 CCDs, so there are 9 times the images.
            ${k}=    Evaluate    ${i} * 9 + ${j}
            ${camera}=    Set Variable If    "${env_efd}" == "base_efd"    LSSTCam    LSSTComCam
            Should Be Equal As Strings    ${dataframe.camera.values}[${k}]    ${camera}
            Should Be Equal As Strings    ${dataframe.description.values}[${k}]    file ingested
            Should Be Equal As Strings    ${dataframe.obsid.values}[${k}]    ${image_names}[0][${i}]
        END
    END

Verify HeaderService LargeFileObjectAvailable
    [Tags]    bigcamera    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ${HeaderService}    logevent_largeFileObjectAvailable    ["id", "url",]    ${total_images}    None
    Log    ${image_names}
    Log    ${dataframe.id.values}
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.id.values}[${i}]    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    ${HeaderService}_header_    ${image_names}[0][${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.url[${i}].split("/")[-1]}    ${file_name}
    END
 
*** Keywords ***
Set Variables
    [Documentation]    The sequence length is defined by the number of exposures, num_images.
    ...    The img_type_seq is defined by the sequence of image types, in reverse order (dataframes are in time-descending order).
    Set Suite Variable    ${playlist_full_name}    bias_dark_flat
    # Image type.
    Set Suite Variable    ${num_images}    30    # 10 Bias + 10 Dark + 10 Flat
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
    Set Suite Variable    ${filter_type}    r
    Set Suite Variable    ${filter_name}    r_03
    Set Suite Variable    @{disperser_band}    EMPTY
    Set Suite Variable    @{disperser_name}    EMPTY
