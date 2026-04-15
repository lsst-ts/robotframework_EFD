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
Verify ESS:104 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=104

Verify ESS:105 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=105

Verify ESS:106 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=106

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

Verify ESS:114 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=114

Verify ESS:115 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=115

Verify ESS:116 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=116

Verify ESS:117 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=117

Verify ESS:121 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=121

Verify ESS:122 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=122

Verify ESS:123 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=123
    
Verify ESS:124 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=124
    
Verify ESS:125 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=125
    
Verify ESS:126 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=126

Verify ESS:127 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=127
    
Verify ESS:128 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=128

Verify ESS:129 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=129
    
Verify ESS:201 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=201

Verify ESS:202 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=202

Verify ESS:204 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=204

Verify ESS:301 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=301

Verify ESS:303 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=303

Verify ESS:304 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=304

Verify ESS:305 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=305

Verify ESS:306 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=306

Verify ESS:308 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=308

Verify ESS:404 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=404

Verify ESS:405 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=405

Verify ESS:441 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=441

Verify ESS:442 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=442

Verify ESS:443 Shutdown
    [Tags]    envsys
    Verify Shutdown Process    ESS    index=443
