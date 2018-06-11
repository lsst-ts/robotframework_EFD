#!/bin/bash
#  Shellscript to create test suites to
#  verify SQL table creation.
#
#  author: Rob Bovill
#  email:  rbovill@lsst.org

# Source common functions
source $HOME/trunk/robotframework_EFD/scripts/_common.sh

#  Define variables to be used in script
workDir=$HOME/trunk/robotframework_EFD/SQL
arg=${1-all}
arg="$(echo ${arg} |tr 'A-Z' 'a-z')"
declare -a subSystemArray=($(subsystemArray))

#  FUNCTIONS
function createSettings() {
    skipped=$(checkIfSkipped $subSystem)
    echo "*** Settings ***" >> $testSuite
    echo "Documentation    This suite verifies SQL table creation for the $subSystemUp." >> $testSuite
    echo "Force Tags    $skipped" >> $testSuite
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
    	echo "Verify $subSystemUp Telemetry $topic SQL defintion files exist" >> $testSuite
    	echo "    [Tags]    sql" >> $testSuite
    	echo "    @{files}=    List Directory    \${SALWorkDir}/sql    pattern=*${topic}*" >> $testSuite
    	echo "    Log Many    @{files}" >> $testSuite
		echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_${topic}.sqldef" >> $testSuite
		echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_${topic}.sqlwrt" >> $testSuite
		echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_${topic}_items.sql" >> $testSuite
    	echo "" >> $testSuite
	done
}
 
function verifySQLStateDefinitions() {
	for topic in "${stateArray[@]}"; do
   		echo "Verify $subSystemUp State Command $topic SQL defintion files exist" >> $testSuite
   		echo "    [Tags]    sql" >> $testSuite
   		echo "    @{files}=    List Directory    \${SALWorkDir}/sql    pattern=${subSystem}_*${topic}*" >> $testSuite
   		echo "    Log Many    @{files}" >> $testSuite
   		echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_command_${topic}.sqldef" >> $testSuite
   		echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_command_${topic}.sqlwrt" >> $testSuite
   		echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_command_${topic}_items.sql" >> $testSuite
   		echo "" >> $testSuite
	done
}

function verifySQLCommandsDefinitions() {
    for topic in "${commandArray[@]}"; do
        echo "Verify $subSystemUp Command $topic SQL defintion files exist" >> $testSuite
        echo "    [Tags]    sql" >> $testSuite
        echo "    @{files}=    List Directory    \${SALWorkDir}/sql    pattern=${subSystem}_*${topic}*" >> $testSuite
        echo "    Log Many    @{files}" >> $testSuite
        echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_command_${topic}.sqldef" >> $testSuite
        echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_command_${topic}.sqlwrt" >> $testSuite
        echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_command_${topic}_items.sql" >> $testSuite
        echo "" >> $testSuite
    done

}

function verifySQLEventsDefinitions() {
    for topic in "${eventArray[@]}"; do
        echo "Verify $subSystemUp Event $topic SQL defintion files exist" >> $testSuite
        echo "    [Tags]    sql" >> $testSuite
        echo "    @{files}=    List Directory    \${SALWorkDir}/sql    pattern=${subSystem}_*${topic}*" >> $testSuite
        echo "    Log Many    @{files}" >> $testSuite
        echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_logevent_${topic}.sqldef" >> $testSuite
        echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_logevent_${topic}.sqlwrt" >> $testSuite
        echo "    File Should Exist    \${SALWorkDir}/sql/${subSystem}_logevent_${topic}_items.sql" >> $testSuite
        echo "" >> $testSuite
	done
}

function createTestSuite() {
	arg=$(echo $1 |tr '[:upper:]' '[:lower:]')
	subSystem=$1

	#  Define test suite name
	subSystemUp=$(capitializeSubsystem $subSystem)
	testSuite=$workDir/${subSystemUp}_SQL_Files.robot
		
	#  Check to see if the TestSuite exists then, if it does, delete it.
	clearTestSuites $subSystem "SQL" 
		
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
	createSession "SQL"
    verifySQLTelemetryDefinitions
	# Generate State Definition tests. Skip CSCs that explicitly define these topics.
    declare -a array=($(stateMachineSkipped))
	skipped=false
	for item in "${array[@]}"; do
        if [[ "$item" == "$arg" ]]; then
            echo "The $(capitializeSubsystem $arg) explicitly defines the generic commands and events"
            echo ""
            skipped=true
        fi
	done
	echo $skipped
	if [[ "$skipped" == "false" ]]; then verifySQLStateDefinitions; else echo "Skipping"; fi
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

