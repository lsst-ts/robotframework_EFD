*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    atcs

*** Test Cases ***
#ATAOS
Verify ATAOS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATAOS

Verify ATAOS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATAOS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATAOS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATAOS

Verify ATAOS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATAOS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATDome
Verify ATDome Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDome

Verify ATDome SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDome    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATDome ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATDome

Verify ATDome ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATDome    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATDomeTrajectory
Verify ATDomeTrajectory Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATDomeTrajectory

Verify ATDomeTrajectory SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATDomeTrajectory    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATDomeTrajectory ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATDomeTrajectory

Verify ATDomeTrajectory ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATDomeTrajectory    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATHexapod
Verify ATHexapod Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATHexapod

Verify ATHexapod SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATHexapod    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

Verify ATHexapod ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATHexapod

Verify ATHexapod ConfigurationApplied Event timing 
    [Tags]    config_applied    timing
    Verify Time Delta    ATHexapod    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATMCS
Verify ATMCS Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATMCS

Verify ATMCS SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATMCS    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ATMCS ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATMCS

Verify ATMCS ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATMCS    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATPneumatics
Verify ATPneumatics Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATPneumatics

Verify ATPneumatics SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPneumatics    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ATPneumatics ConfigurationApplied Event
    [Tags]    config_applied
    Verify ConfigurationApplied    ATPneumatics

Verify ATPneumatics ConfigurationApplied Event timing
    [Tags]    config_applied    timing
    Verify Time Delta    ATPneumatics    logevent_configurationApplied    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}

#ATPtg
Verify ATPtg Disabled
    [Tags]    disabled
    Verify Summary State    ${STATES}[disabled]    ATPtg

Verify ATPtg SummaryState timing
    [Tags]    software_versions    timing
    Verify Time Delta    ATPtg    logevent_summaryState    hour=${hours_ago}    day=${days_ago}    week=${weeks_ago}
    
Verify ATPtg ConfigurationApplied Event
    [Tags]    config_applied
    # Non-configurable: dataframe empty, no timing test.
    Verify ConfigurationApplied    ATPtg
