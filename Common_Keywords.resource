*** Settings ***
Resource    CSC_Lists.resource

*** Variables ***
${ca_topic}    logevent_configurationApplied
@{ca_fields}    "private_sndStamp"    "configurations"    "version"    "url"
${cav_topic}    logevent_configurationsAvailable
@{cav_fields}    "private_sndStamp"    "overrides"    "version"    "url"    "schemaVersion"
${swv_topic}    logevent_softwareVersions
@{swv_fields}    "private_sndStamp"    "cscVersion"    "openSpliceVersion"    "salVersion"   "xmlVersion"

*** Keywords ***
Verify ConfigurationApplied
    [Arguments]    ${csc}    ${csc_index}=None
    ${output}=    Get Recent Samples    ${csc}    ${ca_topic}    ${ca_fields}    1    ${csc_index}
    ${output}=    Convert to String    ${output}
    Log    ${output}
    IF    $csc in $NON_CONFIG    
        Should Contain    ${output}    Empty DataFrame
    ELSE
        Log    ${output}
        #${line}=    Get Line    ${output}    -1
        #@{words}=    Split String    ${line}
        #Log Many    ${words}[2]    ${words}[3]
        #@{time}=    Split String    ${words}[3]    +
        #Set Suite Variable    ${watcher_settingsapplied_event_time}    ${time}[0]
    END

Verify ConfigurationsAvailable
    [Arguments]    ${csc}    ${csc_index}=None
    ${output}=    Get Recent Samples    ${csc}    ${sv_topic}   ${sv_fields}    1    ${csc_index}
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${line}=    Get Line    ${output}    1
    @{words}=    Split String    ${line}
    Log Many    ${words}
    @{time}=    Split String    ${words}[3]    +
    Set Suite Variable    ${ataos_configsavailable_event_time}    ${time}[0]
    Log Many    Overrides: ${words}[4]    Version: ${words}[5]    URL: ${words}[6]
    Should Not Be Empty    ${words}[4]
    Should Not Be Empty    ${words}[5]
    Should Not Be Empty    ${words}[6]

Verify SoftwareVersions
    [Arguments]    ${csc}    ${csc_index}=None
    ${output}=    Get Recent Samples    ${csc}    ${swv_topic}    ${swv_fields}    1    ${csc_index}
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${line}=    Get Line    ${output}    1
    @{words}=    Split String    ${line}
    Log Many    ${words}[2]    ${words}[3]
    @{time}=    Split String    ${words}[3]    +
    Set Suite Variable    ${ataos_softwareversions_event_time}    ${time}[0]
    Should Contain    ${words}    ${SALVersion}
    Should Contain    ${words}    ${XMLVersion}
    Log    CSC Version: ${words}[4]
    Should Not Be Empty    ${words}[4]

Verify Shutdown Process
    [Arguments]    ${csc}    ${csc_index}=None
    @{fields}=    Create List    "private_sndStamp"    "summaryState"
    @{states_keys}=    Get Dictionary Keys    ${STATES}
    @{shutdown_list}=    Create List    ${states_keys}[3]    ${states_keys}[4]    ${states_keys}[0]    ${states_keys}[1]
    ${output}=    Get Recent Samples    ${csc}    logevent_summaryState   ${fields}    4    ${csc_index}
    ${output}=    Convert to String    ${output}
    Log    ${output}
    Should Not Contain    ${output}    Empty DataFrame
    ${first}=    Get Value From Dataframe    ${output}    1    4
    ${second}=    Get Value From Dataframe    ${output}    2    4
    ${thrid}=    Get Value From Dataframe    ${output}    3    4
    ${fourth}=    Get Value From Dataframe    ${output}    4    4
    @{state_list}=    Create List    ${states_keys}[${first-1}]    ${states_keys}[${second-1}]    ${states_keys}[${thrid-1}]    ${states_keys}[${fourth-1}]
    Should Be Equal    ${state_list}    ${shutdown_list}    msg=Incorrect Shutdown Order: ${state_list}    values=False

Get Value From Dataframe
    [Arguments]    ${dataframe_str}    ${row}    ${column}
    ${line}=    Get Line    ${dataframe_str}    ${row}
    @{words}=    Split String    ${line}
    [Return]    ${${words}[${column}]}

Verify Time Delta
    [Arguments]    ${csc}    ${topic_1}    ${topic_2}    ${time_window}    ${index}=None
    Log Many    ${csc}    ${topic_1}    ${topic_2}    ${time_window}    ${index}
    ${timestamp1}=    Get Topic Sent Time    ${csc}    ${topic_1}    "private_sndStamp"    1
    ${time_1}=    Convert Date    ${timestamp1}    result_format=timestamp    date_format=%Y-%m-%dT%H:%M:%S.%f
    ${timestamp2}=    Get Topic Sent Time    ${csc}    ${topic_2}    "private_sndStamp"    1
    ${time_2}=    Convert Date    ${timestamp2}    result_format=timestamp    date_format=%Y-%m-%dT%H:%M:%S.%f
    ${delta}=    Subtract Date from Date    ${time_1}    ${time_2}
    ${abs_delta}=    Evaluate    abs(${delta})
    Should Be True    ${abs_delta} < ${time_window}
