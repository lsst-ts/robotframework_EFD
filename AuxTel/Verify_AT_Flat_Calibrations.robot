*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    at_calibrations
Suite Setup    Set Variables

*** Variables ***
${time_window}    10

*** Test Cases ***
Load Camera Playlist
    [Tags]
    ${result}=    Run Process    load_camera_playlist    at    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify ATCamera Playlist Loaded 
    [Tags]
    Log    ${playlist_full_name}
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["*",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    ${playlist_full_name}

Execute AuxTel Flat Calibrations
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    auxtel_latiss_calibrations    --calib_type    flat
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify Runtime
    [Tags]    runtime    DM-37818
    Verify Script Runtime    ${script_start}    ${script_end}

Verify ATPtg Target
    [Documentation]    Ensure the telescope is pointed at the correct target, in this case at the Az/El of the flat-field screen.
    ...    This command is sent prior to the start of the script.
    [Tags]    robot:continue-on-failure
    ${cmd_dataframe}=    Get Recent Samples    ATPtg    command_raDecTarget    ["targetName", "ra", "declination",]    1    None
    Should Be Equal    ${cmd_dataframe.targetName.values}[0]    Flatfield position
    ${evt_dataframe}=    Get Recent Samples    ATPtg    logevent_currentTarget    ["targetName", "azDegs", "elDegs",]    1    None
    Should Be Equal    ${evt_dataframe.targetName.values}[0]    FlatField position
    Should Be Equal    ${evt_dataframe.azDegs.values.round(6)}[0]    ${0}
    Should Be Equal    ${evt_dataframe.elDegs.values.round(6)}[0]    ${0}

Verify ATPtg Tracking is Off
    [Tags]
    ${evt_df}=    Get Recent Samples    ATPtg    logevent_trackPosting    ["status"]    1    None
    Should Not Be True    ${evt_df.status.values}[0]
    Verify Time Delta    ATPtg    command_stopTracking    logevent_trackPosting    ${time_window}    

Verify ATSpectrograph Filter
    Verify Topic Attribute    ATSpectrograph    logevent_reportedFilterPosition    ["name",]    ${filter_name}    output=json
    ${evt_df}=    Get Recent Samples    ATSpectrograph    logevent_reportedFilterPosition    ["*",]    1    None
    Should Be Equal    ${evt_df.name.values}[0]    ${filter_name}

Verify ATCamera Image Sequence
    [Documentation]    Verify the ATCamera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Log Many    ${image_names}
    Verify Sequence    ATCamera    command_takeImages    expTime    ${num_images}    ${exp_time}
    Verify Sequence    ATCamera    logevent_startIntegration    exposureTime    ${num_images}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_images}
        ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${i}]    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${i}]    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.numImages.values}[${i}]    1
    END

Verify ATOODS ImageInOODS
    [Tags]    robot:continue-on-failure
    ${total_images}=    Evaluate    ${num_images} * 1
    Set Suite Variable    ${total_images}
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${total_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.camera.values}[${i}]    LATISS
        Should Be Equal As Strings    ${dataframe.description.values}[${i}]    file ingested
        Should Be Equal As Strings    ${dataframe.obsid.values}[${i}]    ${image_names}[0][${i}]
    END

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${total_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.id.values}[${i}]    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${i}]    .yaml
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
    # Exposure time: BIAS images have 0 for the exposure time.
    @{bias_exp_time}=    Evaluate    [${0}] * 10
    @{dark_exp_time}=    Evaluate    [${10}] * 10
    @{flat_exp_time}=    Evaluate    [${2}] * 10
    @{exp_time}=    Create List    @{bias_exp_time}    @{dark_exp_time}    @{flat_exp_time}
    Set Suite Variable    @{exp_time}
    # Filter and band.
    Set Suite Variable    ${filter_type}    r
    Set Suite Variable    @{filter_name}    SDSSr_65mm
    Set Suite Variable    @{disperser_band}    EMPTY
    Set Suite Variable    @{disperser_name}    EMPTY
