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
Verify DSM:1 SoftwareVersions
    [Tags]    eas_ae
    Verify SoftwareVersions    DSM    1

Verify DSM:2 SoftwareVersions
    [Tags]    eas_ae
    Verify SoftwareVersions    DSM    2
