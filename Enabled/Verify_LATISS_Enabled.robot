*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
#ATCamera
Verify ATCamera Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATCamera

Verify ATCamera SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATCamera    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATHeaderService
Verify ATHeaderService Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATHeaderService

Verify ATHeaderService SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATHeaderService    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#OCPS:1
Verify OCPS:1 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    OCPS:1

Verify OCPS:1 SummaryState timing
    [Tags]    timing
    Verify Time Delta    OCPS:1    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATOODS
Verify ATOODS Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATOODS

Verify ATOODS SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATOODS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATSpectrograph
Verify ATSpectrograph Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATSpectrograph

Verify ATSpectrograph SummaryState timing
    [Tags]    timing
    Verify Time Delta    ATSpectrograph    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
