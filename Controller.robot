*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     OperatingSystem
Variables    cycle.env
Force Tags
Suite Setup    Run    cd configs && curl -s https://raw.githubusercontent.com/lsst-ts/ts_cycle_build/main/cycle/cycle.env --output cycle.env

*** Variables ***

*** Test Cases ***
Verify Cycle
    [Tags]
    Log    ${CYCLE}
    Log    ${ts_integrationtests}

Execute maintel_disabled_enabled.py
    [Tags]
    ${output}=    Run    maintel_disabled_enabled
    Log    ${output}

Execute maintel_offline_standby.py Report
    [Tags]
    ${output}=    Run    robot -A Vars.txt -A Test_Report_Enabled.list
    Log    ${output}
    
