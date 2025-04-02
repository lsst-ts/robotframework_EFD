*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    shutdown    obssys

*** Test Cases ***
Verify OCPS:101 Shutdown
    [Tags]
    Verify Shutdown Process    OCPS    index=101

Verify Scheduler:1 Shutdown
    [Tags]
    Verify Shutdown Process    Scheduler    index=1

Verify Scheduler:2 Shutdown
    [Tags]
    Verify Shutdown Process    Scheduler    index=2

Verify Scheduler:3 Shutdown
    [Tags]
    Verify Shutdown Process    Scheduler    index=3

Verify ScriptQueue:1 Shutdown
    [Tags]
    Verify Shutdown Process    ScriptQueue    1

Verify ScriptQueue:2 Shutdown
    [Tags]
    Verify Shutdown Process    ScriptQueue    index=2

Verify ScriptQueue:3 Shutdown
    [Tags]
    Verify Shutdown Process    ScriptQueue    index=3

Verify Watcher Shutdown
    [Tags]
    Verify Shutdown Process    Watcher
