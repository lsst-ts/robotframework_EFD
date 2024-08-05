*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtaircompressor

*** Variables ***

*** Test Cases ***
#MTAirCompressor:1
Verify MTAirCompressor:1 logevent_status Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_status    ["operating", "fault", "warning",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Not Be True    ${dataframe.operating.values}[0]
    Should Not Be True    ${dataframe.fault.values}[0]
    Should Not Be True    ${dataframe.warning.values}[0]

Verify MTAirCompressor:1 logevent_status is Recent
    [Tags]    timing
    Verify Time Delta    MTAirCompressor:1    logevent_status    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Verify MTAirCompressor:1 logevent_compressorInfo Published Data
    #[Tags]
    #${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_compressorInfo    ["softwareVersion", "serialNumber",]    num=1    index=1
    #Log    ${dataframe}
    #Should Not Be True    ${dataframe.empty}

Verify MTAirCompressor:1 analogData Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    analogData    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be True    abs(${dataframe.waterLevel.values}[0]) >= 0
    Should Be True    abs(${dataframe.targetSpeed.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorCurrent.values}[0]) >= 0
    Should Be True    abs(${dataframe.heatsinkTemperature.values}[0]) >= 0
    Should Be True    abs(${dataframe.dclinkVoltage.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorSpeedPercentage.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorSpeedRPM.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorInput.values}[0]) >= 0
    Should Be True    abs(${dataframe.compressorVolumePercentage.values}[0]) >= 0
    Should Be True    abs(${dataframe.compressorVolume.values}[0]) >= 0
    Should Be True    abs(${dataframe.groupVolume.values}[0]) >= 0
    Should Be True    abs(${dataframe.stage1OutputPressure.values}[0]) >= 0
    Should Be True    abs(${dataframe.linePressure.values}[0]) >= 0
    Should Be True    abs(${dataframe.stage1OutputTemperature.values}[0]) >= 0

Verify MTAirCompressor:1 analogData Data is Recent
    [Tags]    timing
    Verify Time Delta    MTAirCompressor:1    analogData    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#MTAirCompressor:2
Verify MTAirCompressor:2 logevent_status Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_status    ["operating", "fault", "warning",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Not Be True    ${dataframe.operating.values}[0]
    Should Not Be True    ${dataframe.fault.values}[0]
    Should Not Be True    ${dataframe.warning.values}[0]

Verify MTAirCompressor:2 logevent_status is Recent
    [Tags]    timing
    Verify Time Delta    MTAirCompressor:2    logevent_status    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Verify MTAirCompressor:2 logevent_compressorInfo Published Data
    #[Tags]
    #${dataframe}=    Get Recent Samples    MTAirCompressor    logevent_compressorInfo    ["softwareVersion", "serialNumber",]    num=1    index=2
    #Log    ${dataframe}
    #Should Not Be True    ${dataframe.empty}

Verify MTAirCompressor:2 analogData Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    MTAirCompressor    analogData    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be True    abs(${dataframe.waterLevel.values}[0]) >= 0
    Should Be True    abs(${dataframe.targetSpeed.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorCurrent.values}[0]) >= 0
    Should Be True    abs(${dataframe.heatsinkTemperature.values}[0]) >= 0
    Should Be True    abs(${dataframe.dclinkVoltage.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorSpeedPercentage.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorSpeedRPM.values}[0]) >= 0
    Should Be True    abs(${dataframe.motorInput.values}[0]) >= 0
    Should Be True    abs(${dataframe.compressorVolumePercentage.values}[0]) >= 0
    Should Be True    abs(${dataframe.compressorVolume.values}[0]) >= 0
    Should Be True    abs(${dataframe.groupVolume.values}[0]) >= 0
    Should Be True    abs(${dataframe.stage1OutputPressure.values}[0]) >= 0
    Should Be True    abs(${dataframe.linePressure.values}[0]) >= 0
    Should Be True    abs(${dataframe.stage1OutputTemperature.values}[0]) >= 0

Verify MTAirCompressor:2 analogData Data is Recent
    [Tags]    timing
    Verify Time Delta    MTAirCompressor:2    analogData    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
