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
Verify CCOODS SoftwareVersions
    [Tags]    comcam
    Verify SoftwareVersions    CCOODS

Verify CCCamera SoftwareVersions
    [Tags]    comcam
    Verify SoftwareVersions    CCCamera

Verify CCHeaderService SoftwareVersions
    [Tags]    comcam
    Verify SoftwareVersions    CCHeaderService
