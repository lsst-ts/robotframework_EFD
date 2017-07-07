#!/bin/bash
#  Shellscript to create test suites to
#  verify SQL table creation.
#
#  author: Rob Bovill
#  email:  rbovill@lsst.org

# Source common functions
source $HOME/trunk/robotframework_EFD/scripts/_common.sh

#  Define variables to be used in script
workDir=$HOME/trunk/robotframework_EFD/EFD_Tables
arg=${1-all}
arg="$(echo ${arg} |tr 'A-Z' 'a-z')"
declare -a subSystemArray=($(subsystemArray))

#  FUNCTIONS
function createSettings() {
    echo "*** Settings ***" >> $testSuite
    echo "Documentation    This suite verify SQL table creation for the $subSystemUp." >> $testSuite
    echo "Suite Setup    Log Many    \${Host}    \${timeout}    \${SALVersion}" >> $testSuite
    echo "Suite Teardown    Close All Connections" >> $testSuite
    echo "Library    SSHLibrary" >> $testSuite
    echo "Resource    ../Global_Vars.robot" >> $testSuite
	echo "" >> $testSuite
}

function createVariables() {
	entity=$(getEntity $1)
    echo "*** Variables ***" >> $testSuite
    echo "\${subSystem}    $subSystemUp" >> $testSuite
    echo "\${timeout}    30s" >> $testSuite
    echo "" >> $testSuite
}

function verifySQLTelemetryDefinitions() {
	for topic in "${telemetryArray[@]}"; do
		tags=""
		if [ "$subSystem" == "scheduler" ] && [ "$topic" == "blockPusher" ]; then tags="skipped"; fi
		if [ "$subSystem" == "scheduler" ] && [ "$topic" == "sequencePropConfig" ]; then tags="skipped"; fi
		if [ "$subSystem" == "camera" ] && [ "$topic" == "Cluster_Encoder" ]; then tags="skipped"; fi
		if [ "$subSystem" == "m1m3" ] && [ "$topic" == "Surface" ]; then tags="skipped"; fi
		if [ "$subSystem" == "tcs" ] && [ "$topic" == "WEP" ]; then tags="skipped"; fi
		echo "Verify $subSystemUp Telemetry $topic EFD table create" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
		echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD < \${SALWorkDir}/sql/${subSystem}_${topic}.sqldef    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Failed to create the $subSystem $topic table" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Empty    \${output}" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
		echo "" >> $testSuite
        echo "Verify $subSystemUp Telemetry $topic EFD table" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD -v -v -e \"select * from ${subSystem}_${topic}\"    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Table $subSystem $topic does not exist" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Contain    \${output}    Empty set" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
	done
}
 
function verifySQLCommandsDefinitions() {
	for topic in "${stateArray[@]}"; do
        echo "Verify $subSystemUp State Command $topic EFD table create" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD < \${SALWorkDir}/sql/${subSystem}_command_${topic}.sqldef    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Failed to create the $subSystem $topic table" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${output}" >> $testSuite 
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
        echo "Verify $subSystemUp State Command $topic EFD table" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD -v -v -e \"select * from ${subSystem}_command_${topic}\"    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Table $subSystem $topic does not exist" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Contain    \${output}    Empty set" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
    done
    for topic in "${commandArray[@]}"; do
        echo "Verify $subSystemUp Command $topic EFD table create" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD < \${SALWorkDir}/sql/${subSystem}_command_${topic}.sqldef    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Failed to create the $subSystem $topic table" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${output}" >> $testSuite 
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
        echo "Verify $subSystemUp Command $topic EFD table" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD -v -v -e \"select * from ${subSystem}_command_${topic}\"    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Table $subSystem $topic does not exist" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Contain    \${output}    Empty set" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
    done

}

function verifySQLEventsDefinitions() {
    for topic in "${eventArray[@]}"; do
        echo "Verify $subSystemUp Event $topic EFD table create" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD < \${SALWorkDir}/sql/${subSystem}_logevent_${topic}.sqldef    return_stderr=True    return_rc=True" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Failed to create the $subSystem $topic table" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${output}" >> $testSuite 
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
        echo "Verify $subSystemUp Event $topic EFD table" >> $testSuite
        echo "    [Tags]    sql    ${tags}" >> $testSuite
        echo "    \${output}    \${error}    \${rc}=    Execute Command    mysql --user=\${EFDUser} --password=\${EFDPass} -h \${EFDHost} -D EFD -v -v -e \"select * from ${subSystem}_logevent_${topic}\"    return_stderr=True    return_rc=True" >> $testSuite
        echo "    Log    \${output}" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Be Equal As Integers    \${rc}    0    values=False    msg=Table $subSystem $topic does not exist" >> $testSuite
		echo "    Run Keyword And Continue On Failure    Should Contain    \${output}    Empty set" >> $testSuite
        echo "    Run Keyword And Continue On Failure    Should Be Empty    \${error}" >> $testSuite
        echo "" >> $testSuite
	done
}

function createTestSuite() {
	subSystem=$1

	#  Define test suite name
	subSystemUp=$(capitializeSubsystem $subSystem)
	testSuite=$workDir/${subSystemUp}_EFD_Tables.robot
		
	#  Check to see if the TestSuite exists then, if it does, delete it.
	clearTestSuites $subSystem "EFD_Tables" 
		
	# Get XML topic definitions.  Not all subsystems have all types of topics.
	declare -a xmls=($(ls $HOME/trunk/ts_xml/sal_interfaces/$subSystem))
	# Declare topic arrays
	declare -a stateArray=($(stateArray))
	declare -a telemetryArray=($(getTelemetryTopics $subSystem))
	if [[ ${xmls[*]} =~ "${subSystem}_Commands.xml" ]]; then
		declare -a commandArray=($(getCommandTopics $subSystem))
	fi
	if [[ ${xmls[*]} =~ "${subSystem}_Events.xml" ]]; then
		declare -a eventArray=($(getEventTopics $subSystem))
	fi
	#  Create test suite.
	echo Creating $testSuite
	createSettings
	createVariables $subSystem
	echo "*** Test Cases ***" >> $testSuite
	createSession "EFD_Tables"
    verifySQLTelemetryDefinitions
	verifySQLCommandsDefinitions
	verifySQLEventsDefinitions
	# Indicate completion of the test suite.
	echo Done with test suite.
	echo ""
}


#  MAIN
if [ "$arg" == "all" ]; then
	for subSystem in "${subSystemArray[@]}"; do
		csc=($(getEntity $subSystem))
		createTestSuite $csc
	done
	echo COMPLETED ALL test suites for ALL subsystems.
elif [[ ${subSystemArray[*]} =~ $arg ]]; then
	csc=($(getEntity $arg))
	createTestSuite $csc
	echo COMPLETED all test suites for the $csc.
else
	echo USAGE - Argument must be one of: ${subSystemArray[*]} OR all.
fi

