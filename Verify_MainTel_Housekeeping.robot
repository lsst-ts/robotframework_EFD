*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Force Tags    mthousekeeping
Suite Setup    Run Keywords    Check If Failed    AND    Set EFD Values

*** Variables ***
@{in_position_field}    inPosition
@{in_position}    True
@{filter_field}   filterName
@{filter_name}    r_03

*** Test Cases ***
Execute BigCamera Housekeeping
    [Tags]    execute    bigcamera
    # Set the 'test_env' variable to 'bts' if running on the BTS, otherwise, set it to 'tts'.
    ${integration_script}=    Set Variable If    "${env_efd}" == "base_efd"    lsstcam_housekeeping    comcam_housekeeping
    ${scripts}    ${states}=    Execute Integration Test    ${integration_script}
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Execute MainTel Housekeeping
    [Tags]    execute    maintel
    ${scripts}    ${states}=    Execute Integration Test    maintel_housekeeping
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTMount is Parked
    [Tags]    mtmount    mtptg
    Verify Telescope Parked    maintel

Verify MTDome
    [Tags]    mtdome
    Comment    The Dome park process can take several seconds to finish, even though the command is complete.
    Wait Until Keyword Succeeds    5x    strict: 2s    Verify Dome Parked    maintel

Verify Tracking is Disabled
    [Tags]    mtptg
    ${dataframe}=    Get Recent Samples    MTPtg    logevent_detailedState    ["detailedState",]    1    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[0]    1    #NOTTRACKING

Verify MTMount Axes Homed
    [Tags]    robot:continue-on-failure    mtmount
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_elevationInPosition    index=None
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_azimuthInPosition    index=None

Verify BigCamera has Filter Set
    [Tags]    bigcamera
    Verify Topic Attribute    ${BigCamera}    logevent_endSetFilter    ${filter_field}    ${filter_name}
    Verify Time Delta    ${BigCamera}    command_setFilter    logevent_endSetFilter    45
