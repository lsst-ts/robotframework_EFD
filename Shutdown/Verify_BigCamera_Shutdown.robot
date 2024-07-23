*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown
Suite Setup   Set EFD Values

*** Test Cases ***
Verify BigCamera Shutdown
    [Tags]
    Set Tags    ${BigCamera}
    Verify Shutdown Process    ${BigCamera}

Verify OODS Shutdown
    [Tags]
    Set Tags    ${OODS}
    Verify Shutdown Process    ${OODS}

Verify HeaderService Shutdown
    [Tags]
    Set Tags    ${HeaderService}
    Verify Shutdown Process    ${HeaderService}

Verify OCPS:2||3 Shutdown
    [Tags]
    Set Tags    OCPS:${OcpsIndex}
    Verify Shutdown Process    OCPS    index=${OcpsIndex}
