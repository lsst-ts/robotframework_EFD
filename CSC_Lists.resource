*** Settings ***

*** Variables ***
@{AUTO_ENABLED}    DSM:1    DSM:2    HVAC    ScriptQueue:1    ScriptQueue:2    ScriptQueue:3    WeatherForecast
@{AUTO_DISABLED}   MTAirCompressor:1    MTAirCompressor:2
@{ATCS}            ATAOS    ATBuilding    ATDome    ATDomeTrajectory    ATHexapod    ATMCS    ATPneumatics    ATPtg
@{AT_Light_Cal}    ATMonochromator    FiberSpectrograph:3
@{Calibration}     CBP    Electrometer:101    Electrometer:102    Electrometer:103    Electrometer:201    LEDProjector    LinearStage:101    LinearStage:102    LinearStage:103    LinearStage:104    TunableLaser
@{Camera}          ATCamera    CCCamera    MTCamera
@{ComCam}          CCOODS    CCCamera    CCHeaderService    OCPS:2
@{EnvSys}          DIMM:1    DIMM:2    DREAM    EAS    ESS:1    ESS:104    ESS:105    ESS:106    ESS:107    ESS:108    ESS:109    ESS:110    ESS:111    ESS:112    ESS:113    ESS:201    ESS:202    ESS:203    ESS:204    ESS:301    ESS:303    ESS:304    ESS:305    ESS:306
@{EnvSys_AE}       DSM:1    DSM:2    WeatherForecast
@{GenCam}          GenericCamera:1    GCHeaderService:1
@{LATISS}          ATOODS    ATCamera    ATHeaderService    ATSpectrograph    OCPS:1
@{MTCamera}        MTCamera    MTHeaderService    MTOODS    OCPS:3
@{MTCS}            LaserTracker:1    MTMount    MTPtg    MTDome    MTDomeTrajectory    MTAOS    MTHexapod:1    MTHexapod:2    MTRotator    MTM1M3    MTM1M3TS    MTM2    MTVMS:1
@{ObsSys}          Scheduler:1    Scheduler:2    Scheduler:3    Watcher
@{ObsSys_AE}       ScriptQueue:1    ScriptQueue:2    ScriptQueue:3
@{NON_CONFIG}      ATHeaderService    ATOODS    ATPtg    CCHeaderService    CCOODS    DSM    GCHeaderService    HVAC    LOVE    MTHeaderService    MTOODS    MTPtg    Script    ScriptQueue    SummitFacility
@{OFFLINE}         ATCamera    CCCamera    MTCamera
@{SALOBJ}          ATAOS   ATBuilding    ATDome   ATDomeTrajectory   ATHeaderService   ATHexapod    ATMCS    ATMonochromator    ATOODS    ATPneumatics    ATSpectrograph    ATWhiteLight
...    CBP    CCHeaderService    CCOODS    DIMM:1    DIMM:2    DIMM:2    DREAM    DSM:1    DSM:2    EAS    Electrometer:101   Electrometer:102   Electrometer:103    Electrometer:201
...    ESS:1    ESS:104    ESS:105    ESS:106    ESS:107    ESS:108    ESS:109    ESS:110    ESS:111    ESS:112    ESS:113    ESS:201    ESS:202    ESS:203    ESS:204    
...    ESS:301    ESS:303    ESS:304    ESS:305    ESS:306
...    FiberSpectrograph:3    LEDProjector    LinearStage:101    LinearStage:102    LinearStage:103    LinearStage:104
...    MTAOS    MTDome    MTDomeTrajectory    MTHexapod    MTRotator
...    OCPS:1   OCPS:2   Scheduler:1   Scheduler:2    Scheduler:3   ScriptQueue:1    ScriptQueue:2    ScriptQueue:3   TunableLaser    Watcher   WeatherForecast
