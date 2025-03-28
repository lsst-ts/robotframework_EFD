*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown

*** Test Cases ***
# DIMM
Verify DIMM:1 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    DIMM    index=1

Verify DIMM:2 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    DIMM    index=2

# DSM
Verify DSM:1 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    DSM    index=1

Verify DSM:2 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    DSM    index=2

# DREAM
Verify DREAM Shutdown
    [Tags]    envsys
    Verify Shutdown Process    DREAM

# EAS
Verify EAS Shutdown
    [Tags]    envsys
    Verify Shutdown Process    EAS

# ESS
Verify ESS:1 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=1

Verify ESS:104 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=104

Verify ESS:105 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=105

Verify ESS:106 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=106

Verify ESS:107 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=107

Verify ESS:108 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=108

Verify ESS:109 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=109

Verify ESS:110 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=110

Verify ESS:111 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=111

Verify ESS:112 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=112

Verify ESS:113 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=113

Verify ESS:201 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=201

Verify ESS:202 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=202

Verify ESS:203 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=203

Verify ESS:204 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=204

Verify ESS:301 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=301

Verify ESS:303 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=303

Verify ESS:305 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=305

Verify ESS:306 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=306
