*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    eas_sensor_data

*** Variables ***
${minutes_ago}    0.1
${hours_ago}    0
${days_ago}    0
${weeks_ago}    0

*** Test Cases ***
#DIMM:1
Verify DIMM:1 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    DIMM:1

Verify DIMM:1 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    DIMM:1    logevent_summaryState    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#DIMM:2
Verify DIMM:2 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    DIMM:2

Verify DIMM:2 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    DIMM:2    logevent_summaryState    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#EPM:1
Verify EPM:1 Enabled
    [Tags]    epm:1    enabled
    Verify Summary State    ${STATES}[enabled]    EPM:1

Verify EPM:1 SummaryState timing
    [Tags]    epm:1    enabled    timing
    Verify Time Delta    EPM:1    logevent_summaryState    minute=${minutes_ago}    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

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
Verify ESS:102 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:102

Verify ESS:102 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:102    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:103
Verify ESS:103 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:103

Verify ESS:103 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:103    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:104
Verify ESS:104 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:104

Verify ESS:104 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:104    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:105
Verify ESS:105 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:105

Verify ESS:105 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:105    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:106
Verify ESS:106 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:106

Verify ESS:106 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:106    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:107
Verify ESS:107 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:107

Verify ESS:107 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:107    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:108
Verify ESS:108 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:108

Verify ESS:108 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:108    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:201
Verify ESS:201 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:201

Verify ESS:201 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:201    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:202
Verify ESS:202 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:202

Verify ESS:202 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:202    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:203
Verify ESS:203 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:203

Verify ESS:203 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:203    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:204
Verify ESS:204 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:204

Verify ESS:204 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:204    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

# ESS:205
Verify ESS:205 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:205

Verify ESS:205 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:205    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ESS:301
Verify ESS:301 Enabled
    [Tags]    enabled
    Verify Summary State    ${STATES}[enabled]    ESS:301

Verify ESS:301 SummaryState timing
    [Tags]    enabled    timing
    Verify Time Delta    ESS:301    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
