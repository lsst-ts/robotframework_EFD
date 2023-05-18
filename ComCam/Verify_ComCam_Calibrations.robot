*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    cc_calibrations
Suite Setup    Set Variables

*** Variables ***
${time_window}    10

*** Test Cases ***
Load Camera Playlist
    [Tags]
    ${result}=    Run Process    load_camera_playlist    cc    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify CCCamera Playlist Loaded
    [Tags]
    Log    ${playlist_full_name}
    ${dataframe}=    Get Recent Samples    CCCamera    command_play    ["*",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    ${playlist_full_name}

Execute ComCam Flat Calibrations
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    comcam_calibrations    --calib_type    flat
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTPtg Target
    [Documentation]    Ensure the telescope is pointed at the correct target, in this case at the Az/El of the flat-field screen.
    ...    This command is sent prior to the start of the script.
    [Tags]    robot:continue-on-failure
    Verify Time Delta    MTPtg    command_raDecTarget    logevent_currentTarget    ${time_window}
    ${cmd_dataframe}=    Get Recent Samples    MTPtg    command_raDecTarget    ["targetName", "ra", "declination",]    1    None
    Should Be Equal    ${cmd_dataframe.targetName.values}[0]    Flatfield position
    ${evt_dataframe}=    Get Recent Samples    MTPtg    logevent_currentTarget    ["targetName", "azDegs", "elDegs",]    1    None
    Should Be Equal    ${evt_dataframe.targetName.values}[0]    Flatfield position
    Should Be Equal    ${evt_dataframe.azDegs.values.round(6)}[0]    ${0}
    Should Be Equal    ${evt_dataframe.elDegs.values.round(6)}[0]    ${0}

Verify MTPtg Tracking is Off
    [Tags]
    ${evt_df}=    Get Recent Samples    MTPtg    logevent_trackPosting    ["status"]    1    None
    Should Not Be True    ${evt_df.status.values}[0]
    Verify Time Delta    MTPtg    command_stopTracking    logevent_trackPosting    ${time_window}    

Verify CCCamera Filter
    ${evt_df}=    Get Recent Samples    CCCamera    logevent_startSetFilter    ["filterName", "filterType"]    1    None
    Should Be Equal    ${evt_df.filterName.values}[0]    ${filter_name}
    Should Be Equal    ${evt_df.filterType.values}[0]    ${filter_type}

Verify CCCamera Image Sequence
    [Documentation]    Verify the CCCamera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${cmd_df}=    Get Recent Samples    CCCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    CCCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Log Many    ${image_names}
    Verify Sequence    CCCamera    command_takeImages    expTime    ${num_images}    ${exp_time}
    Verify Sequence    CCCamera    logevent_startIntegration    exposureTime    ${num_images}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_images}
        ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${i}]    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${i}]    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.numImages.values}[${i}]    1
    END

Verify CCOODS ImageInOODS
    [Tags]    robot:continue-on-failure
    ${total_images}=    Evaluate    ${num_images} * 9    # ComCam has 9 CCDs, so there are 9 times the images.
    Set Suite Variable    ${total_images}
    ${dataframe}=    Get Recent Samples    CCOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${total_images}    None
    Log    ${image_names}
    Log    ${dataframe.obsid.values}
    FOR    ${i}    IN RANGE    ${num_images}
        FOR    ${j}    IN RANGE    ${9}    # ComCam has 9 CCDs, so there are 9 times the images.
            ${k}=    Evaluate    ${i} * 9 + ${j}
            Should Be Equal As Strings    ${dataframe.camera.values}[${k}]    LSSTComCam
            Should Be Equal As Strings    ${dataframe.description.values}[${k}]    file ingested
            Should Be Equal As Strings    ${dataframe.obsid.values}[${k}]    ${image_names}[0][${i}]
        END
    END

Verify CCHeaderService LargeFileObjectAvailable
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    CCHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${total_images}    None
    Log    ${image_names}
    Log    ${dataframe.id.values}
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.id.values}[${i}]    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    CCHeaderService_header_    ${image_names}[0][${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.url[${i}].split("/")[-1]}    ${file_name}
    END
 
*** Keywords ***
Set Variables
    [Documentation]    The sequence length is defined by the number of exposures, num_images.
    ...    The img_type_seq is defined by the sequence of image types, in reverse order (dataframes are in time-descending order).
    Set Suite Variable    ${playlist_full_name}    bias_dark_flat.playlist
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
