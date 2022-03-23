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
Verify CCArchiver SoftwareVersions
    [Tags]    comcam
    Verify SoftwareVersions    CCArchiver

Verify CCCamera SoftwareVersions
    [Tags]    comcam
    Verify SoftwareVersions    CCCamera

Verify CCHeaderService SoftwareVersions
    [Tags]    comcam
    Verify SoftwareVersions    CCHeaderService
