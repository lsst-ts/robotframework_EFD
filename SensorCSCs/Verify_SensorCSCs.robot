*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas_sensor_data

*** Variables ***
${minutes_ago}    0.017
${hours_ago}    0
${days_ago}    0
${weeks_ago}    0

*** Test Cases ***
#DIMM:1

#DIMM:2

#EPM:1

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
    Verify Time Delta    ESS:1    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

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
    Verify Time Delta    ESS:101    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:102
Verify ESS:102 Data is Recent
    [Tags]
    Verify Time Delta    ESS:102    relativeHumidity    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:103
Verify ESS:103 Data is Recent
    [Tags]
    Verify Time Delta    ESS:103    relativeHumidity    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Data is Recent
    [Tags]
    Verify Time Delta    ESS:104    accelerometer    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Data is Recent
    [Tags]
    Verify Time Delta    ESS:105    spectrumAnalyzer    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Data is Recent
    [Tags]
    Verify Time Delta    ESS:106    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 Data is Recent
    [Tags]
    Verify Time Delta    ESS:107    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 Data is Recent
    [Tags]
    Verify Time Delta    ESS:108    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Data is Recent
    [Tags]
    Verify Time Delta    ESS:201    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Data is Recent
    [Tags]
    Verify Time Delta    ESS:202    accelerometer    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 Data is Recent
    [Tags]
    Verify Time Delta    ESS:203    lightningStrikeStatus    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

  ##electricFieldStrength

# ESS:204
Verify ESS:204 Data is Recent
    [Tags]
    Set Test Variable    ${minutes_ago}    1
    Verify Time Delta    ESS:204    airFlow    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:205
Verify ESS:205 Data is Recent
    [Tags]
    Verify Time Delta    ESS:205    airTurbulence    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:301
#Verify ESS:301 Data is Recent
    #[Tags]
    #Verify Time Delta    ESS:301    temperature    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

