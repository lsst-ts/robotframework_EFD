*** Settings ***
Resource    CSC_Lists.resource

*** Variables ***
${ca_topic}    logevent_configurationApplied
@{ca_fields}    "private_sndStamp"    "configurations"    "version"    "url"    "otherInfo"
${cav_topic}    logevent_configurationsAvailable
@{cav_fields}    "private_sndStamp"    "overrides"    "version"    "url"    "schemaVersion"
${swv_topic}    logevent_softwareVersions
@{swv_fields}    "private_sndStamp"    "cscVersion"    "openSpliceVersion"    "salVersion"   "xmlVersion"
${version_regex}    ^v?(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:[.-]((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$

*** Keywords ***
Verify ConfigurationApplied
    [Arguments]    ${csc}    ${csc_index}=None
    ${output}=    Get Recent Samples    ${csc}    ${ca_topic}    ${ca_fields}    1    ${csc_index}
    ${output}=    Convert to String    ${output}
    Log    ${output}
    IF    $csc in $NON_CONFIG    
        Should Contain    ${output}    Empty DataFrame
    ELSE
        ${line}=    Get Line    ${output}    -1
        @{words}=    Split String    ${line}
        Log Many    Configurationss: ${words}[3]    Version: ${words}[4]    URL: ${words}[5]
        Should Not Be Empty    ${words}[4]
        Should Not Be Empty    ${words}[6]
        Should Contain Any    ${words}[6]    https://    file://
        Should Not Be Empty    ${words}[5]
        Should Match Regexp    ${words}[5]    ${version_regex}
    END

Verify ConfigurationsAvailable
    [Arguments]    ${csc}    ${csc_index}=None
    ${output}=    Get Recent Samples    ${csc}    ${cav_topic}    ${cav_fields}    1    ${csc_index}
    ${output}=    Convert to String    ${output}
    Log    ${output}
    IF    $csc in $NON_CONFIG
        Should Contain    ${output}    Empty DataFrame
    ELSE
        # Get Overrides value.
        ${output}=    Get Recent Samples    ${csc}    ${cav_topic}   ${cav_fields}[1]    1    ${csc_index}
        ${output}=    Convert to String    ${output}
        ${line}=    Get Line    ${output}    -1
        @{words}=    Split String    ${line}
        # The overrides field can be empty.
        ${length}=    Get Length    ${words}
        Run Keyword If    ${length} > 2    Set Test Variable    ${overrides}    ${words}[2]
        Run Keyword Unless    ${length} > 2    Set Test Variable    ${overrides}    EMPTY
        # Get Version value.
        ${output}=    Get Recent Samples    ${csc}    ${cav_topic}   ${cav_fields}[2]    1    ${csc_index}
        ${output}=    Convert to String    ${output}
        ${line}=    Get Line    ${output}    -1
        @{words}=    Split String    ${line}
        ${version}=    Set Variable    ${words}[2]
        # Get URL value.
        ${output}=    Get Recent Samples    ${csc}    ${cav_topic}   ${cav_fields}[3]    1    ${csc_index}
        ${output}=    Convert to String    ${output}
        ${line}=    Get Line    ${output}    -1
        @{words}=    Split String    ${line}
        ${url}=    Set Variable    ${words}[2]
        # Get SchemaVersion value.
        ${output}=    Get Recent Samples    ${csc}    ${cav_topic}   ${cav_fields}[4]    1    ${csc_index}
        ${output}=    Convert to String    ${output}
        ${line}=    Get Line    ${output}    -1
        @{words}=    Split String    ${line}
        ${schema_version}=    Set Variable    ${words}[2]
        # Verify field values.
        Log Many    Overrides: ${overrides}    Version: ${version}    URL: ${url}    SchemaVersion: ${schema_version}
        Should Not Be Empty    ${url}
        Should Contain Any    ${url}    https://    file://
        Should Not Be Empty    ${version}
        Should Match Regexp    ${version}    ${version_regex}
        Should Not Be Empty    ${schema_version}
    END

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
