*** Settings ***
Resource    Global_Vars.resource
Resource    CSC_Lists.resource
Resource    Common_Keywords.resource
Library     QueryEfd    ${SALVersion}    ${XMLVersion}    ${OSPLVersion}
Library     Process

*** Variables ***

*** Test Cases ***
# STANDBY
Execute auxtel_offline_standby.py
    [Tags]    auxtel    standby
    ${result}=    Run Process    auxtel_offline_standby
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Execute maintel_offline_standby.py
    [Tags]    maintel    standby
    ${result}=    Run Process    maintel_offline_standby
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Generate Standby Report
    [Tags]    standby
    ${result}=    Run Process    robot    -A    Vars.txt    -A    Test_Report_Standby.list
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Should Be Equal As Integers    ${result.rc}    0

# DISABLED
Execute auxtel_standby_disabled.py
    [Tags]    auxtel    disabled
    ${result}=    Run Process    auxtel_standby_disabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    # auxtel_standby_disabled runs two scripts.
    Wait Until Script Completes    set_summary_state.py    1    5
    Wait Until Script Completes    set_summary_state.py    1    5

Execute eas_standby_disabled.py
    [Tags]    eas    disabled
    ${result}=    Run Process    eas_standby_disabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Execute gencam_standby_disabled.py
    [Tags]    gencam    disabled
    ${result}=    Run Process    gencam_standby_disabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Execute maintel_standby_disabled.py
    [Tags]    maintel    disabled
    ${result}=    Run Process    maintel_standby_disabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    # maintel_standby_disabled runs two scripts.
    Wait Until Script Completes    set_summary_state.py    1    5
    Wait Until Script Completes    set_summary_state.py    1    5

Execute obssys2_standby_disabled.py
    [Tags]    disabled
    ${result}=    Run Process    obssys2_standby_disabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Generate Disabled Report
    [Tags]    disabled
    ${result}=    Run Process    robot    -A    Vars.txt    -A    Test_Report_Disabled.list
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Should Be Equal As Integers    ${result.rc}    0

# ENABLED
Execute auxtel_disabled_enabled.py
    [Tags]    auxtel    enabled
    ${result}=    Run Process    auxtel_disabled_enabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    # auxtel_disabled_enabled runs two scripts.
    Wait Until Script Completes    set_summary_state.py    1    5
    Wait Until Script Completes    set_summary_state.py    1    5

Execute eas_disabled_enabled.py
    [Tags]    eas    enabled
    ${result}=    Run Process    eas_disabled_enabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Execute gencam_disabled_enabled.py
    [Tags]    gencam    enabled
    ${result}=    Run Process    gencam_disabled_enabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Execute maintel_disabled_enabled.py
    [Tags]    maintel    enabled
    ${result}=    Run Process    maintel_disabled_enabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    # maintel_disabled_enabled runs two scripts.
    Wait Until Script Completes    set_summary_state.py    1    5
    Wait Until Script Completes    set_summary_state.py    1    5

Execute obssys2_disabled_enabled.py
    [Tags]    enabled
    ${result}=    Run Process    obssys2_disabled_enabled
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Wait Until Script Completes    set_summary_state.py    1    5

Generate Enabled Report
    [Tags]    enabled
    ${result}=    Run Process    robot    -A    Vars.txt    -A    Test_Report_Enabled.list
    Log Many    ${result.rc}    ${result.stdout}    ${result.stderr}
    Should Be Equal As Integers    ${result.rc}    0
