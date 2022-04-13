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
Verify ATCamera SoftwareVersions
    [Tags]    camera
    Verify SoftwareVersions    ATCamera

Verify CCCamera SoftwareVersions
    [Tags]    camera
    Verify SoftwareVersions    CCCamera
