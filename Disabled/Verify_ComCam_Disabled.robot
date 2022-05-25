*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Library    QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library    Collections
Library    String
Library    DateTime
Resource    ../Common_Keywords.resource
Force Tags    comcam

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify CCOODS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    CCOODS

Verify CCOODS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    CCOODS

Verify CCCamera Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    CCCamera

Verify CCCamera ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    CCCamera

Verify CCCamera ConfigurationApplied timing
    [Tags]    config_applied    timing
    Verify Time Delta    CCCamera    logevent_summaryState    logevent_configurationApplied    ${time_window}

Verify CCHeaderService Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    CCHeaderService

Verify CCHeaderService ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    CCHeaderService
