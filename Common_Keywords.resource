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
    Log Many    Get Recent Samples    ${csc}    ${ca_topic}    ${ca_fields}    1    ${csc_index}
    ${dataframe}=    Get Recent Samples    ${csc}    ${ca_topic}    ${ca_fields}    1    ${csc_index}
    Log    ${dataframe}
    IF    $csc in $NON_CONFIG    
        Should Be True    $dataframe.empty
    ELSE
        ${configurations}=    Evaluate    $dataframe.configurations.values[0]
        ${version}=    Evaluate    $dataframe.version.values[0]
        ${url}=    Evaluate    $dataframe.url.values[0]
        Log Many    Configurations: ${configurations}    Version: ${version}    URL: ${url}
        Should Not Be Empty    ${configurations}
        Should Not Be Empty    ${version}]
        Should Contain Any    ${url}    https://    file://
        Should Match Regexp    ${version}    ${version_regex}    msg="Version is not in Semantic Version format."    values=False
    END

Verify ConfigurationsAvailable
    [Arguments]    ${csc}    ${csc_index}=None
    ${dataframe}=    Get Recent Samples    ${csc}    ${cav_topic}    ${cav_fields}    1    ${csc_index}
    Log    ${dataframe}
    IF    $csc in $NON_CONFIG
        Should Be True    $dataframe.empty
    ELSE
        ${version}=    Evaluate    $dataframe.version.values[0]
        ${url}=    Evaluate    $dataframe.url.values[0]
        ${schemaVersion}=    Evaluate    $dataframe.schemaVersion.values[0]
        ${overrides}=    Evaluate    $dataframe.overrides.values[0]
        # Verify field values.
        Log Many    Overrides: ${overrides}    Version: ${version}    URL: ${url}    SchemaVersion: ${schema_version}
        Should Not Be Empty    ${url}
        Should Contain Any    ${url}    https://    file://
        Should Not Be Empty    ${schema_version}
        # The Camera CSCs handle schemaVersion uniquely, so skip those tests.
        IF    $csc not in $Camera
            ${schema_version_expected}=    Evaluate    $dataframe.url.values[0].split("/")[-1]
            Should Match    ${schema_version}    ${schema_version_expected}
        END
        Should Not Be Empty    ${version}
        Should Match Regexp    ${version}    ${version_regex}    msg="Version is not in Semantic Version format."    values=False
    END

Verify SoftwareVersions
    [Arguments]    ${csc}    ${csc_index}=None
    ${dataframe}=    Get Recent Samples    ${csc}    ${swv_topic}    ${swv_fields}    1    ${csc_index}
    Log    ${dataframe}
    Should Not Be True    $dataframe.empty
    ${sal_ver}=    Evaluate    $dataframe.salVersion.values[0]
    ${xml_ver}=    Evaluate    $dataframe.xmlVersion.values[0]
    ${csc_ver}=    Evaluate    $dataframe.cscVersion.values[0]
    ${ospl_ver}=    Evaluate    $dataframe.openSpliceVersion.values[0]
    Log Many    Expected: SALVersion: ${SALVersion}, XMLVersion: ${XMLVersion}, OSPLVersion: ${OSPLVersion}
    ...    ${SPACE}${SPACE}Actual: SALVersion: ${sal_ver}, XMLVersion: ${xml_ver}, OSPLVersion: ${ospl_ver}
    Should Match    ${sal_ver}    ${SALVersion}
    Should Match    ${xml_ver}    ${XMLVersion}
    Should Match    ${ospl_ver}    ${OSPLVersion}
    Log    CSC Version: ${csc_ver}
    Should Not Be Empty    ${csc_ver}
    Should Match Regexp    ${version}    ${version_regex}    msg="Version is not in Semantic Version format."    values=False

Verify Shutdown Process
    [Arguments]    ${csc}    ${csc_index}=None
    @{fields}=    Create List    "private_sndStamp"    "summaryState"
    @{states_keys}=    Get Dictionary Keys    ${STATES}
    @{shutdown_list}=    Create List    ${states_keys}[3]    ${states_keys}[4]    ${states_keys}[0]    ${states_keys}[1]
    ${dataframe}=    Get Recent Samples    ${csc}    logevent_summaryState   ${fields}    4    ${csc_index}
    Log    ${dataframe}
    Should Not Be True    $dataframe.empty
    ${first}=    Evaluate    $dataframe.summaryState[0]
    ${second}=    Evaluate    $dataframe.summaryState[1]
    ${thrid}=    Evaluate    $dataframe.summaryState[2]
    ${fourth}=    Evaluate    $dataframe.summaryState[3]
    @{state_list}=    Create List    ${states_keys}[${first-1}]    ${states_keys}[${second-1}]    ${states_keys}[${thrid-1}]    ${states_keys}[${fourth-1}]
    Should Be Equal    ${state_list}    ${shutdown_list}    msg=Incorrect Shutdown Order: ${state_list}    values=False

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
