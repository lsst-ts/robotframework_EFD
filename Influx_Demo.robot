*** Settings ***
Library    EfdQuery
Library    Collections
Resource    Global_Vars.resource

*** Variables ***
${topic}    logevent_summaryState

*** Test Cases ***
List EFD Names
    Comment    List names
    @{output}=    Get Efd Names
    Log    ${output}
    Lists Should Be Equal    ${output}    ${efd_names}

List EFD Topics
    ${output}=    Get Efd Topics
    Log    ${output}

List Topic Fields
    ${output}=    Get Topic Fields    ATAOS    ${topic}
    Log    ${output}
    Should Contain    ${output}    summaryState

Test Summary State
    FOR    ${csc}    IN    @{atcs}
        ${output}=    Get Recent Samples    ${csc}    ${topic}    private_sndStamp    1
    END
