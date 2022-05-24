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
Verify Version
    [Arguments]    ${version}
    [Tags]    robot:continue-on-failure    custom
    Should Match Regexp    ${version}    ${version_regex}    msg=Version, '${version}', is not SemVer compliant.    values=False

Verify ConfigurationApplied
    [Arguments]    ${csc}    ${csc_index}=None
    [Tags]    robot:continue-on-failure    custom
    ${dataframe}=    Get Recent Samples    ${csc}    ${ca_topic}    ${ca_fields}    1    ${csc_index}
    IF    $csc in $NON_CONFIG    
        Should Be True    $dataframe.empty
    ELSE
        ${configurations}=    Evaluate    $dataframe.configurations[0]
        ${version}=    Evaluate    $dataframe.version[0]
        ${url}=    Evaluate    $dataframe.url[0]
        Log Many    Configurations: ${configurations}    Version: ${version}    URL: ${url}
        Should Not Be Empty    ${configurations}
        Should Not Be Empty    ${version}]
        Should Contain Any    ${url}    https://    file://
        Verify Version    ${version}
        IF    $dataframe.otherInfo[0] != ''
            @{events}=    Evaluate    $dataframe.otherInfo[0].split(",")
            FOR    ${event}    IN    @{events}
                ${fq_event}=    Catenate    SEPARATOR=${EMPTY}    logevent_    ${event}
                ${event_df}=    Get Recent Samples    ${csc}    ${fq_event}    *    1    ${csc_index}
                Should Not Be True    $event_df.empty    msg=${event} was not published.
            END
        END
    END

Verify ConfigurationsAvailable
    [Arguments]    ${csc}    ${csc_index}=None
    [Tags]    robot:continue-on-failure    custom
    ${dataframe}=    Get Recent Samples    ${csc}    ${cav_topic}    ${cav_fields}    1    ${csc_index}
    IF    $csc in $NON_CONFIG
        Should Be True    $dataframe.empty
    ELSE
        ${version}=    Evaluate    $dataframe.version[0]
        ${url}=    Evaluate    $dataframe.url[0]
        ${schemaVersion}=    Evaluate    $dataframe.schemaVersion[0]
        ${overrides}=    Evaluate    $dataframe.overrides[0]
        # Verify field values.
        Log Many    Overrides: ${overrides}    Version: ${version}    URL: ${url}    SchemaVersion: ${schema_version}
        Should Not Be Empty    ${url}
        Should Contain Any    ${url}    https://    file://
        Should Not Be Empty    ${schema_version}
        # The Camera CSCs handle schemaVersion uniquely, so skip those tests.
        IF    $csc not in $Camera
            ${schema_version_expected}=    Evaluate    $dataframe.url[0].split("/")[-1]
            Should Match    ${schema_version}    ${schema_version_expected}
        END
        Should Not Be Empty    ${version}
        Verify Version    ${version}
    END

Verify SoftwareVersions
    [Arguments]    ${csc}    ${csc_index}=None
    [Tags]    robot:continue-on-failure    custom
    ${dataframe}=    Get Recent Samples    ${csc}    ${swv_topic}    ${swv_fields}    1    ${csc_index}
    Should Not Be True    $dataframe.empty
    ${sal_ver}=    Evaluate    $dataframe.salVersion[0]
    ${xml_ver}=    Evaluate    $dataframe.xmlVersion[0]
    ${csc_ver}=    Evaluate    $dataframe.cscVersion[0]
    ${ospl_ver}=    Evaluate    $dataframe.openSpliceVersion[0]
    Log Many    Expected: SALVersion: ${SALVersion}, XMLVersion: ${XMLVersion}, OSPLVersion: ${OSPLVersion}
    ...    ${SPACE}${SPACE}Actual: SALVersion: ${sal_ver}, XMLVersion: ${xml_ver}, OSPLVersion: ${ospl_ver}
    Should Match    ${sal_ver}    ${SALVersion}
    Should Match    ${xml_ver}    ${XMLVersion}
    Should Match    ${ospl_ver}    ${OSPLVersion}
    Should Not Be Empty    ${csc_ver}
    Verify Version    ${csc_ver}

Verify Shutdown Process
    [Arguments]    ${csc}    ${csc_index}=None
    [Tags]    robot:continue-on-failure    custom
    @{fields}=    Create List    "private_sndStamp"    "summaryState"
    @{states_keys}=    Get Dictionary Keys    ${STATES}
    @{shutdown_list}=    Create List    ${states_keys}[3]    ${states_keys}[4]    ${states_keys}[0]    ${states_keys}[1]
    ${dataframe}=    Get Recent Samples    ${csc}    logevent_summaryState   ${fields}    4    ${csc_index}
    Should Not Be True    $dataframe.empty
    ${first}=    Evaluate    $dataframe.summaryState[0]
    ${second}=    Evaluate    $dataframe.summaryState[1]
    ${thrid}=    Evaluate    $dataframe.summaryState[2]
    ${fourth}=    Evaluate    $dataframe.summaryState[3]
    @{state_list}=    Create List    ${states_keys}[${first-1}]    ${states_keys}[${second-1}]    ${states_keys}[${thrid-1}]    ${states_keys}[${fourth-1}]
    Should Be Equal    ${state_list}    ${shutdown_list}    msg=Incorrect Shutdown Order: ${state_list}    values=False
