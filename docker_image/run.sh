#!/bin/bash
srcDir=/project/src/
reportDir=/project/reports/

echo "===SETTINGS==="
echo "GIT URL:     " $GIT_URL
echo "RELEASE TAG: " $GIT_TAG
echo "TEST SCRIPT: " $TEST_SCRIPT
echo "UPDATE REQs: " $UPDATE

# 1.) clone repo and checkout specific release
if [ ! -d /project/reports ] ; then
   mkdir -p /project/reports
fi

if [ ! -d $srcDir ] ; then
   mkdir -p $srcDir
else
  rm -rf $srcDir/*
  rm -rf $srcDir/.git
fi

echo "CLONING TEST SCRIPTS FROM GIT:"
git clone $GIT_URL $srcDir
echo "CHANGING TO TEST SCRIPT DIR:"
cd $srcDir

# (OPTIONAL) update python modules in the requirements
if [ -z $GIT_TAG ] ; then
   echo "CHECKING OUT THE TAG/RELEASE $GIT_TAG :"
   git checkout tags/$GIT_TAG
fi

# 2.) update from the requirements file:
if [ $UPDATE = true ] ; then
   echo "UPDATING REQUIRED PYTHON MODULES:"
   pip install -r requirements.txt
fi

# 3.) run test
echo "RUNNING TEST SCRIPT:"
python $TEST_SCRIPT

# 4.) move the reports to bind volume
cp -rf $srcDir/report_output/* $reportDir
