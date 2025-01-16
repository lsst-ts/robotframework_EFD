*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtcs    shutdown

*** Test Cases ***
Verify LaserTracker:1 Shutdown
    [Tags]
    Verify Shutdown Process    LaserTracker    index=1

Verify MTAirCompressor:1 Shutdown
    [Tags]
    Verify Shutdown Process    MTAirCompressor    index=1

Verify MTAirCompressor:2 Shutdown
    [Tags]
    Verify Shutdown Process    MTAirCompressor    index=2

Verify MTMount Shutdown
    [Tags]
    Verify Shutdown Process    MTMount

Verify MTPtg Shutdown
    [Tags]    mtptg
    Verify Shutdown Process    MTPtg

Verify MTDome Shutdown
    [Tags]
    Verify Shutdown Process    MTDome

Verify MTDomeTrajectory Shutdown
    [Tags]
    Verify Shutdown Process    MTDomeTrajectory

Verify MTAOS Shutdown
    [Tags]
    Verify Shutdown Process    MTAOS

Verify MTHexapod:1 Shutdown
    [Tags]
    Verify Shutdown Process    MTHexapod    index=1

Verify MTHexapod:2 Shutdown
    [Tags]
    Verify Shutdown Process    MTHexapod    index=2

Verify MTRotator Shutdown
    [Tags]
    Verify Shutdown Process    MTRotator

Verify MTM1M3 Shutdown
    [Tags]
    Verify Shutdown Process    MTM1M3

Verify MTM1M3TS Shutdown
    [Tags]
    Verify Shutdown Process    MTM1M3TS

Verify MTM2 Shutdown
    [Tags]
    Verify Shutdown Process    MTM2

Verify MTVMS:1 Shutdown
    [Tags]
    Verify Shutdown Process    MTVMS:1
