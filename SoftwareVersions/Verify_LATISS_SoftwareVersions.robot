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
Verify ATArchiver SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATArchiver

Verify ATCamera SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATCamera

Verify ATHeaderService SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATHeaderService

Verify ATSpectrograph SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATSpectrograph
