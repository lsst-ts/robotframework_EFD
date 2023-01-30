*** Settings ***

*** Variables ***
@{ATCS}            ATAOS    ATDome    ATDomeTrajectory    ATHexapod    ATMCS    ATPneumatics    ATPtg
@{AT_Light_Cal}    ATMonochromator    FiberSpectrograph:3
@{ComCam}          CCOODS    CCCamera    CCHeaderService
@{EAS}             DIMM:1    WeatherForecast    WeatherStation:1
@{EAS_AE}          DSM:1    DSM:2
@{LATISS}          ATOODS    ATCamera    ATHeaderService    ATSpectrograph
@{MTCS}            MTMount    MTPtg    MTDome    MTDomeTrajectory    MTAOS    MTHexapod:1    MTHexapod:2    MTRotator    MTM1M3    MTM2
@{ObsSys1}         Authorize    ScriptQueue:1    ScriptQueue:2    Watcher
@{ObsSys2}         Scheduler:1    Scheduler:2    OCPS:1    OCPS:2
@{NON_CONFIG}      ATHeaderService    ATMCS    ATOODS    ATPneumatics    ATPtg    CCHeaderService    CCOODS    DSM    LinearStage    MTPtg    ScriptQueue
@{OFFLINE}         ATCamera    CCCamera
@{SALOBJ}          ATAOS   ATDome   ATDomeTrajectory   ATHeaderService   ATHexapod   ATMCS   ATMonochromator   ATOODS   ATPneumatics   ATSpectrograph   ATWhiteLight    Authorize
...    CCHeaderService   CCOODS   DIMM:1   DIMM:2   DSM:1   DSM:2   FiberSpectrograph:3   LinearStage   MTAOS   MTDome   MTDomeTrajectory   MTHexapod MTRotator
...    OCPS:1   OCPS:2   Scheduler:1   Scheduler:2   ScriptQueue   Watcher   WeatherForecast    WeatherStation:1
@{Camera}       ATCamera    CCCamera
