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
Verify ATMonochromator SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    ATMonochromator

Verify FiberSpectrograph SoftwareVersions
    [Tags]    obsys1
    Verify SoftwareVersions    FiberSpectrograph    3
