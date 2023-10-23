*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Force Tags    athousekeeping
Suite Setup    Check If Failed

*** Variables ***
@{port_field}    selected
@{instrument_port}    2    #Nasymth2

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
    # ATMCS
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_atMountState    ["*",]    1    None
    Should Be Equal As Integers    ${dataframe.state.values}[0]    8    #TrackingDisabled
    # ATPtg
    ${dataframe}=    Get Recent Samples    ATPtg    logevent_detailedState    ["detailedState",]    1    None
    Should Be Equal As Integers    ${dataframe.detailedState.values}[0]    1    #NOTTRACKING
