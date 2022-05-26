*** Settings ***
Resource    CSC_Lists.resource

*** Variables ***
${cav_topic}    logevent_configurationsAvailable
@{cav_fields}    "private_sndStamp"    "overrides"    "version"    "url"    "schemaVersion"

*** Keywords ***
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
