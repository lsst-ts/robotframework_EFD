*** Settings ***
Resource    ../Global_Vars.resource
Resource    ../CSC_Lists.resource
Resource    ../Common_Keywords.resource
Force Tags    fiberspec

*** Variables ***

*** Test Cases ***
# FiberSpectrograph:101
Verify FiberSpectrograph:101 DeviceInfo
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    FiberSpectrograph    logevent_deviceInfo    ["firmwareVersion","fpgaVersion","libraryVersion","npixels","salIndex",]    num=1    index=101
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal    ${dataframe.firmwareVersion.values}[0]    firmware123456
    Should Be Equal    ${dataframe.fpgaVersion.values}[0]    fpga12345678901
    Should Be Equal    ${dataframe.libraryVersion.values}[0]    library123456
    Should Be Equal As Numbers    ${dataframe.npixels.values}[0]    2048
    Should Be Equal As Numbers    ${dataframe.salIndex.values}[0]    101

Verify FiberSpectrograph:101 Temperature
    [Tags]
    ${dataframe}=    Get Recent Samples    FiberSpectrograph    temperature    ["temperature","setpoint",]    num=1    index=101
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Numbers    ${dataframe.temperature.values}[0]    5
    Should Be Equal As Numbers    ${dataframe.setpoint.values}[0]    5

Expose FiberSpectrograph:101
    [Tags]
    Comment    Issue the expose command.
    ${scripts}    ${states}=    Execute Integration Test    run_command    3    FiberSpectrograph:101    expose    --parameters=duration:5,numExposures:1,type:test,source:test,groupId:test
    Verify Scripts Completed Successfully    ${scripts}    ${states}

Verify FiberSpectrograph:101 ExposureStates
    [Tags]
    ${dataframe}=    Get Recent Samples    FiberSpectrograph    logevent_exposureState    ["status",]    num=2    index=101
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.status.values}[0]    2    #Done
    Should Be Equal As Integers    ${dataframe.status.values}[1]    1    #Integrating

# FiberSpectrograph:102
Verify FiberSpectrograph:102 DeviceInfo
    [Tags]    robot:continue-on-failure
    ${dataframe}=    Get Recent Samples    FiberSpectrograph    logevent_deviceInfo    ["firmwareVersion","fpgaVersion","libraryVersion","npixels","salIndex",]    num=1    index=102
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal    ${dataframe.firmwareVersion.values}[0]    firmware123456
    Should Be Equal    ${dataframe.fpgaVersion.values}[0]    fpga12345678901
    Should Be Equal    ${dataframe.libraryVersion.values}[0]    library123456
    Should Be Equal As Numbers    ${dataframe.npixels.values}[0]    2048
    Should Be Equal As Numbers    ${dataframe.salIndex.values}[0]    102

Verify FiberSpectrograph:102 Temperature
    [Tags]
    ${dataframe}=    Get Recent Samples    FiberSpectrograph    temperature    ["temperature","setpoint",]    num=1    index=102
    Log    ${dataframe}
    Should Not Be True    ${dataframe.empty}
    Should Be Equal As Numbers    ${dataframe.temperature.values}[0]    5
    Should Be Equal As Numbers    ${dataframe.setpoint.values}[0]    5

Expose FiberSpectrograph:102
    [Tags]
    Comment    Issue the expose command.
    ${scripts}    ${states}=    Execute Integration Test    run_command    3    FiberSpectrograph:102    expose    --parameters=duration:5,numExposures:1,type:test,source:test,groupId:test
    Verify Scripts Completed Successfully    ${scripts}    ${states}
    
Verify FiberSpectrograph:102 ExposureStates
    [Tags]
    ${dataframe}=    Get Recent Samples    FiberSpectrograph    logevent_exposureState    ["status",]    num=2    index=102
    Log    ${dataframe}
    Should Be Equal As Integers    ${dataframe.status.values}[0]    2    #Done
    Should Be Equal As Integers    ${dataframe.status.values}[1]    1    #Integrating
