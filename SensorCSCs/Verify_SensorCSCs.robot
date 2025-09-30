*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas_sensor_data

*** Variables ***
${dimm_seconds_ago}   15
${dsm1_seconds_ago}   15
${dsm2_seconds_ago}   30
${ess_seconds_ago}    6
${ess_minutes_ago}    2 
${seconds_ago}    0
${minutes_ago}    0
${hours_ago}    0
${days_ago}     0
${weeks_ago}    0

*** Test Cases ***
# DIMM:1
Verify DIMM:1 logevent_dimmMeasurement Published Data
    [Tags]    dimm1
    ${dataframe}=    Get Recent Samples    DIMM    logevent_dimmMeasurement    ["timestamp", "expiresAt",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DIMM:1 logevent_dimmMeasurement Data is Recent
    [Tags]    dimm1    timing
    Verify Time Delta    DIMM:1    logevent_dimmMeasurement    second=${dimm_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 logevent_dimmMeasurement Published Data
    [Tags]    dimm2
    ${dataframe}=    Get Recent Samples    DIMM    logevent_dimmMeasurement    ["timestamp", "expiresAt",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DIMM:2 logevent_dimmMeasurement Data is Recent
    [Tags]    dimm2    timing
    Verify Time Delta    DIMM:2    logevent_dimmMeasurement    second=${dimm_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DSM:1
Verify DSM:1 domeSeeing Published Data
    [Tags]    dsm1
    ${dataframe}=    Get Recent Samples    DSM    domeSeeing    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DSM:1 domeSeeing Data is Recent
    [Tags]    dsm1    timing
    Verify Time Delta    DSM:1    domeSeeing    second=${dsm1_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DSM:2
Verify DSM:2 domeSeeing Published Data
    [Tags]    dsm2
    ${dataframe}=    Get Recent Samples    DSM    domeSeeing    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DSM:2 domeSeeing Data is Recent
    [Tags]    dsm2    timing
    Verify Time Delta    DSM:2    domeSeeing    second=${dsm2_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 accelerometer Published Data
    [Tags]    ess104    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    accelerometer    ["sensorName", "location", "accelerationX0", "accelerationY0", "accelerationZ0",]    num=4    index=104
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    # Get dataframe indexes.
    ${idx01}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="SST top end ring +x -y"]
    ${idx02}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="SST top end ring -x -y"]
    ${idx03}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="SST spider spindle"]
    ${idx04}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="SST M2 surrogate"]
    Comment    ============SST top end ring +x -y============
    ${dataframe01}=    Evaluate    $dataframe.loc[$idx01]
    Should Be Equal As Strings    ${dataframe01.location.values}[0]    SST top end ring +x -y side, at base plate of star tracker: x = -azimuth, y = elevation
    Should Be True    abs(${dataframe01.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe01.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe01.accelerationZ0.values}[0]) >= 0
    Comment    ============SST top end ring -x -y============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    SST top end ring -x -y side, at base plate of DIMM telescope: x = -azimuth, y = elevation
    Should Be True    abs(${dataframe02.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe02.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe02.accelerationZ0.values}[0]) >= 0
    Comment    ============SST spider spindle============
    ${dataframe03}=    Evaluate    $dataframe.loc[$idx03]
    Should Be Equal As Strings    ${dataframe03.location.values}[0]    SST cental spider spindle, before hexapod at -x side: x = -azimuth, y = elevation
    Should Be True    abs(${dataframe03.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe03.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe03.accelerationZ0.values}[0]) >= 0
    Comment    ============SST M2 surrogate============
    ${dataframe04}=    Evaluate    $dataframe.loc[$idx04]
    Should Be Equal As Strings    ${dataframe04.location.values}[0]    SST M2 surrogate mass, -x side of front flange: x = -azimuth, y = elevation
    Should Be True    abs(${dataframe04.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe04.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe04.accelerationZ0.values}[0]) >= 0

Verify ESS:104 accelerometer Data is Recent
    [Tags]    ess104    timing
    Verify Time Delta    ESS:104    accelerometer    second=45    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 spectrumAnalyzer Published Data
    [Tags]    ess105    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    spectrumAnalyzer    ["sensorName", "location", "spectrum1"]    num=1    index=105
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    SSA3000X
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome wall
    Should Be True    abs(${dataframe.spectrum1.values}[0]) >= 0

Verify ESS:105 spectrumAnalyzer Data is Recent
    [Tags]    ess105    timing
    Verify Time Delta    ESS:105    spectrumAnalyzer    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 temperature Published Data
    [Tags]    ess106    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=106
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    M2-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Unused, Tangent link A1, Tangent link A2, Tangent link A3, Tangent link A4, Tangent link A5, Tangent link A6, Unused
    Should Be True    "${dataframe.temperatureItem0.values}[0]" == "nan" or "${dataframe.temperatureItem0.values}[0]" == "None"
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    "${dataframe.temperatureItem0.values}[0]" == "nan" or "${dataframe.temperatureItem0.values}[0]" == "None"

Verify ESS:106 temperature Data is Recent
    [Tags]    ess106    timing
    Verify Time Delta    ESS:106    temperature    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
## relativeHumidity ##
Verify ESS:107 relativeHumidity Published Data
    [Tags]    ess107    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem"]    num=1    index=107
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Laser-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Laser Enclosure
    Should Be True    (${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:107 relativeHumidity Data is Recent
    [Tags]    ess107    timing
    Verify Time Delta    ESS:107    relativeHumidity    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## temperature ##
Verify ESS:107 temperature Published Data
    [Tags]    ess107    robot:continue-on-failure
    # Summit publishing rate is not as defined as the teststands. Grab an extra instance to ensure getting data from Laser-ESS02.
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=3    index=107
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    # Get dataframe indexes.
    ${idx01}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="Laser-ESS01"]
    ${idx02}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="Laser-ESS02"]
    Comment    ============Laser-ESS01============
    ${dataframe01}=    Evaluate    $dataframe.loc[$idx01]
    Log    ${dataframe01}
    Should Be Equal As Strings    ${dataframe01.sensorName.values}[0]    Laser-ESS01
    Should Be Equal As Strings    ${dataframe01.location.values}[0]    Laser Enclosure
    Should Be True    abs(${dataframe01.temperatureItem0.values}[0]) >= 0
    Should Be True    "${dataframe01.temperatureItem1.values}[0]" == "nan" or "${dataframe01.temperatureItem1.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem2.values}[0]" == "nan" or "${dataframe01.temperatureItem2.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem3.values}[0]" == "nan" or "${dataframe01.temperatureItem3.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem4.values}[0]" == "nan" or "${dataframe01.temperatureItem4.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem5.values}[0]" == "nan" or "${dataframe01.temperatureItem5.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem6.values}[0]" == "nan" or "${dataframe01.temperatureItem6.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem7.values}[0]" == "nan" or "${dataframe01.temperatureItem7.values}[0]" == "None"
    Comment    ============Laser-ESS02============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Log    ${dataframe02}
    Should Be Equal As Strings    ${dataframe02.sensorName.values}[0]    Laser-ESS02
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    EnclosureFan FCUnit LaserTop LaserBottom LaserFan PowerSupply EnclosureOut EnclosureMid
    Should Be True    "${dataframe02.temperatureItem0.values}[0]" == "nan" or "${dataframe02.temperatureItem0.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem1.values}[0]" == "nan" or "${dataframe02.temperatureItem1.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem2.values}[0]" == "nan" or "${dataframe02.temperatureItem2.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem3.values}[0]" == "nan" or "${dataframe02.temperatureItem3.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem4.values}[0]" == "nan" or "${dataframe02.temperatureItem4.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem5.values}[0]" == "nan" or "${dataframe02.temperatureItem5.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem6.values}[0]" == "nan" or "${dataframe02.temperatureItem6.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem7.values}[0]" == "nan" or "${dataframe02.temperatureItem7.values}[0]" == "None"

Verify ESS:107 temperature Data is Recent
    [Tags]    ess107    timing
    Verify Time Delta    ESS:107    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 temperature Published Data
    [Tags]    ess108    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=108
    Log    ${dataframe}
    # The CBP-ESS01 device and simulator actually behave the same.
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    CBP-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Photodiode PrimaryMirror MaskChanger ElectronicsCabinet
    Should Be True    "${dataframe.temperatureItem0.values}[0]" == "nan" or "${dataframe.temperatureItem0.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem1.values}[0]" == "nan" or "${dataframe.temperatureItem1.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem2.values}[0]" == "nan" or "${dataframe.temperatureItem2.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem3.values}[0]" == "nan" or "${dataframe.temperatureItem3.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem4.values}[0]" == "nan" or "${dataframe.temperatureItem4.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem5.values}[0]" == "nan" or "${dataframe.temperatureItem5.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem6.values}[0]" == "nan" or "${dataframe.temperatureItem6.values}[0]" == "None"
    Should Be True    "${dataframe.temperatureItem7.values}[0]" == "nan" or "${dataframe.temperatureItem7.values}[0]" == "None"

Verify ESS:108 temperature Data is Recent
    [Tags]    ess108    timing
    Set Test Variable    ${ess_seconds_ago}    2
    Verify Time Delta    ESS:108    temperature    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:109
Verify ESS:109 spectrumAnalyzer Published Data
    [Tags]    ess109    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    spectrumAnalyzer    ["sensorName", "location", "spectrum0", "spectrum1", "spectrum10", "spectrum100", "spectrum101", "spectrum102", "spectrum103", "spectrum104", "startFrequency","stopFrequency",]    num=1    index=109
    Log    ${dataframe}
    # The CBP-ESS01 device and simulator actually behave the same.
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    SSA3000X
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome wall
    Should Be True    abs(${dataframe.spectrum0.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum1.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum10.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum100.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum101.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum102.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum103.values}[0]) >= 0
    Should Be True    abs(${dataframe.spectrum104.values}[0]) >= 0
    Should Be True    abs(${dataframe.startFrequency.values}[0]) >= 0
    Should Be True    abs(${dataframe.stopFrequency.values}[0]) >= 0

Verify ESS:109 spectrumAnalyzer Data is Recent
    [Tags]    ess109    timing
    Set Test Variable    ${ess_seconds_ago}    2
    Verify Time Delta    ESS:109    spectrumAnalyzer    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:110
Verify ESS:110 airTurbulence Published Data
    [Tags]    ess110    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airTurbulence    ["sensorName", "location", "sonicTemperature", "speed0", "speed1", "speed2", "speedMagnitude", "speedMaxMagnitude",]    num=1    index=110
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    TMA-GillLabJack01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    TMA (unknown location)
    Should Be True    abs(${dataframe.sonicTemperature.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed0.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed1.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed2.values}[0]) >= 0
    Should Be True    abs(${dataframe.speedMagnitude.values}[0]) >= 0
    Should Be True    abs(${dataframe.speedMaxMagnitude.values}[0]) >= 0

Verify ESS:110 airTurbulence Data is Recent
    [Tags]    ess110    timing
    Verify Time Delta    ESS:110    airTurbulence    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:111
Verify ESS:111 temperature Published Data
    [Tags]    ess111    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=111
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Camera-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Camera inlet plane; RPi with sticker 3
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    ${dataframe.temperatureItem1.values}[0] == None
    Should Be True    ${dataframe.temperatureItem2.values}[0] == None
    Should Be True    ${dataframe.temperatureItem3.values}[0] == None
    Should Be True    ${dataframe.temperatureItem4.values}[0] == None
    Should Be True    ${dataframe.temperatureItem5.values}[0] == None
    Should Be True    ${dataframe.temperatureItem6.values}[0] == None
    Should Be True    ${dataframe.temperatureItem7.values}[0] == None

Verify ESS:111 temperature Data is Recent
    [Tags]    ess111    timing
    Verify Time Delta    ESS:111    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:112
Verify ESS:112 relativeHumidity Published Data
    [Tags]    ess112    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem",]    num=1    index=112
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    M2-ESS02
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M2; RPi with sticker 1
    Should Be True    abs(${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:112 relativeHumidity Data is Recent
    [Tags]    ess112    timing
    Verify Time Delta    ESS:112    relativeHumidity    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:113
Verify ESS:113 relativeHumidity Published Data
    [Tags]    ess113    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem",]    num=1    index=113
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    M1M3-ESS03
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M1M3; RPi with sticker 4
    Should Be True    abs(${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:113 relativeHumidity Data is Recent
    [Tags]    ess113    timing
    Verify Time Delta    ESS:113    relativeHumidity    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:114
Verify ESS:114 temperature Published Data
    [Tags]    ess114    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=114
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    m1m3-ts-01 6/6
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M1M3
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:114 temperature Data is Recent
    [Tags]    ess114    timing
    Verify Time Delta    ESS:114    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:115
Verify ESS:115 temperature Published Data
    [Tags]    ess115    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=115
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    m1m3-ts-02 6/6
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M1M3
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:115 temperature Data is Recent
    [Tags]    ess115    timing
    Verify Time Delta    ESS:115    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:116
Verify ESS:116 temperature Published Data
    [Tags]    ess116    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=116
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    m1m3-ts-03 6/6
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M1M3
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:116 temperature Data is Recent
    [Tags]    ess116    timing
    Verify Time Delta    ESS:116    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:117
Verify ESS:117 temperature Published Data
    [Tags]    ess117    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=117
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    m1m3-ts-04 6/6
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M1M3
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:117 temperature Data is Recent
    [Tags]    ess117    timing
    Verify Time Delta    ESS:117    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:118
Verify ESS:118 airFlow Published Data
    [Tags]    ess118    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airFlow    ["sensorName","location","direction","directionStdDev","speed","speedStdDev"]    num=1    index=118
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    RubinWiFiTest1
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MTDome-ESS10
    Should Be True    "${dataframe.direction.values}[0]" == "nan" or "${dataframe.direction.values}[0]" == "None"
    Should Be True    "${dataframe.directionStdDev.values}[0]" == "nan" or "${dataframe.directionStdDev.values}[0]" == "None"
    Should Be True    "${dataframe.speed.values}[0]" == "nan" or "${dataframe.speed.values}[0]" == "None"
    Should Be True    "${dataframe.speedStdDev.values}[0]" == "nan" or "${dataframe.speedStdDev.values}[0]" == "None"

Verify ESS:118 airFlow Data is Recent
    [Tags]    ess118    timing
    Verify Time Delta    ESS:118    airFlow    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:119
Verify ESS:119 temperature Published Data
    [Tags]    ess119    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName","location","temperatureItem0","temperatureItem1","temperatureItem2","temperatureItem3","temperatureItem4","temperatureItem5","temperatureItem6","temperatureItem7","temperatureItem8","temperatureItem9"]    num=1    index=119
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    RubinWiFiTest2
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MTDome-ESS11
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem8.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem9.values}[0]) >= 0

Verify ESS:119 temperature Data is Recent
    [Tags]    ess119    timing
    Verify Time Delta    ESS:119    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:120
Verify ESS:120 airFlow Published Data
    [Tags]    ess120    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airFlow    ["sensorName","location","direction","directionStdDev","speed","speedStdDev"]    num=1    index=120
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    RubinWiFiTest3
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MTDome-ESS12
    Should Be True    "${dataframe.direction.values}[0]" == "nan" or "${dataframe.direction.values}[0]" == "None"
    Should Be True    "${dataframe.directionStdDev.values}[0]" == "nan" or "${dataframe.directionStdDev.values}[0]" == "None"
    Should Be True    "${dataframe.speed.values}[0]" == "nan" or "${dataframe.speed.values}[0]" == "None"
    Should Be True    "${dataframe.speedStdDev.values}[0]" == "nan" or "${dataframe.speedStdDev.values}[0]" == "None"

Verify ESS:120 airFlow Data is Recent
    [Tags]    ess120    timing
    Verify Time Delta    ESS:120    airFlow    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:121
Verify ESS:121 temperature Published Data
    [Tags]    ess121    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=121
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    MTCameraAssembly-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT camera hexapod strut 7, MT camera hexapod strut 8, MT camera hexapod strut 9, MT camera hexapod strut 10, MT camera hexapod strut 11, MT camera hexapod strut 12, MT camera rotator motor 1, MT camera rotator motor 2
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:121 temperature Data is Recent
    [Tags]    ess121    timing
    Verify Time Delta    ESS:121    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:122
Verify ESS:122 temperature Published Data
    [Tags]    ess122    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=122
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    M2-ESS02
    Should Be Equal As Strings    ${dataframe.location.values}[0]    M2 hexapod strut 1, M2 hexapod strut 2, M2 hexapod strut 3, M2 hexapod strut 4, M2 hexapod strut 5, M2 hexapod strut 6, +X/+Y Truss Structure, -X/-Y Truss Structure
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:122 temperature Data is Recent
    [Tags]    ess122    timing
    Verify Time Delta    ESS:122    temperature    second=${seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
## airTurbulence ##
Verify ESS:201 airTurbulence Published Data
    [Tags]    ess201    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airTurbulence    ["sensorName", "location", "speedMagnitude",]    num=1    index=201
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-ESS04
    Should Be Equal As Strings    ${dataframe.location.values}[0]    AT Dome
    Should Be True    abs(${dataframe.speedMagnitude.values}[0]) >= 0

Verify ESS:201 airTurbulence Data is Recent
    [Tags]    ess201    timing
    Set Test Variable    ${ess_seconds_ago}    15
    Verify Time Delta    ESS:201    airTurbulence    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## pressure ##
Verify ESS:201 pressure Published Data
    [Tags]    ess201    robot:continue-on-failure
    # Summit publishing rate is not as defined as the teststands. Grab an extra instance to ensure getting data from AuxTel-LabJack01.
    ${dataframe}=    Get Recent Samples    ESS    pressure    ["sensorName", "location", "pressureItem0", "pressureItem1",]    num=5    index=201
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    # Sometimes, the last 5 telemetry items does not include AuxTel-LabJack01. If so, get another batch.
    IF    "AuxTel-LabJack01" not in $dataframe.sensorName.values
        ${dataframe_redux}=    Get Recent Samples    ESS    pressure    ["sensorName", "location", "pressureItem0", "pressureItem1",]    num=5    index=201
        Set Test Variable    ${dataframe}    ${dataframe_redux}
    END
    # Get dataframe indexes.
    ${idx01}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-LabJack01"]
    ${idx02}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS02"]
    Comment    ============AuxTel-LabJack01============
    ${dataframe01}=    Evaluate    $dataframe.loc[$idx01]
    Log    ${dataframe01}
    Should Be Equal As Strings    ${dataframe01.location.values}[0]    Camera coolant high side, Camera coolant low side
    Should Be True    abs(${dataframe01.pressureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe01.pressureItem1.values}[0]) >= 0
    Comment    ============AuxTel-ESS02============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Log    ${dataframe02}
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    AT azimuth axis
    Should Be True    abs(${dataframe02.pressureItem0.values}[0]) >= 0
    Should Be Equal As Strings    ${dataframe02.pressureItem1.values}[0]    nan

Verify ESS:201 pressure Data is Recent
    [Tags]    ess201    timing
    Verify Time Delta    ESS:201    pressure    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## relativeHumidity ##
Verify ESS:201 relativeHumidity Published Data
    [Tags]    ess201    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem",]    num=1    index=201
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.location.values}[0]    AT azimuth axis
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-ESS02
    Should Be True    abs(${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:201 relativeHumidity Data is Recent
    [Tags]    ess201    timing
    Verify Time Delta    ESS:201    relativeHumidity    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## temperature ##
Verify ESS:201 temperature Published Data
    [Tags]    ess201    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=3    index=201
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    # Get dataframe indexes.
    ${idx01}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS01"]
    ${idx02}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS02"]
    ${idx03}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS03"]
    Comment    ============AuxTel-ESS01============
    # The AuxTel-ESS03 device and simulator DO NOT behave the same.
    ${dataframe01}=    Evaluate    $dataframe.loc[$idx01]
    Log    ${dataframe01}
    Should Be Equal As Strings    ${dataframe01.location.values}[0]    unused, AT air, AT truss, AT M2, unused, unused, unused, unused
    Should Be True    "${dataframe01.temperatureItem0.values}[0]" == "nan" or "${dataframe01.temperatureItem0.values}[0]" == "None."
    Should Be True    abs(${dataframe01.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe01.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe01.temperatureItem3.values}[0]) >= 0
    Should Be True    "${dataframe01.temperatureItem4.values}[0]" == "nan" or "${dataframe01.temperatureItem7.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem5.values}[0]" == "nan" or "${dataframe01.temperatureItem7.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem6.values}[0]" == "nan" or "${dataframe01.temperatureItem7.values}[0]" == "None"
    Should Be True    "${dataframe01.temperatureItem7.values}[0]" == "nan" or "${dataframe01.temperatureItem7.values}[0]" == "None"
    Comment    ============AuxTel-ESS02============
    # The AuxTel-ESS02 device and simulator actually behave the same.
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Log    ${dataframe02}
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    AT azimuth axis
    Should Be True    abs(${dataframe02.temperatureItem0.values}[0]) >= 0
    Should Be True    "${dataframe02.temperatureItem1.values}[0]" == "nan" or "${dataframe02.temperatureItem1.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem2.values}[0]" == "nan" or "${dataframe02.temperatureItem2.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem3.values}[0]" == "nan" or "${dataframe02.temperatureItem3.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem4.values}[0]" == "nan" or "${dataframe02.temperatureItem4.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem5.values}[0]" == "nan" or "${dataframe02.temperatureItem5.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem6.values}[0]" == "nan" or "${dataframe02.temperatureItem6.values}[0]" == "None"
    Should Be True    "${dataframe02.temperatureItem7.values}[0]" == "nan" or "${dataframe02.temperatureItem7.values}[0]" == "None"
    Comment    ============AuxTel-ESS03============
    # The AuxTel-ESS03 device and simulator actually behave the same.
    ${dataframe03}=    Evaluate    $dataframe.loc[$idx03]
    Log    ${dataframe03}
    Should Be Equal As Strings    ${dataframe03.location.values}[0]    M1 sensor 1, M1 sensor 2, M1 sensor 3, M1 sensor 4, M1 sensor 5
    Should Be True    abs(${dataframe03.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem4.values}[0]) >= 0
    Should Be True    "${dataframe03.temperatureItem5.values}[0]" == "nan" or "${dataframe03.temperatureItem5.values}[0]" == "None"
    Should Be True    "${dataframe03.temperatureItem6.values}[0]" == "nan" or "${dataframe03.temperatureItem6.values}[0]" == "None"
    Should Be True    "${dataframe03.temperatureItem7.values}[0]" == "nan" or "${dataframe03.temperatureItem7.values}[0]" == "None"

Verify ESS:201 temperature Data is Recent
    [Tags]    ess201    timing
    Verify Time Delta    ESS:201    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 accelerometer Published Data
    [Tags]    ess202    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    accelerometer    ["sensorName", "location", "accelerationX0", "accelerationY0", "accelerationZ0",]    num=3    index=202
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    # Get dataframe indexes.
    ${idx01}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-M1"]
    ${idx02}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-Truss"]
    ${idx03}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-M2"]
    Comment    ============AuxTel-M1============
    ${dataframe01}=    Evaluate    $dataframe.loc[$idx01]
    Should Be Equal As Strings    ${dataframe01.location.values}[0]    AuxTel M1 x=el y=az
    Should Be True    abs(${dataframe01.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe01.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe01.accelerationZ0.values}[0]) >= 0
    Comment    ============AuxTel-Truss============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    AuxTel Truss x=el z=az
    Should Be True    abs(${dataframe02.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe02.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe02.accelerationZ0.values}[0]) >= 0
    Comment    ============AuxTel-M2============
    ${dataframe03}=    Evaluate    $dataframe.loc[$idx03]
    Should Be Equal As Strings    ${dataframe03.location.values}[0]    AuxTel M2 x=el y=az
    Should Be True    abs(${dataframe03.accelerationX0.values}[0]) >= 0
    Should Be True    abs(${dataframe03.accelerationY0.values}[0]) >= 0
    Should Be True    abs(${dataframe03.accelerationZ0.values}[0]) >= 0

Verify ESS:202 accelerometer Data is Recent
    [Tags]    ess202    timing
    Set Test Variable    ${ess_seconds_ago}    30
    Verify Time Delta    ESS:202    accelerometer    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 airFlow Published Data
    [Tags]    ess204    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airFlow    ["sensorName", "location", "direction", "speed",]    num=1    index=204
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-Windsonic
    Should Be Equal As Strings    ${dataframe.location.values}[0]    AT Dome
    Should Be True    abs(${dataframe.direction.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed.values}[0]) >= 0

Verify ESS:204 airFlow Data is Recent
    [Tags]    ess204    timing
    Set Test Variable    ${ess_seconds_ago}    10
    Verify Time Delta    ESS:204    airFlow    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
## airFlow ##
Verify ESS:301 airFlow Published Data
    [Tags]    ess301    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airFlow    ["sensorName", "location", "speed"]    num=1    index=301
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Weather tower airflow
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Weather tower
    Should Be True    abs(${dataframe.speed.values}[0]) >= 0
    
Verify ESS:301 airFlow Data is Recent
    [Tags]    ess301    timing
    Set Test Variable    ${ess_seconds_ago}    12
    Verify Time Delta    ESS:301    airFlow    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## dewPoint ##
Verify ESS:301 dewPoint Published Data
    [Tags]    ess301    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    dewPoint    ["sensorName", "location", "dewPointItem"]    num=1    index=301
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Weather tower computed dew point
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Weather tower
    Should Be True    abs(${dataframe.dewPointItem.values}[0]) >= 0

Verify ESS:301 dewPoint Data is Recent
    [Tags]    ess301    timing
    Set Test Variable    ${ess_seconds_ago}    45
    Verify Time Delta    ESS:301    dewPoint    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## pressure ##
Verify ESS:301 pressure Published Data
    [Tags]    ess301    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    pressure    ["sensorName", "location", "pressureItem0", "pressureItem1"]    num=1    index=301
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Weather tower atmospheric pressure
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Weather tower
    Should Be True    abs(${dataframe.pressureItem0.values}[0]) >= 0
    Should Be True    "${dataframe.pressureItem1.values}[0]" == "nan" or "${dataframe.pressureItem1.values}[0]" == "None"

Verify ESS:301 pressure Data is Recent
    [Tags]    ess301    timing
    Set Test Variable    ${ess_second_ago}    45
    Verify Time Delta    ESS:301    pressure    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## rainRate ##
Verify ESS:301 rainRate Published Data
    [Tags]    ess301    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    rainRate    ["sensorName", "location", "rainRateItem"]    num=1    index=301
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Weather tower rain tip count
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Weather tower
    Should Be True    abs(${dataframe.rainRateItem.values}[0]) >= 0

Verify ESS:301 rainRate Data is Recent
    [Tags]    ess301    timing
    Verify Time Delta    ESS:301    rainRate    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## relativeHumidity ##
Verify ESS:301 relativeHumidity Published Data
    [Tags]    ess301    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem"]    num=1    index=301
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Weather tower relative humidity
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Weather tower
    Should Be True    abs(${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:301 relativeHumidity Data is Recent
    [Tags]    ess301    timing
    Set Test Variable    ${ess_seconds_ago}    45
    Verify Time Delta    ESS:301    relativeHumidity    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## Temperature ##
Verify ESS:301 temperature Published Data
    [Tags]    ess301    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=301
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Weather tower air temperature
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Weather tower
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    ${dataframe.temperatureItem1.values}[0] == None
    Should Be True    ${dataframe.temperatureItem2.values}[0] == None
    Should Be True    ${dataframe.temperatureItem3.values}[0] == None
    Should Be True    ${dataframe.temperatureItem4.values}[0] == None
    Should Be True    ${dataframe.temperatureItem5.values}[0] == None
    Should Be True    ${dataframe.temperatureItem6.values}[0] == None
    Should Be True    ${dataframe.temperatureItem7.values}[0] == None

Verify ESS:301 temperature Data is Recent
    [Tags]    ess301    timing
    Set Test Variable    ${ess_seconds_ago}    45
    Verify Time Delta    ESS:301    temperature    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:303
Verify ESS:303 schneiderPm5xxx Published Data
    [Tags]    ess303
    ${dataframe}=    Get Recent Samples    ESS    schneiderPm5xxx    ["*",]    num=1    index=303
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.private_identity.values}[0]    ESS:303

Verify ESS:303 schneiderPm5xxx Data is Recent
    [Tags]    ess303    timing
    Verify Time Delta    ESS:303    schneiderPm5xxx    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:304
Verify ESS:304 ringssMeasurement Published Event
    [Tags]    ess304    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    logevent_ringssMeasurement    ["private_identity","hrNum","zenithDistance","flux","fwhmScintillation","fwhmSector","fwhmFree","wind","tau0","theta0","totalVariance","eRMS","turbulenceProfiles0","turbulenceProfiles1","turbulenceProfiles2","turbulenceProfiles3","turbulenceProfiles4","turbulenceProfiles5","turbulenceProfiles6","turbulenceProfiles7"]    num=1    index=304
    Log    ${dataframe}   
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.private_identity.values}[0]    ESS:304
    Should Be True    abs(${dataframe.hrNum.values}[0]) >= 0
    Should Be True    abs(${dataframe.zenithDistance.values}[0]) >= 0
    Should Be True    abs(${dataframe.flux.values}[0]) >= 0
    Should Be True    abs(${dataframe.fwhmScintillation.values}[0]) >= 0
    Should Be True    abs(${dataframe.fwhmSector.values}[0]) >= 0
    Should Be True    abs(${dataframe.fwhmFree.values}[0]) >= 0
    Should Be True    abs(${dataframe.wind.values}[0]) >= 0
    Should Be True    abs(${dataframe.tau0.values}[0]) >= 0
    Should Be True    abs(${dataframe.theta0.values}[0]) >= 0
    Should Be True    abs(${dataframe.totalVariance.values}[0]) >= 0
    Should Be True    abs(${dataframe.eRMS.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles0.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles1.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles2.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles3.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles4.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles5.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles6.values}[0]) >= 0
    Should Be True    abs(${dataframe.turbulenceProfiles7.values}[0]) >= 0

Verify ESS:304 logevent_ringssMeasurement Event is Recent
    [Tags]    ess304    timing
    ${ess_minutes_ago}=    Set Variable    5    #5 minutes
    Verify Time Delta    ESS:304    logevent_ringssMeasurement    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:305
Verify ESS:305 agcGenset150 Published Data
    [Tags]    ess305     robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    agcGenset150    ["private_identity","running","engineTotalFuel","engineHours","generatorVoltageL1L2","generatorVoltageL2L3","generatorVoltageL3L1","busBVoltageL1N","busBVoltageL2N","busBVoltageL3N","systemFrequency","totalPowerFactor","generatorCurrentL1","generatorCurrentL2","generatorCurrentL3"]    num=1    index=305
    Log    ${dataframe}   
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.private_identity.values}[0]    ESS:305
    Should Be True    ${dataframe.running.values}[0]
    Should Be True    abs(${dataframe.engineTotalFuel.values}[0]) >= 0
    Should Be True    abs(${dataframe.engineHours.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorVoltageL1L2.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorVoltageL2L3.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorVoltageL3L1.values}[0]) >= 0
    Should Be True    abs(${dataframe.busBVoltageL1N.values}[0]) >= 0
    Should Be True    abs(${dataframe.busBVoltageL2N.values}[0]) >= 0
    Should Be True    abs(${dataframe.busBVoltageL3N.values}[0]) >= 0
    Should Be True    abs(${dataframe.systemFrequency.values}[0]) >= 0
    Should Be True    abs(${dataframe.totalPowerFactor.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorCurrentL1.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorCurrentL2.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorCurrentL1.values}[0]) >= 0

Verify ESS:305 agcGenset150 Data is Recent
    [Tags]    ess305    timing
    Verify Time Delta    ESS:305    agcGenset150    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:306
Verify ESS:306 agcGenset150 Published Data
    [Tags]    ess306    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    agcGenset150    ["private_identity","running","engineTotalFuel","engineHours","generatorVoltageL1L2","generatorVoltageL2L3","generatorVoltageL3L1","busBVoltageL1N","busBVoltageL2N","busBVoltageL3N","systemFrequency","totalPowerFactor","generatorCurrentL1","generatorCurrentL2","generatorCurrentL3"]    num=1    index=306
    Log    ${dataframe}   
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.private_identity.values}[0]    ESS:306
    Should Be True    ${dataframe.running.values}[0]
    Should Be True    abs(${dataframe.engineTotalFuel.values}[0]) >= 0
    Should Be True    abs(${dataframe.engineHours.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorVoltageL1L2.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorVoltageL2L3.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorVoltageL3L1.values}[0]) >= 0
    Should Be True    abs(${dataframe.busBVoltageL1N.values}[0]) >= 0
    Should Be True    abs(${dataframe.busBVoltageL2N.values}[0]) >= 0
    Should Be True    abs(${dataframe.busBVoltageL3N.values}[0]) >= 0
    Should Be True    abs(${dataframe.systemFrequency.values}[0]) >= 0
    Should Be True    abs(${dataframe.totalPowerFactor.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorCurrentL1.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorCurrentL2.values}[0]) >= 0
    Should Be True    abs(${dataframe.generatorCurrentL1.values}[0]) >= 0

Verify ESS:306 agcGenset150 Data is Recent
    [Tags]    ess306    timing
    Verify Time Delta    ESS:306    agcGenset150    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:308
## electricFieldStrength ##
Verify ESS:308 electricFieldStrength Published Data
    [Tags]    ess308    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    electricFieldStrength    ["sensorName", "location", "strength",]    num=1    index=308
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-ElectricField01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Calibration Hill
    Should Be True    abs(${dataframe.strength.values}[0]) >= 0
    
Verify ESS:308 electricFieldStrength Data is Recent
    [Tags]    ess308    timing
    Set Test Variable    ${ess_seconds_ago}    45
    Verify Time Delta    ESS:308    electricFieldStrength    second=${ess_seconds_ago}    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

## lightningStrikeStatus ##
Verify ESS:308 lightningStrikeStatus Published Data
    [Tags]    ess308    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    lightningStrikeStatus    ["sensorName", "location", "totalStrikeRate",]    num=1    index=308
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-Lightning01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Calibration Hill
    Should Be True    abs(${dataframe.totalStrikeRate.values}[0]) >= 0
    
Verify ESS:308 lightningStrikeStatus Data is Recent
    [Tags]    ess308    timing
    Verify Time Delta    ESS:308    lightningStrikeStatus    second=${ess_seconds_ago}    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# WeatherForecast
Verify WeatherForecast hourlyTrend Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    WeatherForecast    hourlyTrend    ["temperature0", "precipitation0", "windspeed0", "relativeHumidity0", "totalCloudCover0", "gust0", "visibility0",]    num=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be True    abs(${dataframe.temperature0.values}[0]) >= 0
    Should Be True    abs(${dataframe.precipitation0.values}[0]) >= 0
    Should Be True    abs(${dataframe.windspeed0.values}[0]) >= 0
    Should Be True    abs(${dataframe.relativeHumidity0.values}[0]) >= 0
    Should Be True    abs(${dataframe.totalCloudCover0.values}[0]) >= 0
    Should Be True    abs(${dataframe.gust0.values}[0]) >= 0
    Should Be True    abs(${dataframe.visibility0.values}[0]) >= 0

Verify WeatherForecast hourlyTrend Data is Recent
    [Tags]    timing
    Verify Time Delta    WeatherForecast    hourlyTrend    minute=15   hour=12    day=${days_ago}    week=${weeks_ago}
