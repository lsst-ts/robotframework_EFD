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
Execute MainTel Housekeeping
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_housekeeping
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MainTel is Parked
    [Tags]    robot:continue-on-failure
    # MTMount
    Verify Telescope Parked    maintel
    # MTDome
    Comment    The Dome park process can take several seconds to finish, even though the command is complete.
    Wait Until Keyword Succeeds    5x    strict: 2s    Verify Dome Parked    maintel

Verify Tracking is Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    MTPtg    logevent_detailedState    ["detailedState",]    1    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[0]    1    #NOTTRACKING

Verify MTMount Axes Homed
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_elevationInPosition    index=None
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_azimuthInPosition    index=None

Verify BigCamera has Filter Set
    [Tags]
    Verify Topic Attribute    ${BigCamera}    logevent_endSetFilter    ${filter_field}    ${filter_name}
    Verify Time Delta    ${BigCamera}    command_setFilter    logevent_endSetFilter    45
