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
    [Tags]    software_versions    timing
    Verify Time Delta    ATCamera    command_enabled    logevent_summaryState

#ATHeaderService
Verify ATHeaderService Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATHeaderService

Verify ATHeaderService SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHeaderService    command_enabled    logevent_summaryState

#OCPS:1
Verify OCPS:1 Enabled
    [Tags]    obsys2
    Verify Summary State    ${STATES}[enabled]    OCPS:1

Verify OCPS:1 SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    OCPS    command_enabled    logevent_summaryState    index=1

#ATOODS
Verify ATOODS Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATOODS

Verify ATOODS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATOODS    command_enabled    logevent_summaryState

#ATSpectrograph
Verify ATSpectrograph Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATSpectrograph

Verify ATSpectrograph SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATSpectrograph    command_enabled    logevent_summaryState
