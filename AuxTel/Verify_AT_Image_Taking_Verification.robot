*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Process
Force Tags    image_taking_verification

*** Variables ***
${time_window}    10

*** Test Cases ***
Load Camera Playlist
    [Tags]
    ${result}=    Run Process    load_camera_playlist    at    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Execute AuxTel Image Taking Test
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    auxtel_image_taking
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify Runtime
    [Tags]    runtime    DM-36864
    Verify Script Runtime    ${script_start}    ${script_end}

Verify ATCamera Playlist Loaded
    [Documentation]    Playlist should already be loaded, ensure nothing was changed prior to running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["playlist", "repeat", "private_identity", "private_origin",]    1    None
    Should Be Equal    ${dataframe.playlist.values}[0]    bias_dark_flat.playlist

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
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    Should Be Equal As Strings    ${dataframe.camera.values}[${0}]    LATISS
    Should Be Equal As Strings    ${dataframe.description.values}[${0}]    file ingested
    Should Be Equal As Strings    ${dataframe.obsid.values}[${0}]    ${image_names}[0][${0}]

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    Should Be Equal As Strings    ${dataframe.id.values}[${0}]    ${image_names}[0][${0}]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${0}]    .yaml
    Should Be Equal As Strings    ${dataframe.url[0].split("/")[-1]}    ${file_name}
