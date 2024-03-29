*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Process
Force Tags    latiss_checkout
Suite Setup    Check If Failed

*** Variables ***

*** Test Cases ***
Load Camera Playlist
    [Tags]    execute
    ${result}=    Run Process    load_camera_playlist    at    master_flat    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify ATCamera Playlist Loaded
    [Documentation]    Playlist should already be loaded, ensure nothing was changed prior to running this script.
    [Tags]
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["playlist", "repeat", "private_identity", "private_origin",]    1    None
    Should Be Equal    ${dataframe.iloc[0].playlist}    bias_dark_flat

Execute LATISS Checkout
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_latiss_checkout
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

# Bias Frame
Verify ATCamera Bias Frame Image Sequence
    [Documentation]    Verify the ATCamera Bias Frame images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${0}
    ${img_type_seq}=    Set Variable    BIAS    # Sequence is reversed; EFD is in time-descending order.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    2    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    2    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Should Be Equal As Numbers    ${cmd_df.iloc[1].expTime}    ${exp_time}
    Should Be Equal As Numbers    ${evt_df.iloc[1].exposureTime}    ${exp_time}
    ${evt_image_type}=    Fetch From Left    ${evt_df.iloc[1].additionalValues}    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.iloc[1].keyValueMap}    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.iloc[1].numImages}    ${1}

Verify ATOODS Bias Frame ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    2    None
    Should Be Equal As Strings    ${dataframe.camera.iloc[0]}    LATISS
    Should Be Equal As Strings    ${dataframe.iloc[0].description}    file ingested
    Should Be Equal As Strings    ${dataframe.iloc[0].obsid}    ${image_names}[0][0]

Verify ATHeaderService Bias Frame LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    2    None
    Should Be Equal As Strings    ${dataframe.iloc[1].id}    ${image_names}[0][1]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][1]    .yaml
    Should Be Equal As Strings    ${dataframe.iloc[1].url.split("/")[-1]}    ${file_name}

# Engineering Frame
Verify ATCamera Engineering Frame Image Sequence
    [Documentation]    Verify the ATCamera Engineering Frame images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${2}
    ${img_type_seq}=    Set Variable    ENGTEST    # Sequence is reversed; EFD is in time-descending order.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    1    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    1    None
    Set Suite Variable    @{image_names}    ${evt_df.iloc[0].imageName}
    Should Be Equal As Numbers    ${cmd_df.iloc[0].expTime}    ${exp_time}
    Should Be Equal As Numbers    ${evt_df.iloc[0].exposureTime}    ${exp_time}
    ${evt_image_type}=    Fetch From Left    ${evt_df.iloc[0].additionalValues}    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.iloc[0].keyValueMap}    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.iloc[0].numImages}    ${1}

Verify ATOODS Engineering Frame ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    1    None
    Should Be Equal As Strings    ${dataframe.iloc[0].camera}    LATISS
    Should Be Equal As Strings    ${dataframe.iloc[0].description}    file ingested
    Should Be Equal As Strings    ${dataframe.iloc[0].obsid}    ${image_names}[0]

Verify ATHeaderService Engineering Frame LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    1    None
    Should Be Equal As Strings    ${dataframe.iloc[0].id}    ${image_names}[0]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0]    .yaml
    Should Be Equal As Strings    ${dataframe.iloc[0].url.split("/")[-1]}    ${file_name}
