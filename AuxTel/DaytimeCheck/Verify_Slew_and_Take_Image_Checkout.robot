*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Process
Force Tags    slew_take_image_checkout
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

Execute AuxTel Slew and Take Image
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_slew_and_take_image_checkout
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

## Tests
Verify ATAOS Corrections Enabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Be True    $dataframe.atspectrograph.values
    Should Be True    $dataframe.hexapod.values
    Should Be True    $dataframe.m1.values

Verify ATDome Position for First Image
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_lastAzimuthGoTo    ["position",]    4    None
    Compare Numbers    ${dataframe.iloc[2].position}    45    0.5

Verify ATDome Position for Second Image
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_lastAzimuthGoTo    ["position", ]    4    None
    Should Be Equal As Integers    ${dataframe.iloc[1].position}    0

Verify ATDomeTrajectory followingMode was True
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDomeTrajectory    logevent_followingMode    ["enabled",]    2    None
    Should Be True    ${dataframe.iloc[1].enabled}

Verify ATMCS Tracking was True
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    3    None
    Should Be Equal As Numbers    ${dataframe.iloc[2].state}    9    # TRACKINGENABLED

Verify ATPneumatics m1CoverState is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.iloc[2]0state}    6    # Closed

Verify ATPneumatics m1CoverLimitSwitches are Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverLimitSwitches    ["*",]    1    None
    Should Not Be True    ${dataframe.iloc[0].cover1OpenedActive}
    Should Not Be True    ${dataframe.iloc[0].cover2OpenedActive}
    Should Not Be True    ${dataframe.iloc[0].cover3OpenedActive}
    Should Not Be True    ${dataframe.iloc[0].cover4OpenedActive}
    Should Be True    ${dataframe.iloc[0].cover1ClosedActive}
    Should Be True    ${dataframe.iloc[0].cover2ClosedActive}
    Should Be True    ${dataframe.iloc[0].cover3ClosedActive}
    Should Be True    ${dataframe.iloc[0].cover4ClosedActive}

# First Engineering Frame
Verify ATCamera First Engineering Frame Image Sequence
    [Documentation]    Verify the ATCamera first Engineering frame images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${2}
    ${img_type_seq}=    Set Variable    ENGTEST    # All images in this sequence are ENGTEST.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    2    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    2    None
    Set Suite Variable    @{image_names}    ${evt_df.iloc[0].imageName}
    Should Be Equal As Numbers    ${cmd_df.iloc[1].expTime}    ${exp_time}
    Should Be Equal As Numbers    ${evt_df.iloc[1].exposureTime}    ${exp_time}
    ${evt_image_type}=    Fetch From Left    ${evt_df.iloc[1].additionalValues}    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.iloc[1].keyValueMap}    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.iloc[1].numImages}    ${1}

Verify ATOODS First Engineering Frame ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    2    None
    Should Be Equal As Strings    ${dataframe.iloc[0].camera}    LATISS
    Should Be Equal As Strings    ${dataframe.iloc[0].description}    file ingested
    Should Be Equal As Strings    ${dataframe.iloc[0].obsid}    ${image_names}[0][0]

Verify ATHeaderService First Engineering Frame LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    2    None
    Should Be Equal As Strings    ${dataframe.iloc[1].id}    ${image_names}[0][1]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][1]    .yaml
    Should Be Equal As Strings    ${dataframe.iloc[1].url.split("/")[-1]}    ${file_name}

# Second Engineering Frame
Verify ATCamera Second Engineering Frame Image Sequence
    [Documentation]    Verify the ATCamera second Engineering frame images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${2}
    ${img_type_seq}=    Set Variable    ENGTEST    # All images in this sequence are ENGTEST.
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

Verify ATOODS Second Engineering Frame ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    1    None
    Should Be Equal As Strings    ${dataframe.iloc.camera}    LATISS
    Should Be Equal As Strings    ${dataframe.iloc.description}    file ingested
    Should Be Equal As Strings    ${dataframe.iloc.obsid}    ${image_names}[0]

Verify ATHeaderService Second Engineering Frame LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    1    None
    Should Be Equal As Strings    ${dataframe.iloc[0].id}    ${image_names}[0]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0]    .yaml
    Should Be Equal As Strings    ${dataframe.url[0].split("/")[-1]}    ${file_name}

# Cleanup
Verify AuxTel is Parked
    [Tags]    robot:continue-on-failure
    Verify Telescope Parked    auxtel
    Verify Dome Parked    auxtel

Verify ATMCS Tracking is False
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    1    None
    Should Be Equal As Numbers    ${dataframe.iloc[0].state}    8    # TRACKINGDISABLED

Verify ATDomeTrajectory followingMode is False
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDomeTrajectory    logevent_followingMode    ["*",]    1    None
    Should Not Be True    ${dataframe.iloc[0].enabled}]

