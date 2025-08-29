*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    mtreflector

*** Variables ***

*** Test Cases ***
# MTReflector
Verify MTReflector reflectorStatus
    [Tags]    robot:continue-on-failure
    Comment    The reflectorStatus Event is sent in response to the open and close commands.
    ${dataframe}=    Get Recent Samples    MTReflector    logevent_reflectorStatus    ["reflectorStatus",]    num=1
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Integers    ${dataframe.reflectorStatus.values}[0]    1    #Disconnected

Connect MTReflector
    [Tags]
    Comment    Transition MTReflector to Disabled.
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTReflector    Disabled     1
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTReflector is Connected
    [Tags]
    ${dataframe}=    Get Recent Samples    MTReflector    logevent_reflectorStatus    ["reflectorStatus",]    num=1
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.reflectorStatus.values}[0]    0    #Connected

Verify MTReflector reflectorStatus is Recent
    [Tags]    timing    robot:continue-on-failure
    Verify Time Delta    MTReflector    logevent_reflectorStatus    second=30    minute=0    hour=0   day=0    week=0

Enable MTReflector
    [Tags]
    Comment    Transition MTReflector to Disabled.
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTReflector    Enabled     1
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Open MTReflector
    [Tags]
    Comment    Issue the open command.
    ${scripts}    ${states}=    Execute Integration Test    run_command    1    MTReflector    open
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    Log to Console    Wait for doors to open.
    Sleep    30s    reason="Wait for doors to open."

Verify MTReflector is Open
    [Tags]
    ${dataframe}=    Get Recent Samples    MTReflector    logevent_reflectorStatus    ["reflectorStatus",]    num=1
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.reflectorStatus.values}[0]    2    #Open

Close MTReflector
    [Tags]
    Comment    Issue the close command.
    ${scripts}    ${states}=    Execute Integration Test    run_command    1    MTReflector    close
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTReflector is Closed
    [Tags]
    ${dataframe}=    Get Recent Samples    MTReflector    logevent_reflectorStatus    ["reflectorStatus",]    num=1
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.reflectorStatus.values}[0]    3    #Closed

Disconnect MTReflector
    [Tags]
    Comment    Transition MTReflector to Standby.
    ${scripts}    ${states}=    Execute Integration Test    csc_state_transition    MTReflector    Standby     1
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify MTReflector is Disconnected
    [Tags]
    ${dataframe}=    Get Recent Samples    MTReflector    logevent_reflectorStatus    ["reflectorStatus",]    num=1
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.reflectorStatus.values}[0]    1
