*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Test Cases ***
# CBP
Verify CBP Shutdown
    [Tags]    cbp
    Verify Shutdown Process    CBP

# Electrometer
Verify Electrometer:101 Shutdown
    [Tags]    electrometer
    Verify Shutdown Process    Electrometer    index=101

Verify Electrometer:102 Shutdown
    [Tags]    electrometer
    Verify Shutdown Process    Electrometer    index=102

Verify Electrometer:103 Shutdown
    [Tags]    electrometer
    Verify Shutdown Process    Electrometer    index=103

Verify Electrometer:201 Shutdown
    [Tags]    electrometer
    Verify Shutdown Process    Electrometer    index=201

# LEDProjector
Verify LEDProjector Shutdown
    [Tags]    ledprojector
    Verify Shutdown Process    LEDProjector

# LinearStage
Verify LinearStage:101 Shutdown
    [Tags]    linearstage
    Verify Shutdown Process    LinearStage    index=101

Verify LinearStage:102 Shutdown
    [Tags]    linearstage
    Verify Shutdown Process    LinearStage    index=102

Verify LinearStage:103 Shutdown
    [Tags]    linearstage
    Verify Shutdown Process    LinearStage    index=103

Verify LinearStage:104 Shutdown
    [Tags]    linearstage
    Verify Shutdown Process    LinearStage    index=104

# MTReflector
Verify MTReflector Shutdown
    [Tags]    mtreflector
    Verify Shutdown Process    MTReflector

# TunableLaser
Verify TunableLaser Shutdown
    [Tags]    tunablelaser
    Verify Shutdown Process    MTReflector
