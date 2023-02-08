*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Force Tags    housekeeping

*** Variables ***
@{homed_field}    homed
@{homed}    True
@{port_field}    selected
@{instrument_port}    2
@{position_field}    name
@{disperser}    empty_1
@{filter_field}    filterName
@{filter_name}    r_03
@{in_position_field}    inPosition
@{in_position}    True
${time_window}    10

*** Test Cases ***
Verify ATDome Azimuth Homed
    [Tags]
    Verify Topic Attribute    ATDome    logevent_azimuthState    ${homed_field}    ${homed}
    Verify Time Delta    ATDome    command_homeAzimuth    logevent_azimuthState    20

Verify ATMCS logevent_m3PortSelected
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_m3PortSelected    ${port_field}    ${instrument_port}

Verify ATPtg in Park Position
    [Tags]
    Verify Topic Attribute    ATPtg    logevent_currentTarget    ["targetName",]    ["Park position",]

Verify ATSpectrograph logevent_reportedDisperserPosition
    [Tags]
    Verify Topic Attribute    ATSpectrograph    logevent_reportedDisperserPosition    ${position_field}    ${disperser}    output=json
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_reportedDisperserPosition    ${time_window}

Verify CCCamera logevent_endSetFilter
    [Tags]
    Verify Topic Attribute    CCCamera    logevent_endSetFilter    ${filter_field}    ${filter_name}
    Verify Time Delta    CCCamera    command_setFilter    logevent_endSetFilter    45

Verify MTMount Axes InPosition
    [Tags]    robot:continue-on-failure
    Verify Topic Attribute    MTMount    logevent_elevationInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_elevationInPosition    ${time_window}    None
    Verify Topic Attribute    MTMount    logevent_azimuthInPosition    ${in_position_field}    ${in_position}
    Verify Time Delta    MTMount    command_homeBothAxes    logevent_azimuthInPosition    ${time_window}    None
