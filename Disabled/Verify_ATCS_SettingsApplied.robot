*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    settings_applied

*** Variables ***
${topic}    logevent_settingsApplied
@{fields}    "private_sndStamp"    "settingsVersion"

*** Test Cases ***
Verify ATAOS SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATAOS    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame

Verify ATDome SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATDome    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame

Verify ATDomeTrajectory SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATDomeTrajectory    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame

Verify ATHexapod SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATHexapod    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${line}=    Get Line    ${output}    -1
    @{words}=    Split String    ${line}
    Log    ${words}[3]

Verify ATMCS SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATMCS    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Contain    ${output}    Empty DataFrame

Verify ATPneumatics SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATPneumatics    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    
    Should Contain    ${output}    Empty DataFrame

Verify ATPtg SettingsApplied
    [Tags]    atcs
    ${output}=    Get Recent Samples    ATPtg    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Contain    ${output}    Empty DataFrame
