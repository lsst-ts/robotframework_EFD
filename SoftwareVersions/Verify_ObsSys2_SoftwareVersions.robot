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
Verify Scheduler:1 SoftwareVersions
    [Tags]    obsys2
    Verify SoftwareVersions    Scheduler    1

Verify Scheduler:2 SoftwareVersions
    [Tags]    obsys2 
    Verify SoftwareVersions    Scheduler    2

Verify OCPS:1 SoftwareVersions
    [Tags]    obsys2
    Verify SoftwareVersions    OCPS    1

Verify OCPS:2 SoftwareVersions
    [Tags]    obsys2
    Verify SoftwareVersions    OCPS    2
