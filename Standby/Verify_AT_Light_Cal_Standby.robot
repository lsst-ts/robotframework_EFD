*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    standby

*** Variables ***

*** Test Cases ***
Verify ATMonochromator Standby
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[standby]    ATMonochromator

Verify ATMonochromator SettingVersions
    [Tags]    at_light_cal
    ${output}=    Get Recent Samples    ATMonochromator    ${sv_topic}   ${sv_fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${line}=    Get Line    ${output}    1
    @{words}=    Split String    ${line}
    Log Many    ${words}
    @{time}=    Split String    ${words}[3]    +
    Set Suite Variable    ${ataos_settingseversions_event_time}    ${time}[0]
    Should Not Be Empty    ${words}[4]
    Should Not Be Empty    ${words}[5]
    Should Not Be Empty    ${words}[6]

Verify FiberSpectrograph:3 Standby
    [Tags]    at_light_cal
    Verify Summary State    ${STATES}[standby]    FiberSpectrograph:3
