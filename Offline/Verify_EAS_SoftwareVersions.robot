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
Verify DIMM:1 SoftwareVersions
    [Tags]    eas
    Verify SoftwareVersions    DIMM    1

Verify DIMM:2 SoftwareVersions
    [Tags]    eas
    Verify SoftwareVersions    DIMM    2

Verify WeatherStation:1 SoftwareVersions
    [Tags]    eas
    Verify SoftwareVersions    WeatherStation    1
