*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    enabled

*** Variables ***

*** Test Cases ***
Verify ATArchiver Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATArchiver

Verify ATCamera Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATCamera

Verify ATHeaderService Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATHeaderService

Verify ATSpectrograph Enabled
    [Tags]    latiss
    Verify Summary State    ${STATES}[enabled]    ATSpectrograph
