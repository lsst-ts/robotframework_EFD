*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Force Tags    athousekeeping

*** Variables ***
@{homed_field}    homed
@{homed}    True
@{port_field}    selected
@{instrument_port}    2    #Nasymth2
@{position_field}    name
@{disperser}    empty_1
@{filter_field}    filterName
@{filter_name}    r_03
${time_window}    10

*** Test Cases ***
Execute AuxTel Housekeeping
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_housekeeping
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify ATMCS Set to Nasmyth2
    [Tags]
    Verify Topic Attribute    ATMCS    logevent_m3PortSelected    ${port_field}    ${instrument_port}

Verify AuxTel is Parked
    [Tags]    robot:continue-on-failure
    Verify Telescope Parked    auxtel
    Comment    The Dome park process can take several seconds to finish, even though the command is complete.
    Wait Until Keyword Succeeds    5x    strict: 2s    Verify Dome Parked    auxtel

Verify Tracking is Disabled
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled

Verify ATSpectrograph Reporting Disperser Band
    [Tags]
    Verify Topic Attribute    ATSpectrograph    logevent_reportedDisperserPosition    ${position_field}    ${disperser}    output=json
    Verify Time Delta    ATSpectrograph    command_changeDisperser    logevent_reportedDisperserPosition    ${time_window}

Verify CCCamera has Filter Set
    [Tags]
    Verify Topic Attribute    CCCamera    logevent_endSetFilter    ${filter_field}    ${filter_name}
    Verify Time Delta    CCCamera    command_setFilter    logevent_endSetFilter    45
