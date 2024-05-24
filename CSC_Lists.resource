*** Settings ***

*** Variables ***
@{ATCS}            ATAOS    ATDome    ATDomeTrajectory    ATHexapod    ATMCS    ATPneumatics    ATPtg
@{AT_Light_Cal}    ATMonochromator    FiberSpectrograph:3
@{ComCam}          CCOODS    CCCamera    CCHeaderService
@{EAS}             DIMM:1    DIMM:2    EPM:1    ESS:1    ESS:101    ESS:102    ESS:103    ESS:104    ESS:105    ESS:106    ESS:201    ESS:202    ESS:203    ESS:204    ESS:205    ESS:301
@{EAS_AE}          DSM:1    DSM:2    WeatherForecast
@{LATISS}          ATOODS    ATCamera    ATHeaderService    ATSpectrograph
@{MTCS}            MTMount    MTPtg    MTDome    MTDomeTrajectory    MTAOS    MTHexapod:1    MTHexapod:2    MTRotator    MTM1M3    MTM2
@{ObsSys1}         ScriptQueue:1    ScriptQueue:2    ScriptQueue:3    Watcher
@{ObsSys2}         Scheduler:1    Scheduler:2    Scheduler:3    OCPS:1    OCPS:2
@{NON_CONFIG}      ATHeaderService    ATMCS    ATOODS    ATPneumatics    ATPtg    CCHeaderService    CCOODS    DSM    LinearStage    MTPtg    ScriptQueue:1    ScriptQueue:2    ScriptQueue:3
@{OFFLINE}         ATCamera    CCCamera
@{SALOBJ}          ATAOS   ATDome   ATDomeTrajectory   ATHeaderService   ATHexapod   ATMCS   ATMonochromator   ATOODS   ATPneumatics   ATSpectrograph   ATWhiteLight
...    CCHeaderService   CCOODS   DIMM:1    DIMM:2   DIMM:2   DSM:1   DSM:2   EPM:1
...    ESS:1    ESS:101    ESS:102    ESS:103    ESS:104    ESS:105    ESS:106    ESS:107    ESS:108    ESS:201    ESS:202    ESS:203    ESS:204    ESS:205    ESS:301
...    FiberSpectrograph:3   LinearStage   MTAOS   MTDome   MTDomeTrajectory   MTHexapod MTRotator
...    OCPS:1   OCPS:2   Scheduler:1   Scheduler:2    Scheduler:3   ScriptQueue:1    ScriptQueue:2    ScriptQueue:3   Watcher   WeatherForecast
@{Camera}       ATCamera    CCCamera
