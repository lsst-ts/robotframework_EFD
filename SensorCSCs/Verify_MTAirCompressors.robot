*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mt_air_compressors

*** Variables ***
${minutes_ago}   0.2  # ~1sec
${hours_ago}     0
${days_ago}      0
${weeks_ago}     0
@{analogData_fields}    compressorVolume    compressorVolumePercentage    dclinkVoltage    groupVolume    heatsinkTemperature    linePressure
...    motorCurrent    motorInput    motorSpeedPercentage    motorSpeedRPM    stage1OutputPressure    stage1OutputTemperature    targetSpeed    waterLevel
@{errors}        communicationVSDE504    compressorDischargeTemperatureE403    condensateDrainE414    controllerHardwareE409    coolingE410
...    dischargeOverPressureE405    dischargePressureSensorB2E407    dischargeTemperatureSensorR2E408    dryerE413    emergencyStopActivatedE401 
...    externalFaultE412    heavyStartupE416    highMotorTemperatureM1E402    linePressureSensorB1E406    lockedVSDE502    noPressureBuildUpE415
...    oilPressureLowE411    powerSupplyFailureE400    preAdjustmentE501    preAdjustmentVSDE500    readFaultVSDE507    seeVSDDisplayE509
...    speedBelowMinLimitE510    startTemperatureLowE404    stopInputEMVSDE506    stopInputVSDEME508    stopPressedVSDE505    writeFaultVSDE503
@{status}    fault    maxAllowedSpeedAchieved    minAllowedSpeedAchieved    motorStartPhase    offLoad    onLoad    operating    readyToStart
...    runOnTimer    serviceRequired    softStop    startAfterDePressurise    startAfterDryerPreRun    startAfterPowerLoss    startByRemote
...    startInhibit    startWithPressureRequirement    startWithTimerControl    warning
@{warnings}      airFilterA611    compressorDischargeTemperatureA602    condensateDrainA609    controllerBatteryEmptyA607    dischargeOverPressureA601
...    dryerA608    externalWarningA615    fineSeparatorA610    fullSDCardA623    input1A617    input2A618    input3A619    input4A620    input5A621
...    input6A622    linePressureHighA606    motorLuricationSystemA616    oilFilterA612    oilLevelLowA613    oilTemperatureHighA614    serviceDueA600
...    temperatureHighVSDA700

*** Test Cases ***
# MTAirCompressor:1
Verify MTAirCompressor:1 Status
    [Tags]    robot:continue-on-failure
    Comment    Status Event is only sent once, when the CSC FIRST comes into the Disabled state.
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_status    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{status}
        Run Keyword If    "${field}" == "readyToStart"   Should Be True    ${dataframe.${field}.values}[0]
        ...    ELSE IF    "${field}" == "startByRemote"    Should Be True    ${dataframe.${field}.values}[0]
        ...    ELSE    Should Not Be True    ${dataframe.${field}.values}[0]
    END

Verify MTAirCompressor:1 Status is Recent
    [Tags]    timing    robot:continue-on-failure
    Verify Time Delta    MTAirCompressor:1    logevent_status    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAirCompressor:1 analogData
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    analogData    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{analogData_fields}
        Should Be True    isinstance(${dataframe.${field}.values}[0], (int, float))
    END

Verify MTAirCompressor:1 analogData Data is Recent
    [Tags]    timing    robot:continue-on-failure
    Verify Time Delta    MTAirCompressor:1    analogData    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAirCompressor:1 CompressorInfo
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_compressorInfo    ["serialNumber", "softwareVersion",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Run Keyword If    "${env_efd}" == "summit_efd"    Should Be Equal    ${dataframe.serialNumber.values}[0]    163704834
    Run Keyword If    "${env_efd}" == "summit_efd"    Should Be Equal As Strings    ${dataframe.softwareVersion.values}[0]    DXL-LRS-2.32    strip_spaces=True

Verify MTAirCompressor:1 Errors
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_errors    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{errors}
        Should Not Be True    ${dataframe.${field}.values}[0]
    END

Verify MTAirCompressor:1 Warnings
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_warnings    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{warnings}
        Should Not Be True    ${dataframe.${field}.values}[0]
    END

Verify MTAirCompressor:1 TimerInfo
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_timerInfo    ["loadedHours", "lowestServiceCounter", "runOnTimer", "runningHours",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be True    isinstance(${dataframe.loadedHours.values}[0], (int, float))
    Should Be True    isinstance(${dataframe.lowestServiceCounter.values}[0], (int, float))
    Should Be True    isinstance(${dataframe.runOnTimer.values}[0], (int, float))
    Should Be True    isinstance(${dataframe.runningHours.values}[0], (int, float))

# MTAirCompressor:2
Verify MTAirCompressor:2 Status
    [Tags]    robot:continue-on-failure
    Comment    Status Event is only sent once, when the CSC FIRST comes into the Disabled state.
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_status    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{status}
        Run Keyword If    "${field}" == "readyToStart"   Should Be True    ${dataframe.${field}.values}[0]
        ...    ELSE IF    "${field}" == "startByRemote"    Should Be True    ${dataframe.${field}.values}[0]
        ...    ELSE    Should Not Be True    ${dataframe.${field}.values}[0]
    END

Verify MTAirCompressor:2 Status is Recent
    [Tags]    timing    robot:continue-on-failure
    Verify Time Delta    MTAirCompressor:2    logevent_status    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAirCompressor:2 analogData Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    analogData    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{analogData_fields}
        Should Be True    isinstance(${dataframe.${field}.values}[0], (int, float))
    END

Verify MTAirCompressor:2 analogData Data is Recent
    [Tags]    timing    robot:continue-on-failure
    Verify Time Delta    MTAirCompressor:2    analogData    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify MTAirCompressor:2 CompressorInfo
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_compressorInfo    ["serialNumber", "softwareVersion",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Run Keyword If    "${env_efd}" == "summit_efd"    Should Be Equal    ${dataframe.serialNumber.values}[0]    241900711
    Run Keyword If    "${env_efd}" == "summit_efd"    Should Be Equal As Strings    ${dataframe.softwareVersion.values}[0]    DXL7-LRS-1.03    strip_spaces=True

Verify MTAirCompressor:2 Errors
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_errors    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{errors}
        Should Not Be True    ${dataframe.${field}.values}[0]
    END

Verify MTAirCompressor:2 Warnings
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_warnings    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    FOR   ${field}    IN    @{warnings}
        Should Not Be True    ${dataframe.${field}.values}[0]
    END

Verify MTAirCompressor:2 TimerInfo
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_timerInfo    ["loadedHours", "lowestServiceCounter", "runOnTimer", "runningHours",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be True    isinstance(${dataframe.loadedHours.values}[0], (int, float))
    Should Be True    isinstance(${dataframe.lowestServiceCounter.values}[0], (int, float))
    Should Be True    isinstance(${dataframe.runOnTimer.values}[0], (int, float))
    Should Be True    isinstance(${dataframe.runningHours.values}[0], (int, float))
