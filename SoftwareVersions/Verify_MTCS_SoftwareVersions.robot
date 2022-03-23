*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    software_versions

*** Variables ***

*** Test Cases ***
Verify MTMount SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTMount

Verify MTPtg SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTPtg

Verify MTDome SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTDome

Verify MTDomeTrajectory SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTDomeTrajectory

Verify MTAOS SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTAOS

Verify MTHexapod:1 SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTHexapod    1

Verify MTHexapod:2 SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTHexapod    2

Verify MTRotator SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTRotator

Verify MTM1M3 SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTM1M3

Verify MTM2 SoftwareVersions
    [Tags]    mtcs
    Verify SoftwareVersions    MTM2
