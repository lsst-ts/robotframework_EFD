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
    [Tags]    at_light_cal
    Verify SoftwareVersions    ATMonochromator

Verify FiberSpectrograph SoftwareVersions
    [Tags]    at_light_cal
    Verify SoftwareVersions    FiberSpectrograph    3
