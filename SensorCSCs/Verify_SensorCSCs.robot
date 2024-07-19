*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas_sensor_data

*** Variables ***
${dimm_minutes_ago}    0.18    # >10.0s
${dsm1_minutes_ago}    0.018    # >1.0s
${dsm2_minutes_ago}    0.55    # >30.0s
${epm_minutes_ago}    0.018    # >1.0s
${ess_minutes_ago}    0.035    # >2.0s
${hours_ago}    0
${days_ago}    0
${weeks_ago}    0

*** Test Cases ***
# DIMM:1
Verify DIMM:1 logevent_dimmMeasurement Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    DIMM    logevent_dimmMeasurement    ["timestamp", "expiresAt",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DIMM:1 logevent_dimmMeasurement Data is Recent
    [Tags]
    Verify Time Delta    DIMM:1    logevent_dimmMeasurement    minute=${dimm_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DIMM:2
Verify DIMM:2 logevent_dimmMeasurement Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    DIMM    logevent_dimmMeasurement    ["timestamp", "expiresAt",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DIMM:2 logevent_dimmMeasurement Data is Recent
    [Tags]
    Verify Time Delta    DIMM:2    logevent_dimmMeasurement    minute=${dimm_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DSM:1
Verify DSM:1 domeSeeing Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    DSM    domeSeeing    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DSM:1 domeSeeing Data is Recent
    [Tags]
    Verify Time Delta    DSM:1    domeSeeing    minute=${dsm1_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# DSM:2
Verify DSM:2 domeSeeing Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    DSM    domeSeeing    ["*",]    num=1    index=2
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}

Verify DSM:2 domeSeeing Data is Recent
    [Tags]
    Verify Time Delta    DSM:2    domeSeeing    minute=${dsm2_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# EPM:1
Verify EPM:1 scheiderPm5xxx Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    EPM    scheiderPm5xxx    ["*",]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.private_identity.values}[0]    EPM:1

Verify EPM:1 scheiderPm5xxx Data is Recent
    [Tags]
    Verify Time Delta    EPM:1    scheiderPm5xxx    minute=${epm_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:1
Verify ESS:1 temperature Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=1
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

Verify ESS:1 temperature Data is Recent
    [Tags]
    Verify Time Delta    ESS:1    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:101
Verify ESS:101 temperature Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=101
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    MTDome-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome air handling unit 1; RPi with sticker 3
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    ${dataframe.temperatureItem1.values}[0] == None
    Should Be True    ${dataframe.temperatureItem2.values}[0] == None
    Should Be True    ${dataframe.temperatureItem3.values}[0] == None
    Should Be True    ${dataframe.temperatureItem4.values}[0] == None
    Should Be True    ${dataframe.temperatureItem5.values}[0] == None
    Should Be True    ${dataframe.temperatureItem6.values}[0] == None
    Should Be True    ${dataframe.temperatureItem7.values}[0] == None

Verify ESS:101 temperature Data is Recent
    [Tags]
    Verify Time Delta    ESS:101    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:102
Verify ESS:102 relativeHumidity Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem",]    num=1    index=102
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    MTDome-ESS02
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome wall inside at 7th floor; RPi with sticker 1
    Should Be True    abs(${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:102 relativeHumidity Data is Recent
    [Tags]
    Verify Time Delta    ESS:102    relativeHumidity    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:103
Verify ESS:103 relativeHumidity Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    relativeHumidity    ["sensorName", "location", "relativeHumidityItem",]    num=1    index=103
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    MTDome-ESS03
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome inside at 8th floor; RPi with sticker 4
    Should Be True    abs(${dataframe.relativeHumidityItem.values}[0]) >= 0

Verify ESS:103 relativeHumidity Data is Recent
    [Tags]
    Verify Time Delta    ESS:103    relativeHumidity    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 accelerometer Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    accelerometer    ["sensorName", "location", "relativeHumidityItem",]    num=4    index=104
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
    Comment    ============SST top end ring -x -y============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    SST top end ring -x -y side, at base plate of DIMM telescope: x = -azimuth, y = elevation
    Comment    ============SST spider spindle============
    ${dataframe03}=    Evaluate    $dataframe.loc[$idx03]
    Should Be Equal As Strings    ${dataframe03.location.values}[0]    SST cental spider spindle, before hexapod at -x side: x = -azimuth, y = elevation
    Comment    ============SST M2 surrogate============
    ${dataframe04}=    Evaluate    $dataframe.loc[$idx04]
    Should Be Equal As Strings    ${dataframe04.location.values}[0]    SST M2 surrogate mass, -x side of front flange: x = -azimuth, y = elevation

Verify ESS:104 accelerometer Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.35
    Verify Time Delta    ESS:104    accelerometer    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 spectrumAnalyzer Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    spectrumAnalyzer    ["sensorName", "location", "spectrum1"]    num=1    index=105
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    SSA3000X
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome wall
    Should Be True    abs(${dataframe.spectrum1.values}[0]) >= 0

Verify ESS:105 spectrumAnalyzer Data is Recent
    [Tags]
    Verify Time Delta    ESS:105    spectrumAnalyzer    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 temperature Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=106
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    M2-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Unused, Tangent link A1, Tangent link A2, Tangent link A3, Tangent link A4, Tangent link A5, Tangent link A6, Unused
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:106 temperature Data is Recent
    [Tags]
    Verify Time Delta    ESS:106    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 temperature Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=107
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    Laser-ESS02
    Should Be Equal As Strings    ${dataframe.location.values}[0]    EnclosureFan FCUnit LaserTop LaserBottom LaserFan PowerSupply EnclosureOut EnclosureMid
    Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem4.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem5.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem6.values}[0]) >= 0
    Should Be True    abs(${dataframe.temperatureItem7.values}[0]) >= 0

Verify ESS:107 temperature Data is Recent
    [Tags]
    Verify Time Delta    ESS:107    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 temperature Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=108
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    CBP-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Photodiode PrimaryMirror MaskChanger ElectronicsCabinet
    #Should Be True    abs(${dataframe.temperatureItem0.values}[0]) >= 0
    #Should Be True    abs(${dataframe.temperatureItem1.values}[0]) >= 0
    #Should Be True    abs(${dataframe.temperatureItem2.values}[0]) >= 0
    #Should Be True    abs(${dataframe.temperatureItem3.values}[0]) >= 0
    Should Be True    ${dataframe.temperatureItem4.values}[0] == None
    Should Be True    ${dataframe.temperatureItem5.values}[0] == None
    Should Be True    ${dataframe.temperatureItem6.values}[0] == None
    Should Be True    ${dataframe.temperatureItem7.values}[0] == None

Verify ESS:108 temperature Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.036
    Verify Time Delta    ESS:108    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 airTurbulence Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airTurbulence    ["sensorName", "location", "speedMagnitude",]    num=1    index=201
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-ESS04
    Should Be Equal As Strings    ${dataframe.location.values}[0]    AT Dome
    Should Be True    abs(${dataframe.speedMagnitude.values}[0]) >= 0

Verify ESS:201 airTurbulence Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.18
    Verify Time Delta    ESS:201    airTurbulence    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:201 temperature Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=3    index=201
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    # Get dataframe indexes.
    ${idx01}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS01"]
    ${idx02}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS02"]
    ${idx03}=    Evaluate     $dataframe.index[$dataframe["sensorName"]=="AuxTel-ESS03"]
    Comment    ============AuxTel-ESS03============
    ${dataframe01}=    Evaluate    $dataframe.loc[$idx01]
    Should Be Equal As Strings    ${dataframe01.location.values}[0]    unused, AT air, AT truss, AT M2, unused, unused, unused, unused
    Should Be True    abs(${dataframe01.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe01.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe01.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe01.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe01.temperatureItem4.values}[0]) >= 0
    Comment    ============AuxTel-ESS03============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    AT azimuth axis
    Should Be True    abs(${dataframe02.temperatureItem0.values}[0]) >= 0
    #Should Be True    ${dataframe02.temperatureItem1.values}[0] == None
    #Should Be True    ${dataframe02.temperatureItem2.values}[0] == None
    #Should Be True    ${dataframe02.temperatureItem3.values}[0] == None
    #Should Be True    ${dataframe02.temperatureItem4.values}[0] == None
    #Should Be True    ${dataframe02.temperatureItem5.values}[0] == None
    #Should Be True    ${dataframe02.temperatureItem6.values}[0] == None
    #Should Be True    ${dataframe02.temperatureItem7.values}[0] == None
    Comment    ============AuxTel-ESS03============
    ${dataframe03}=    Evaluate    $dataframe.loc[$idx03]
    Should Be Equal As Strings    ${dataframe03.location.values}[0]    M1 sensor 1, M1 sensor 2, M1 sensor 3, M1 sensor 4, M1 sensor 5
    Should Be True    abs(${dataframe03.temperatureItem0.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem1.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem2.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem3.values}[0]) >= 0
    Should Be True    abs(${dataframe03.temperatureItem4.values}[0]) >= 0
    #Should Be True    abs(${dataframe03.temperatureItem5.values}[0]) >= 0
    #Should Be True    abs(${dataframe03.temperatureItem6.values}[0]) >= 0
    #Should Be True    abs(${dataframe03.temperatureItem7.values}[0]) >= 0

Verify ESS:201 temperature Data is Recent
    [Tags]
    Verify Time Delta    ESS:201    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 accelerometer Published Data
    [Tags]    robot:continue-on-failure
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
    Should Be True    abs(${dataframe.accelerationX0.values}[0]) >= 0
    Comment    ============AuxTel-Truss============
    ${dataframe02}=    Evaluate    $dataframe.loc[$idx02]
    Should Be Equal As Strings    ${dataframe02.location.values}[0]    AuxTel Truss x=el z=az
    Should Be True    abs(${dataframe.accelerationY0.values}[0]) >= 0
    Comment    ============AuxTel-M2============
    ${dataframe03}=    Evaluate    $dataframe.loc[$idx03]
    Should Be Equal As Strings    ${dataframe03.location.values}[0]    AuxTel M2 x=el y=az
    Should Be True    abs(${dataframe.accelerationZ0.values}[0]) >= 0

Verify ESS:202 accelerometer Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.35
    Verify Time Delta    ESS:202    accelerometer    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 lightningStrikeStatus Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    lightningStrikeStatus    ["sensorName", "location", "totalStrikeRate",]    num=1    index=203
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-Lightning01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Calibration Hill
    Should Be True    abs(${dataframe.totalStrikeRate.values}[0]) >= 0

Verify ESS:203 lightningStrikeStatus Data is Recent
    [Tags]
    Verify Time Delta    ESS:203    lightningStrikeStatus    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:203 electricFieldStrength Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    electricFieldStrength    ["sensorName", "location", "strength",]    num=1    index=203
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-ElectricField01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Calibration Hill
    Should Be True    abs(${dataframe.strength.values}[0]) >= 0

Verify ESS:203 electricFieldStrength Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.68
    Verify Time Delta    ESS:203    electricFieldStrength    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 airFlow Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airFlow    ["sensorName", "location", "direction", "speed",]    num=1    index=204
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-Windsonic
    Should Be Equal As Strings    ${dataframe.location.values}[0]    AT Dome
    Should Be True    abs(${dataframe.direction.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed.values}[0]) >= 0

Verify ESS:204 airFlow Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    1.1
    Verify Time Delta    ESS:204    airFlow    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:205
Verify ESS:205 airTurbulence Published Data
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    ESS    airTurbulence    ["sensorName", "location", "sonicTemperature", "speed0", "speed1", "speed2", "speedMagnitude", "speedMaxMagnitude",]    num=1    index=205
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    AuxTel-GillLabJack01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    Auxtel Dome Floor 2
    Should Be True    abs(${dataframe.sonicTemperature.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed0.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed1.values}[0]) >= 0
    Should Be True    abs(${dataframe.speed2.values}[0]) >= 0
    Should Be True    abs(${dataframe.speedMagnitude.values}[0]) >= 0
    Should Be True    abs(${dataframe.speedMaxMagnitude.values}[0]) >= 0

Verify ESS:205 airTurbulence Data is Recent
    [Tags]
    Verify Time Delta    ESS:205    airTurbulence    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
Verify ESS:301 airFlow Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.18
    Verify Time Delta    ESS:301    airFlow    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 dewPoint Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    1.6
    Verify Time Delta    ESS:301    dewPoint    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 pressure Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.55
    Verify Time Delta    ESS:301    pressure    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#Verify ESS:301 rainRate Data is Recent
    #[Tags]    
    #Verify Time Delta    ESS:301    rainRate    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 relativeHumidity Data is Recent
    [Tags] 
    Set Test Variable    ${ess_minutes_ago}    0.55
    Verify Time Delta    ESS:301    relativeHumidity    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:301 temperature Published Data
    [Tags]    robot:continue-on-failure
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
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    1.6
    Verify Time Delta    ESS:301    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

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
    [Tags]
    Verify Time Delta    WeatherForecast    hourlyTrend    minute=15   hour=12    day=${days_ago}    week=${weeks_ago}
