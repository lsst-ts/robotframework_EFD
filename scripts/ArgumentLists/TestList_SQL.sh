#!/bin/bash
#  Shellscript to create test suite argument file
#  for the salgenerator tests.
#
#  author: Rob Bovill
#  email:  rbovill@lsst.org

# Define filename
argfile=$HOME/trunk/robotframework_EFD/SQL_Test.list

# Find and remove old argument file.
ls $argfile 1>/dev/null
if [ $? -eq 0 ]; then
	echo "Deleteing $argfile"
	rm $argfile
else
	echo "$argfile does not exist.  Continuing."
fi

# Setup argument file
echo "###  Test Suite list ###" >> $argfile
echo "#  Change the title of the test results" >> $argfile
echo "--name SQL" >> $argfile
echo "--output SQL" >> $argfile
echo "" >> $argfile
echo "# List of test suites" >> $argfile

# Find test suites and add them to the argument file.
ls -1 $HOME/trunk/robotframework_EFD/SQL |sed 's/^/SQL\//' >> $argfile

##### JENKINS #####
# Define Jenkins filename
argfile=$HOME/trunk/robotframework_EFD/Jenkins_SQL_Test.list

# Find and remove old argument file.
ls $argfile 1>/dev/null
if [ $? -eq 0 ]; then
    echo "Deleteing $argfile"
    rm $argfile
else
    echo "$argfile does not exist.  Continuing."
fi

# Setup argument file
echo "###  Test Suite list ###" >> $argfile
echo "#  Change the title of the test results" >> $argfile
echo "--name Jenkins_SQL" >> $argfile
echo "--output SQL" >> $argfile
echo "" >> $argfile
echo "# List of test suites" >> $argfile

# Find test suites and add them to the argument file.
ls -1 $HOME/trunk/robotframework_EFD/SQL |sed 's/^/rbtefd\/SQL\//' >> $argfile
