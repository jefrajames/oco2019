#! /bin/bash

# Nightly build for Oracle Code One demo (Dan Heidinga)
export JAVA_HOME=~/javatools/jdk-11.0.5+7/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

clear

MERCHANTBO_JAR_FILE=~/javadev/demo/oco2019/merchantbo/target/merchantbo-1.0.jar

echo "Starting Merchant Back Office with KumuluzEE on port 8082"

echo "Fat Jar deployment. 1 file involved:"
du -h $MERCHANTBO_JAR_FILE

echo ""
echo ""
echo ""

if [ -z $1 ]
then
	echo "Running KumuluzEE with OpenJ9 shared classes"
	CMD="java -Xshareclasses:name=merchantbo -Xscmx32m -jar $MERCHANTBO_JAR_FILE"
else
	echo "Running KumuluzEE without OpenJ9 shared classes"
	CMD="java -jar $MERCHANTBO_JAR_FILE"
fi

echo $CMD
echo "Type any key when ready"
read

$CMD
