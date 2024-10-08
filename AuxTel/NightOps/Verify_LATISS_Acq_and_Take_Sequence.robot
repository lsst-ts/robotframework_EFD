*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Collections
Force Tags    at_night_ops    acq_and_take_seq
Suite Setup    Run Keywords    Check If Failed    AND    Set Variables    ${playlist}

*** Variables ***
${playlist}    replace_me

*** Test Cases ***
Verify ATAOS Corrections Enabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATAOS    logevent_correctionEnabled    ["*",]    1    None
    Should Be True    $dataframe.atspectrograph.values
    Should Be True    $dataframe.hexapod.values
    Should Be True    $dataframe.m1.values

Load Camera Playlist
    [Tags]    execute
    ${result}=    Run Process    load_camera_playlist    at    ${playlist}    --no-repeat
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Run Keyword If    ${result.rc} == 1    Fatal Error

Verify ATCamera Playlist Loaded
    [Tags]
    Log    ${playlist_full_name}
    ${dataframe}=    Get Recent Samples    ATCamera    command_play    ["*",]    1    None
    Should Be Equal    ${dataframe.iloc[0].playlist}    ${playlist_full_name}

Execute AuxTel LATISS Acquire and Take Sequence
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_latiss_acquire_and_take_sequence    ${playlist}
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Check If Script Failed    ${states}

Verify ATDome AzimuthInPosition
    [Tags]
    Set Test Variable    ${minutes_ago}    1
    Verify Time Delta    ATDome    logevent_azimuthInPosition    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}    # Moving the dome can longer than the default 10s time window.
    Verify Time Delta    ATDome    command_moveAzimuth    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}    # Moving the dome can longer than the default 10s time window.
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["True",]

Verify ATPtg Target
    [Documentation]    Ensure the telescope is pointed at the correct target. If the do_acquire config is set to false,
    ...    the system assumes the telescope is already pointing at the intended target, so no movement command is issued.
    [Tags]    robot:continue-on-failure
    IF    "${playlist}" == "test"
        Log    "With do_acquire set to false, the telescope is not commanded to a target."
    ELSE
        ${output}=    Get Topic Sent Time    ATPtg    command_raDecTarget
        ${topic_sent}=    Convert Date    ${output}    result_format=datetime
        ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
        Should Be True    ${delta} > 0
        Verify Time Delta    ATPtg    logevent_currentTarget    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
        Verify Time Delta    ATPtg    command_raDecTarget    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
        ${cmd_dataframe}=    Get Recent Samples    ATPtg    command_raDecTarget    ["targetName", "ra", "declination",]    1    None
        Should Be Equal    ${cmd_dataframe.iloc[0].targetName}    HD164461
        Should Be Equal    ${cmd_dataframe.iloc[0].ra.round(6)}    ${18.913095}
        Should Be Equal    ${cmd_dataframe.iloc[0].declination.round(6)}    ${-87.605843}
    END
    ${evt_dataframe}=    Get Recent Samples    ATPtg    logevent_currentTarget    ["targetName", "raHours", "decDegs",]    1    None
    Should Be Equal    ${evt_dataframe.iloc[0].targetName}    HD164461
    Should Be Equal    ${evt_dataframe.iloc[0].raHours.round(6)}    ${18.913095}
    Should Be Equal    ${evt_dataframe.iloc[0].decDegs.round(6)}    ${-87.605843}

Verify ATCamera Image Sequence
    [Documentation]    Verify the ATCamera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Verify Sequence    ATCamera    command_takeImages    expTime    ${seq_length}    ${exp_time}
    Verify Sequence    ATCamera    logevent_startIntegration    exposureTime    ${seq_length}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_images}
        ${evt_image_type}=    Fetch From Left    ${evt_df.iloc[${i}].additionalValues}    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.iloc[${i}].keyValueMap}    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.iloc[${i}].numImages}    1
        Should Be True    ${cmd_df.iloc[${i}].shutter}
    END
    #imageType (ACQ, OBJECT)
    # if do_aqcquire==True, extra images, up to max_iter, are taken beyond the seq, to verify.

Verify ATOODS ImageInOODS
    [Tags]
    Wait Until Keyword Succeeds    60 sec    10 sec    Verify Image in OODS    ATOODS    ${image_names}[0][0]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.iloc[${i}].camera}    LATISS
        Should Be Equal As Strings    ${dataframe.iloc[${i}].description}    file ingested
        Should Be Equal As Strings    ${dataframe.iloc[${i}].obsid}    ${image_names}[0][${i}]
    END

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.iloc[${i}].id}    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.iloc[${i}].url.split("/")[-1]}    ${file_name}
    END
 
Verify ATSpectrograph ChangeFilter
    [Tags]
    ${output}=    Get Topic Sent Time    ATSpectrograph    command_changeFilter
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATSpectrograph    logevent_filterInPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeFilter    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    logevent_reportedFilterPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeFilter    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Topic Attribute    ATSpectrograph    logevent_filterInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph Filter
    [Tags]    DM-35582
    Verify Sequence    ATSpectrograph    logevent_reportedFilterPosition    band    ${seq_length}    ${filter_band}
    #Verify Sequence    ATSpectrograph    logevent_reportedFilterPosition    name    ${seq_length}    ${filter_name}    #DM-35582

Verify ATSpectrograph ChangeDisperser
    [Tags]
    ${output}=    Get Topic Sent Time    ATSpectrograph    command_changeDisperser
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATSpectrograph    logevent_disperserInPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    logevent_reportedDisperserPosition    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Time Delta    ATSpectrograph    command_changeDisperser    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    Verify Topic Attribute    ATSpectrograph    logevent_disperserInPosition    ["inPosition",]    [True,]

Verify ATSpectrograph Disperser
    [Tags]    DM-35582
    Verify Sequence    ATSpectrograph    logevent_reportedDisperserPosition    band    ${seq_length}    ${disperser_band}

Verify LinearStage MoveLinearStage
    [Tags]
    ${dataframe}=    Get Recent Samples    LinearStage    command_moveLinearStage    ["*",]    1    None
    Should Be Empty    ${dataframe}

*** Keywords ***
Set Variables
    [Documentation]    The seq_length is defined by the number of exposures.
    ...    The num_images is the sum of the sequence and some number of do_acquire iterations.
    ...    The img_type_seq is defined by the sequence of image types, in reverse order (dataframes are in time-descending order).
    [Arguments]    ${playlist}
    IF    "${playlist}" == "pointing"
        Set Suite Variable    ${playlist_full_name}    latiss_acquire_and_take_sequence-test_take_acquisition_pointing
        Set Suite Variable    ${seq_length}    1
        Set Suite Variable    ${num_images}    3
        Set Suite Variable    @{exp_time}    ${2}
        Set Suite Variable    @{filter_band}    EMPTY
        Set Suite Variable    ${filter_name}    empty_1
        Set Suite Variable    @{disperser_band}    EMPTY
        Set Suite Variable    @{disperser_name}    EMPTY
        Set Suite Variable    @{img_type_seq}    ACQ    ACQ    ACQ
    ELSE
        Fail    msg="Please set the playlist variable; allowed values are ['pointing']"
    END
