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
${time_window}    10

*** Test Cases ***
Execute MainTel Housekeeping
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    maintel_housekeeping
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTMount Axes Homed
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_elevationInPosition    ${time_window}    None
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_azimuthInPosition    ${time_window}    None

Verify BigCamera has Filter Set
    [Tags]
    Verify Topic Attribute    ${BigCamera}    logevent_endSetFilter    ${filter_field}    ${filter_name}
    Verify Time Delta    ${BigCamera}    command_setFilter    logevent_endSetFilter    45
