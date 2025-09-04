*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    lasertracker

*** Variables ***

*** Test Cases ***
# LaserTracker
Verify LaserTracker laserStatus is OFF
    [Tags]    robot:continue-on-failure
    Comment    The reflectorStatus Event is sent in response to the open and close commands.
    ${dataframe}=    Get Recent Samples    LaserTracker    logevent_laserStatus    ["status",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Integers    ${dataframe.laserStatus.values}[0]    2    #OFF

PowerOn the Laser
    [Tags]
    Comment    Power on the laser.
    ${scripts}    ${states}=    Execute Integration Test    run_command    3   LaserTracker:1    power     True
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify laserState is NOTCONNECTED
    [Tags]
    Comment    After receiving the power on command, it takes 1-2 minutes for the laser to go into NOTCONNECTED status.
    Wait Until Keyword Succeeds    2min    15s    Verify Topic Attribute    LaserTracker:1    logevent_laserStatus    ["status",]    [1,]

Verify LaserTracker laserStatus is Recent
    [Tags]    timing    robot:continue-on-failure
    Verify Time Delta    LaserTracker    logevent_laserStatus    second=30    minute=2    hour=0   day=0    week=0

Verify LaserTracker laserStatus is ON
    [Tags]    robot:continue-on-failure
    Comment    It takes the laser one minute to warm up before going in the ON state..
    Wait Until Keyword Succeeds    2min    15s     Verify Topic Attribute    LaserTracker:1    logevent_laserStatus    ["status",]    [4,]    #ON
