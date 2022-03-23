*** Settings ***
Library    QueryEfd
Library    Collections
Library    String
Resource    ../Common_Keywords.resource
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Force Tags    disabled

*** Variables ***
${topic}    logevent_settingsApplied
@{fields}    "private_sndStamp"    "settingsVersion"

*** Test Cases ***
Verify DSM:1 Disabled
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[disabled]    DSM:1    True

Verify DSM:1 SettingsApplied
    [Tags]    eas_ae
    ${output}=    Get Recent Samples    DSM:1    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Contain    ${output}    Empty DataFrame

Verify DSM:1 Event timing
    [Tags]    eas_ae
    Verify Time Delta    DSM    logevent_summaryState    logevent_settingsApplied    10    index=1

Verify DSM:2 Disabled
    [Tags]    eas_ae
    Verify Summary State    ${STATES}[disabled]    DSM:2    True

Verify DSM:2 SettingsApplied
    [Tags]    eas_ae
    ${output}=    Get Recent Samples    DSM:2    ${topic}    ${fields}    1
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Contain    ${output}    Empty DataFrame

Verify DSM:2 Event timing
    [Tags]    eas_ae
    Verify Time Delta    DSM    logevent_summaryState    logevent_settingsApplied    10    index=2
