*** Settings ***
Resource    CSC_Lists.resource

*** Variables ***
${ca_topic}    logevent_configurationApplied
@{ca_fields}    "private_sndStamp"    "configurations"    "version"    "url"    "otherInfo"
${cav_topic}    logevent_configurationsAvailable
@{cav_fields}    "private_sndStamp"    "overrides"    "version"    "url"    "schemaVersion"

*** Keywords ***
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
