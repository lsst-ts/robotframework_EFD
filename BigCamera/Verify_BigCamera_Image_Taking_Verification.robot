*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     Process
Force Tags    bigcamera    image_taking_verification
Suite Setup    Check If Failed    AND    Set EFD Values

*** Variables ***
${time_window}    10

*** Test Cases ***
Load Camera Playlist
    [Tags]    execute
    ${result}=    Run Process    load_camera_playlist    cc    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify Camera Playlist Loaded
    [Documentation]    Playlist should already be loaded, ensure nothing was changed prior to running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ${BigCamera}    command_play    ["playlist", "repeat", "private_identity", "private_origin",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    bias_dark_flat

Execute ComCam Image Taking Test
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    comcam_image_taking
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify Camera Image Sequence
    [Documentation]    Verify the Camera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    Set Suite Variable    ${num_images}    ${1}    # Needed by Verify CCOODS ImageInOODS test case.
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${0}
    ${img_type_seq}=    Set Variable    BIAS    # Sequence is reversed; EFD is in time-descending order.
    ${cmd_df}=    Get Recent Samples    ${BigCamera}    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ${BigCamera}    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Verify Topic Attribute    ${BigCamera}    command_takeImages    ["expTime",]    [${exp_time},]
    Verify Topic Attribute    ${BigCamera}    logevent_startIntegration    ["exposureTime",]    [${exp_time},]
    ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${0}]    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${0}]    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.numImages.values}[${0}]    1

Verify OODS ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ${OODS}    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    Should Be Equal As Strings    ${dataframe.camera.values}[${0}]    LSSTComCam
    Should Be Equal As Strings    ${dataframe.description.values}[${0}]    file ingested
    Should Be Equal As Strings    ${dataframe.obsid.values}[${0}]    ${image_names}[0][${0}]

Verify HeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ${HeaderService}    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    Should Be Equal As Strings    ${dataframe.id.values}[${0}]    ${image_names}[0][${0}]
    ${file_name}=    Catenate    SEPARATOR=    ${HeaderService}_header_    ${image_names}[0][${0}]    .yaml
    Should Be Equal As Strings    ${dataframe.url[0].split("/")[-1]}    ${file_name}
