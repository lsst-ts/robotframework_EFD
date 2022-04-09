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
Verify ATOODS SoftwareVersions
    [Tags]    latiss
    Verify SoftwareVersions    ATOODS

Verify ATCamera SoftwareVersions
    [Tags]    latiss
    Verify SoftwareVersions    ATCamera

Verify ATHeaderService SoftwareVersions
    [Tags]    latiss
    Verify SoftwareVersions    ATHeaderService

Verify ATSpectrograph SoftwareVersions
    [Tags]    latiss
    Verify SoftwareVersions    ATSpectrograph
