*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    software_versions

*** Variables ***

*** Test Cases ***
Verify ATAOS SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATAOS

Verify ATDome SoftwareVersions
    [Tags]    atcs
    Verify SoftwareVersions    ATDome

Verify ATDomeTrajectory SoftwareVersions
    [Tags]    atcs
    Verify SoftwareVersions    ATDomeTrajectory

Verify ATHexapod SoftwareVersions
    [Tags]    atcs
    Verify SoftwareVersions    ATHexapod

Verify ATMCS SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATMCS

Verify ATPneumatics SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATPneumatics

Verify ATPtg SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATPtg
