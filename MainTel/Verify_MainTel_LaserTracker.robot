*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    lasertracker

*** Variables ***

*** Test Cases ***
Verify LaserTracker is Enabled
    [Tags]    robot:exit-on-failure
    Comment    Ensure LaserTracker is Enabled and if not, stop test execution.
    Verify Summary State    ${STATES}[enabled]    LaserTracker:1

# LaserTracker
Verify LaserTracker laserStatus is OFF
    [Tags]
    Comment    The reflectorStatus Event is sent in response to the open and close commands.
    ${dataframe}=    Get Recent Samples    LaserTracker    logevent_laserStatus    ["status",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Integers    ${dataframe.status.values}[0]    2    #OFF

PowerOn the Laser
    [Tags]
    Comment    Power on the laser.
    ${scripts}    ${states}=    Execute Integration Test    run_command    1   LaserTracker:1    laserPower    -p power:True
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify laserState is NOTCONNECTED
    [Tags]
    Comment    After receiving the power on command, it takes 1-2 minutes for the laser to go into NOTCONNECTED status.
    Wait Until Keyword Succeeds    2min    15s    Verify Topic Attribute    LaserTracker:1    logevent_laserStatus    ["status",]    [1,]

Verify LaserTracker laserStatus is Recent
    [Tags]    timing
    Verify Time Delta    LaserTracker    logevent_laserStatus    second=30    minute=2    hour=0   day=0    week=0

Verify laser is ON
    [Tags]
    Comment    It takes the laser one minute to warm up before going in the ON state..
    Wait Until Keyword Succeeds    2min    15s     Verify Topic Attribute    LaserTracker:1    logevent_laserStatus    ["status",]    [4,]    #ON

Align LaserTracker to MTM2
    [Tags]    execute    robot:skip-on-failure
    ${scripts}    ${states}=    Execute Integration Test    maintel_lasertracker_align    M2
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify LaserTracker is Published Offsets for MTM2
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    LaserTracker    logevent_offsetsPublish    ["*",]    1    1
    Should Not Be True    ${dataframe.empty}
    Should Contain    ${dataframe.target.values}[0]    FrameM2
    Should Be True    abs(${dataframe.dX.values}[0]) > 0
    Should Be True    abs(${dataframe.dY.values}[0]) > 0
    Should Be True    abs(${dataframe.dZ.values}[0]) > 0
    Should Be True    abs(${dataframe.dRX.values}[0]) > 0
    Should Be True    abs(${dataframe.dRY.values}[0]) > 0
    Should Be True    abs(${dataframe.dRZ.values}[0]) > 0

Align LaserTracker to the Camera
    [Tags]    execute    robot:skip-on-failure
    ${scripts}    ${states}=    Execute Integration Test    maintel_lasertracker_align    Camera
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify LaserTracker is Published Offsets for the Camera
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    LaserTracker    logevent_offsetsPublish    ["*",]    1    1
    Should Not Be True    ${dataframe.empty}
    Should Contain    ${dataframe.target.values}[0]    FrameCAM
    Should Be True    abs(${dataframe.dX.values}[0]) > 0
    Should Be True    abs(${dataframe.dY.values}[0]) > 0
    Should Be True    abs(${dataframe.dZ.values}[0]) > 0
    Should Be True    abs(${dataframe.dRX.values}[0]) > 0
    Should Be True    abs(${dataframe.dRY.values}[0]) > 0
    Should Be True    abs(${dataframe.dRZ.values}[0]) > 0

Point LaserTracker at MTM1M3
    [Tags]    execute    robot:exclude
    ${scripts}    ${states}=    Execute Integration Test    run_command    1    LaserTracker:1    measurePoint    --parameters=collection:A,pointgroup:M1M3,target:p2
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify LaserTracker is Published Positions for M1M3
    [Tags]    robot:continue-on-failure    robot:exclude
    ${dataframe}=    Get Recent Samples    LaserTracker    logevent_positionPublish    ["*",]    1    1
    Should Not Be True    ${dataframe.empty}
    Should Contain    ${dataframe.target.values}[0]    FrameCAM
    Should Be True    abs(${dataframe.dX.values}[0]) > 0
    Should Be True    abs(${dataframe.dY.values}[0]) > 0
    Should Be True    abs(${dataframe.dZ.values}[0]) > 0
    Should Be True    abs(${dataframe.dRX.values}[0]) > 0
    Should Be True    abs(${dataframe.dRY.values}[0]) > 0
    Should Be True    abs(${dataframe.dRZ.values}[0]) > 0

PowerOff the Laser
    [Tags]
    Comment    Power off the laser.
    ${scripts}    ${states}=    Execute Integration Test    run_command    1   LaserTracker:1    laserPower    -p power:False
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify laser is OFF
    [Tags]
    Comment    Verify laser is off.
    Wait Until Keyword Succeeds    1min    15s     Verify Topic Attribute    LaserTracker:1    logevent_laserStatus    ["status",]    [2,]    #OFF

Put LaserTracker to Standby
    [Tags]
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    LaserTracker:1    Standby    1
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify LaserTracker:1 Standby
    [Tags]
    Verify Summary State    ${STATES}[standby]    LaserTracker:1
