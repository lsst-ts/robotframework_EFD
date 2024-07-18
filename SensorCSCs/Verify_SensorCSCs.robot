*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas_sensor_data

*** Variables ***
${dimm_minutes_ago}    0.18    # >10.0s
${epm_minutes_ago}    0.018    # >1.0s
${ess_minutes_ago}    0.035    # >2.0s
${hours_ago}    0
${days_ago}    0
${weeks_ago}    0

*** Test Cases ***
#DIMM:1
Verify DIMM:1 Data is Recent
    [Tags]
    Verify Time Delta    DIMM:1    logevent_dimmMeasurement    minute=${dimm_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#DIMM:2
Verify DIMM:2 Data is Recent
    [Tags]
    Verify Time Delta    DIMM:2    logevent_dimmMeasurement    minute=${dimm_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#EPM:1
Verify EPM:1 Data is Recent
    [Tags]
    Verify Time Delta    EPM:1    scheiderPm5xxx    minute=${epm_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ESS:1
Verify ESS:1 Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2", "temperatureItem3", "temperatureItem4", "temperatureItem5", "temperatureItem6", "temperatureItem7"]    num=1    index=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    MTCameraAssembly-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT camera hexapod strut 7, MT camera hexapod strut 8, MT camera hexapod strut 9, MT camera hexapod strut 10, MT camera hexapod strut 11, MT camera hexapod strut 12, MT camera rotator motor 1, MT camera rotator motor 2

Verify ESS:1 Data is Recent
    [Tags]
    Verify Time Delta    ESS:1    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:101
Verify ESS:101 Published Data
    [Tags]
    ${dataframe}=    Get Recent Samples    ESS    temperature    ["sensorName", "location", "temperatureItem0", "temperatureItem1", "temperatureItem2"]    num=1    index=101
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Strings    ${dataframe.sensorName.values}[0]    MTDome-ESS01
    Should Be Equal As Strings    ${dataframe.location.values}[0]    MT dome air handling unit 1; RPi with sticker 3

Verify ESS:101 Data is Recent
    [Tags]
    Verify Time Delta    ESS:101    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:102
Verify ESS:102 Data is Recent
    [Tags]
    Verify Time Delta    ESS:102    relativeHumidity    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:103
Verify ESS:103 Data is Recent
    [Tags]
    Verify Time Delta    ESS:103    relativeHumidity    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.35
    Verify Time Delta    ESS:104    accelerometer    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Data is Recent
    [Tags]
    Verify Time Delta    ESS:105    spectrumAnalyzer    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Data is Recent
    [Tags]
    Verify Time Delta    ESS:106    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 Data is Recent
    [Tags]
    Verify Time Delta    ESS:107    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.035
    Verify Time Delta    ESS:108    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Data is Recent
    [Tags]
    Verify Time Delta    ESS:201    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.35
    Verify Time Delta    ESS:202    accelerometer    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 LightningStrikeStatus Data is Recent
    [Tags]
    Verify Time Delta    ESS:203    lightningStrikeStatus    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ESS:203 ElectricFieldStrength Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    0.68
    Verify Time Delta    ESS:203    electricFieldStrength    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    1.1
    Verify Time Delta    ESS:204    airFlow    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:205
Verify ESS:205 Data is Recent
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

Verify ESS:301 temperature Data is Recent
    [Tags]
    Set Test Variable    ${ess_minutes_ago}    1.6
    Verify Time Delta    ESS:301    temperature    minute=${ess_minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# WeatherForecast
Verify WeatherForecast Data is Recent
    [Tags]
    Verify Time Delta    WeatherForecast    hourlyTrend    minute=15   hour=12    day=${days_ago}    week=${weeks_ago}
