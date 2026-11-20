*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Library     Collections
Force Tags    auxtel_pos_limits

*** Variables ***
@{azimuthInPosition}    inPosition
@{allAxesInPosition}    inPosition
@{atMountState}         state
@{in_pos_expected}      False
@{states_expected}      8

*** Test Cases ***
Verify AuxTel Position Limits
    [Tags]
    ${dataframe}=    Get Recent Samples    ATMCS    logevent_positionLimits    ["maximum0", "maximum1", "maximum2", "maximum3", "maximum4", "minimum0", "minimum1", "minimum2", "minimum3","minimum4",]    1    None
    Should Not Be Empty    ${dataframe}
    Should Be Equal As Integers    ${dataframe.maximum0.values}[0]    90
    Should Be Equal As Integers    ${dataframe.maximum1.values}[0]    270
    Should Be Equal As Integers    ${dataframe.maximum2.values}[0]    165
    Should Be Equal As Integers    ${dataframe.maximum3.values}[0]    165
    Should Be Equal As Integers    ${dataframe.maximum4.values}[0]    180
    Should Be Equal As Integers    ${dataframe.minimum0.values}[0]    5
    Should Be Equal As Integers    ${dataframe.minimum1.values}[0]    -270
    Should Be Equal As Integers    ${dataframe.minimum2.values}[0]    -165
    Should Be Equal As Integers    ${dataframe.minimum3.values}[0]    -165
    Should Be Equal As Integers    ${dataframe.minimum4.values}[0]    0

Verify AuxTel Elevation Limit - Maximum
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_point_azel    0    91
    Should Be Equal As Integers    ${states}[0]    11    #configure_failed

Verify AuxTel Elevation Limit - Script Minium
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_point_azel    0    -1
    Should Be Equal As Integers    ${states}[0]    11    #configure_failed

Verify AuxTel Elevation Limit - Minimum
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_point_azel    0    4
    Should Be Equal As Integers    ${states}[0]    10    #failed

Verify AuxTel Azimuth Limit - Maximum
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_point_azel    271    80
    Should Be Equal As Integers    ${states}[0]    10    #failed

Verify AuxTel Azimuth Limit - Minimum
    [Tags]    execute
    ${scripts}    ${states}=    Execute Integration Test    auxtel_point_azel    -271    80
    Should Be Equal As Integers    ${states}[0]    10    #failed
