*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Force Tags    software_versions

*** Variables ***

*** Test Cases ***
Verify ATCamera SoftwareVersions
    [Tags]    camera
    Verify SoftwareVersions    ATCamera

Verify CCCamera SoftwareVersions
    [Tags]    camera
    Verify SoftwareVersions    CCCamera
