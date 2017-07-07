#!/bin/bash
#  Shellscript to create test suites to
#  create the various interfaces.
#
#  author: Rob Bovill
#  email:  rbovill@lsst.org

# Source common functions
source $HOME/trunk/robotframework_EFD/scripts/_common.sh

#  Define variables to be used in script
workDir=$HOME/trunk/robotframework_EFD/SALGEN
arg=${1-all}
arg="$(echo ${arg} |tr 'A-Z' 'a-z')"
declare -a subSystemArray=($(subsystemArray))
declare -a stateArray=($(stateArray))

#  FUNCTIONS
function createSettings() {
    echo "*** Settings ***" >> $testSuite
    echo "Documentation    This suite builds the various interfaces for the $subSystemUp." >> $testSuite
    echo "Suite Setup    Log Many    \${Host}    \${timeout}    \${SALVersion}" >> $testSuite
    echo "Suite Teardown    Close All Connections" >> $testSuite
    echo "Library    SSHLibrary" >> $testSuite
    echo "Resource    ../Global_Vars.robot" >> $testSuite
	echo "" >> $testSuite
}

function createVariables() {
	entity=$(getEntity $1)
    echo "*** Variables ***" >> $testSuite
    echo "\${subSystem}    $entity" >> $testSuite
    echo "\${timeout}    1500s" >> $testSuite
    echo "" >> $testSuite
}

function verifyXMLDefinitions() {
    echo "Verify $subSystemUp XML Defintions exist" >> $testSuite
    echo "    [Tags]" >> $testSuite
	for file in "${xmls[@]}"; do
		echo "    File Should Exist    \${SALWorkDir}/$file" >> $testSuite
	done
    echo "" >> $testSuite
}

function salgenValidate() {
    echo "Salgen $subSystemUp Validate" >> $testSuite
    echo "    [Documentation]    Validate the $subSystemUp XML definitions." >> $testSuite
    echo "    [Tags]" >> $testSuite
    echo "    Write    cd \${SALWorkDir}" >> $testSuite
    echo "    \${input}=    Write    \${SALHome}/scripts/salgenerator \${subSystem} validate" >> $testSuite
    echo "    \${output}=    Read Until Prompt" >> $testSuite
    echo "    Log    \${output}" >> $testSuite
    echo "    Should Contain    \${output}    SAL generator - V\${SALVersion}" >> $testSuite
    echo "    Should Contain    \${output}    Processing \${subSystem}" >> $testSuite
    echo "    Should Contain    \${output}    Completed \${subSystem} validation" >> $testSuite
    echo "    Directory Should Exist    \${SALWorkDir}/idl-templates" >> $testSuite
    echo "    Directory Should Exist    \${SALWorkDir}/idl-templates/validated" >> $testSuite
    echo "    @{files}=    List Directory    \${SALWorkDir}/idl-templates    pattern=*\${subSystem}*" >> $testSuite
    echo "    Log Many    @{files}" >> $testSuite
	echo "    Comment    Telemetry" >> $testSuite
	for topic in "${telemetryArray[@]}"; do
		echo "    File Should Exist    \${SALWorkDir}/idl-templates/\${subSystem}_${topic}.idl" >> $testSuite
	done
	echo "    Comment    State Commands" >> $testSuite
    for topic in "${stateArray[@]}"; do
        echo "    File Should Exist    \${SALWorkDir}/idl-templates/\${subSystem}_command_${topic}.idl" >> $testSuite
    done
	echo "    Comment    Commands" >> $testSuite
    for topic in "${commandArray[@]}"; do
        echo "    File Should Exist    \${SALWorkDir}/idl-templates/\${subSystem}_command_${topic}.idl" >> $testSuite
    done
	echo "    Comment    Events" >> $testSuite
    for topic in "${eventArray[@]}"; do
        echo "    File Should Exist    \${SALWorkDir}/idl-templates/\${subSystem}_logevent_${topic}.idl" >> $testSuite
    done
    echo "" >> $testSuite
}

function salgenHTML() {
    echo "Salgen $subSystemUp HTML" >> $testSuite
    echo "    [Documentation]    Create web form interfaces." >> $testSuite
    echo "    [Tags]" >> $testSuite
    echo "    \${input}=    Write    \${SALHome}/scripts/salgenerator \${subSystem} html" >> $testSuite
    echo "    \${output}=    Read Until Prompt" >> $testSuite
    echo "    Log    \${output}" >> $testSuite
    echo "    Should Contain    \${output}    SAL generator - V\${SALVersion}" >> $testSuite
    echo "    Directory Should Exist    \${SALWorkDir}/html/salgenerator/\${subSystem}" >> $testSuite
    echo "    @{files}=    List Directory    \${SALWorkDir}/html/salgenerator/\${subSystem}    pattern=*\${subSystem}*" >> $testSuite
    echo "    Log Many    @{files}" >> $testSuite
	for file in "${xmls[@]}"; do
		file=$(echo $file |sed "s/xml/html/")
        echo "    File Should Exist    \${SALWorkDir}/html/\${subSystem}/$file" >> $testSuite
    done
    echo "" >> $testSuite
}

function verifySQLDirectory() {
    echo "Verify SQL directory exists" >> $testSuite
    echo "    [Tags]    sql" >> $testSuite
    echo "    Directory Should Exist    \${SALWorkDir}/sql" >> $testSuite
    echo "    @{files}=    List Directory    \${SALWorkDir}/sql    pattern=${subSystem}*" >> $testSuite
    echo "    Log Many    @{files}" >> $testSuite
	echo "    Should Not Be Empty    \${files}" >> $testSuite
	# Determine number of EFD topics. There are 4 default Events and 9 default Commands that are not listed in the XMLs.
	total=$(( ${#telemetryArray[@]} + ${#eventArray[@]} + 4 + ${#commandArray[@]} + 9 ))
	length=$(( $total * 3 )) # There are 3 SQL files per topic.
	echo "    Comment    Length is calculated in the bash generation script." >> $testSuite
	echo "    Length Should Be    \${files}    $length" >> $testSuite
    echo "" >> $testSuite
}

function createTestSuite() {
	subSystem=$1

	#  Define test suite name
	subSystemUp=$(capitializeSubsystem $subSystem)
	testSuite=$workDir/${subSystemUp}_EFD_salgenerator.robot
		
	#  Check to see if the TestSuite exists then, if it does, delete it.
	clearTestSuites $subSystem "SALGEN" 
		
	# Get XML topic definitions.  Not all subsystems have all types of topics.
	declare -a xmls=($(ls $HOME/trunk/ts_xml/sal_interfaces/$subSystem))
	# Declare topic arrays
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
	createSession "SALGEN"
    verifyXMLDefinitions
	salgenValidate
	salgenHTML
    verifySQLDirectory
	# Indicate completion of the test suite.
	echo Done with test suite.
	echo ""
}


#  MAIN
if [ "$arg" == "all" ]; then
	for subSystem in "${subSystemArray[@]}"; do
		if [ "$subSystem" == "mtmount" ]; then subSystem="MTMount"; fi
		createTestSuite $subSystem
	done
	echo COMPLETED ALL test suites for ALL subsystems.
elif [[ ${subSystemArray[*]} =~ $arg ]]; then
	createTestSuite $arg
	echo COMPLETED all test suites for the $arg.
else
	echo USAGE - Argument must be one of: ${subSystemArray[*]} OR all.
fi

