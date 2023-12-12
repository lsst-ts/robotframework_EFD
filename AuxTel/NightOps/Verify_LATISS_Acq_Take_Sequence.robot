*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Resource    ../../Common_Keywords.resource
Library     Collections
Force Tags    at_night_ops    acq_take_seq
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
    Should Be Equal    ${dataframe.playlist.values}[0]    ${playlist_full_name}

Execute AuxTel LATISS Acquire and Take Sequence
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_latiss_acquire_and_take_sequence    ${playlist}
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATDome AzimuthInPosition
    [Tags]
    Verify Time Delta    ATDome    command_moveAzimuth    logevent_azimuthInPosition    60    # Moving the dome can longer than the default 10s time window.
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
        Verify Time Delta    ATPtg    command_raDecTarget    logevent_currentTarget
        ${cmd_dataframe}=    Get Recent Samples    ATPtg    command_raDecTarget    ["targetName", "ra", "declination",]    1    None
        Should Be Equal    ${cmd_dataframe.targetName.values}[0]    HD164461
        Should Be Equal    ${cmd_dataframe.ra.values.round(6)}[0]    ${18.913095}
        Should Be Equal    ${cmd_dataframe.declination.values.round(6)}[0]    ${-87.605843}
    END
    ${evt_dataframe}=    Get Recent Samples    ATPtg    logevent_currentTarget    ["targetName", "raHours", "decDegs",]    1    None
    Should Be Equal    ${evt_dataframe.targetName.values}[0]    HD164461
    Should Be Equal    ${evt_dataframe.raHours.values.round(6)}[0]    ${18.913095}
    Should Be Equal    ${evt_dataframe.decDegs.values.round(6)}[0]    ${-87.605843}

Verify ATCamera Image Sequence
    [Documentation]    Verify the ATCamera images are the correct type, with the correct exposure time.
    [Tags]    robot:continue-on-failure
    ${cmd_df}=    Get Recent Samples    ATCamera    command_takeImages    ["expTime", "keyValueMap", "numImages", "shutter",]    ${num_images}    None
    ${evt_df}=    Get Recent Samples    ATCamera    logevent_startIntegration    ["additionalValues", "exposureTime", "imageName"]    ${num_images}    None
    Set Suite Variable    @{image_names}    ${evt_df.imageName.values}
    Verify Sequence    ATCamera    command_takeImages    expTime    ${seq_length}    ${exp_time}
    Verify Sequence    ATCamera    logevent_startIntegration    exposureTime    ${seq_length}    ${exp_time}
    FOR    ${i}    IN RANGE    ${num_images}
        ${evt_image_type}=    Fetch From Left    ${evt_df.additionalValues.values}[${i}]    :
        Should Be Equal As Strings    ${evt_image_type}    ${img_type_seq}[${i}]
        ${image_type_str}=    Fetch From Left    ${cmd_df.keyValueMap.values}[${i}]    ,
        ${cmd_image_type}=    Fetch From Right    ${image_type_str}    :${SPACE}
        Should Be Equal As Strings    ${cmd_image_type}    ${img_type_seq}[${i}]
        Should Be Equal As Numbers    ${cmd_df.numImages.values}[${i}]    1
        Should Be True    ${cmd_df.shutter.values}[${i}]
    END
    #imageType (ACQ, OBJECT)
    # if do_aqcquire==True, extra images, up to max_iter, are taken beyond the seq, to verify.

Verify ATOODS ImageInOODS
    [Tags]
    Wait Until Keyword Succeeds    60 sec    10 sec    Verify Image in OODS    ATOODS    ${image_names}[0][0]
    ${dataframe}=    Get Recent Samples    ATOODS    logevent_imageInOODS    ["camera", "description", "obsid",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.camera.values}[${i}]    LATISS
        Should Be Equal As Strings    ${dataframe.description.values}[${i}]    file ingested
        Should Be Equal As Strings    ${dataframe.obsid.values}[${i}]    ${image_names}[0][${i}]
    END

Verify ATHeaderService LargeFileObjectAvailable
    [Tags]
    ${dataframe}=    Get Recent Samples    ATHeaderService    logevent_largeFileObjectAvailable    ["id", "url",]    ${num_images}    None
    FOR    ${i}    IN RANGE    ${num_images}
        Should Be Equal As Strings    ${dataframe.id.values}[${i}]    ${image_names}[0][${i}]
        ${file_name}=    Catenate    SEPARATOR=    ATHeaderService_header_    ${image_names}[0][${i}]    .yaml
        Should Be Equal As Strings    ${dataframe.url[${i}].split("/")[-1]}    ${file_name}
    END
 
Verify ATSpectrograph ChangeFilter
    [Tags]
    ${output}=    Get Topic Sent Time    ATSpectrograph    command_changeFilter
    ${topic_sent}=    Convert Date    ${output}    result_format=datetime
    ${delta}=    Subtract Date From Date    ${topic_sent}    ${script_start}
    Should Be True    ${delta} > 0
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_filterInPosition
    Verify Time Delta    ATSpectrograph    command_changeFilter    logevent_reportedFilterPosition
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
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_disperserInPosition
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_reportedDisperserPosition
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
    ELSE IF    "${playlist}" == "verify"
        Set Suite Variable    ${playlist_full_name}    latiss_acquire_and_take_sequence-test_take_acquisition_with_verification
        Set Suite Variable    ${seq_length}    1
        Set Suite Variable    ${num_images}    3
        Set Suite Variable    @{exp_time}    ${0.4}
        Set Suite Variable    @{filter_band}    r
        Set Suite Variable    ${filter_name}    "SDSSr"
        Set Suite Variable    @{disperser_band}    EMPTY
        Set Suite Variable    @{disperser_name}    EMPTY
        Set Suite Variable    @{img_type_seq}    ACQ    ACQ    ACQ
    ELSE IF    "${playlist}" == "test"
        Set Suite Variable    ${playlist_full_name}    latiss_acquire_and_take_sequence-test_take_sequence
        Set Suite Variable    ${seq_length}    3
        Set Suite Variable    ${num_images}    3
        Set Suite Variable    @{exp_time}    ${5.0}    ${5.0}    ${5.0}
        Set Suite Variable    @{filter_band}    r    r    r
        Set Suite Variable    ${filter_name}    "SDSSr"
        Set Suite Variable    @{disperser_band}    H4-003    H4-003    H4-003
        Set Suite Variable    @{disperser_name}    holo4_003    holo4_003    holo4_003
        Set Suite Variable    @{img_type_seq}    OBJECT    OBJECT    OBJECT
    ELSE IF    "${playlist}" == "nominal"
        Set Suite Variable    ${playlist_full_name}    latiss_acquire_and_take_sequence-test_take_acquisition_nominal
        Set Suite Variable    ${seq_length}    3
        Set Suite Variable    ${num_images}    5
        Set Suite Variable    @{exp_time}    ${4.0}    ${4.0}    ${1.0}
        Set Suite Variable    @{filter_band}    r    r    r
        Set Suite Variable    ${filter_name}    "SDSSr"
        Set Suite Variable    @{disperser_band}    H4-003    H4-003    EMPTY
        Set Suite Variable    @{disperser_name}    holo4_003    holo4_003    empty_1
        Set Suite Variable    @{img_type_seq}    OBJECT    OBJECT    OBJECT    ACQ    ACQ
    ELSE
        Fail    msg="Please set the playlist variable; allowed values are ['pointing', 'verify', 'nominal', 'test']"
    END
