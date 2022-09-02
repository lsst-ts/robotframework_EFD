*** Settings ***
Resource    ../../Global_Vars.resource
Resource    ../../CSC_Lists.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Collections
Library     String
Library     DateTime
Force Tags    at_night_ops

*** Variables ***
${time_window}    10

*** Test Cases ***
Verify ATDome AzimuthInPosition
    [Tags]    acq_take_image
    Verify Time Delta    ATDome    command_moveAzimuth    logevent_azimuthInPosition    60
    Verify Topic Attribute    ATDome    logevent_azimuthInPosition    ["inPosition",]    ["True",]
    
