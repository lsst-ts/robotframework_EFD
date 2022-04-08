*** Settings ***

*** Variables ***
@{ATCS}            ATAOS    ATDome    ATDomeTrajectory    ATHexapod    ATMCS    ATPneumatics    ATPtg
@{AT_Light_Cal}    ATMonochromator    FiberSpectrograph:3
@{ComCam}          CCOODS    CCCamera    CCHeaderService
@{EAS}             DIMM:1    DIMM:2    WeatherStation:1
@{EAS_AE}          DSM:1    DSM:2
@{LATISS}          ATOODS    ATCamera    ATHeaderService    ATSpectrograph
@{MTCS}            MTMount    MTPtg    MTDome    MTDomeTrajectory    MTAOS    MTHexapod:1    MTHexapod:2    MTRotator    MTM1M3    MTM2
@{ObsSys1}         ScriptQueue:1    ScriptQueue:2    Watcher
@{ObsSys2}         Scheduler:1    Scheduler:2    OCPS:1    OCPS:2
@{NON_CONFIG}      ATOODS    ATHeaderService    ATMCS    ATPneumatics    ATPtg    CCHeaderService    CCOODS    DSM    LinearStage    MTPtg    ScriptQueue
@{OFFLINE}         ATCamera    CCCamera
