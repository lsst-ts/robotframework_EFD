*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Process
Force Tags    slew_take_image_checkout
Suite Setup    Check If Failed

*** Variables ***
${time_window}    10

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
    Should Be Equal    ${dataframe.playlist.values}[0]    bias_dark_flat

Execute AuxTel Slew and Take Image
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_slew_and_take_image_checkout
    Verify Scripts Completed Successfully    ${scripts}    ${states}

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
    Compare Numbers    ${dataframe.position.values}[2]    45    0.5

Verify ATDome Position for Second Image
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDome    logevent_lastAzimuthGoTo    ["position", ]    4    None
    Should Be Equal As Integers    ${dataframe.position.values}[1]    0

Verify ATDomeTrajectory followingMode was True
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDomeTrajectory    logevent_followingMode    ["enabled",]    2    None
    Should Be True    ${dataframe.enabled.values}[1]

Verify ATMCS Tracking was True
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["state",]    3    None
    Should Be Equal As Numbers    ${dataframe.state.values}[2]    9    # TRACKINGENABLED

Verify ATPneumatics m1CoverState is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    6    # Closed

Verify ATPneumatics m1CoverLimitSwitches are Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    ATPneumatics    logevent_m1CoverLimitSwitches    ["*",]    1    None
    Should Not Be True    ${dataframe.cover1OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover2OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover3OpenedActive.values}[0]
    Should Not Be True    ${dataframe.cover4OpenedActive.values}[0]
    Should Be True    ${dataframe.cover1ClosedActive.values}[0]
    Should Be True    ${dataframe.cover2ClosedActive.values}[0]
    Should Be True    ${dataframe.cover3ClosedActive.values}[0]
    Should Be True    ${dataframe.cover4ClosedActive.values}[0]

# First Engineering Frame
Verify ATCamera First Engineering Frame Image Sequence
    [Documentation]    Verify the ATCamera first Engineering frame images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${2}
    ${img_type_seq}=    Set Variable    ENGTEST    # All images in this sequence are ENGTEST.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    2    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    2    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Should Be Equal As Numbers    ${cmd_df.expTime.values}[1]    ${exp_time}
    Should Be Equal As Numbers    ${evt_df.exposureTime.values}[1]    ${exp_time}
    ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[1]    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[1]    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.numImages.values}[1]    ${1}

Verify ATOODS First Engineering Frame ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    2    None
    Should Be Equal As Strings    ${dataframe.camera.values}[0]    LATISS
    Should Be Equal As Strings    ${dataframe.description.values}[0]    file ingested
    Should Be Equal As Strings    ${dataframe.obsid.values}[0]    ${image_names}[0][0]

Verify ATHeaderService First Engineering Frame LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    2    None
    Should Be Equal As Strings    ${dataframe.id.values}[1]    ${image_names}[0][1]
    ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][1]    .yaml
    Should Be Equal As Strings    ${dataframe.url[1].split("/")[-1]}    ${file_name}

# Second Engineering Frame
Verify ATCamera Second Engineering Frame Image Sequence
    [Documentation]    Verify the ATCamera second Engineering frame images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${seq_length}=    Set Variable    ${1}
    ${exp_time}=    Set Variable    ${2}
    ${img_type_seq}=    Set Variable    ENGTEST    # All images in this sequence are ENGTEST.
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    1    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    1    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}[0]
    Should Be Equal As Numbers    ${cmd_df.expTime.values}[0]    ${exp_time}
    Should Be Equal As Numbers    ${evt_df.exposureTime.values}[0]    ${exp_time}
    ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[0]    :
    Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}
    ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[0]    ,
    ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
    Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}
    Should Be Equal As Numbers    ${cmd_df.numImages.values}[0]    ${1}

Verify ATOODS Second Engineering Frame ImageInOODS
    [Tags]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    1    None
    Should Be Equal As Strings    ${dataframe.camera.values}[0]    LATISS
    Should Be Equal As Strings    ${dataframe.description.values}[0]    file ingested
    Should Be Equal As Strings    ${dataframe.obsid.values}[0]    ${image_names}[0]

Verify ATHeaderService Second Engineering Frame LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    1    None
    Should Be Equal As Strings    ${dataframe.id.values}[0]    ${image_names}[0]
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
    Should Be Equal As Numbers    ${dataframe.state.values}[0]    8    # TRACKINGDISABLED

Verify ATDomeTrajectory followingMode is False
    [Tags]
    ${dataframe}=    Get Recent Samples    ATDomeTrajectory    logevent_followingMode    ["*",]    1    None
    Should Not Be True    ${dataframe.enabled.values}[0]

