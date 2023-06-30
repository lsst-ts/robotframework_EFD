*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    mthousekeeping

*** Variables ***
@{in_position_field}    inPosition
@{in_position}    True
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
