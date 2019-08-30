#! /bin/bash

clear

MERCHANTBO_JAR_FILE=~/javadev/demo/oco2019/merchantbo/target/merchantbo-1.0.jar

echo "Starting Merchant Back Office with KumuluzEE. UberJar deployment."

echo "1 file involved:"
du -h $MERCHANTBO_JAR_FILE

echo ""
echo ""
echo ""

if [ -z $1 ]
then
	echo "Running KumuluzEE without OpenJ9 shared classes"
	CMD="java -jar $MERCHANTBO_JAR_FILE"
else
	echo "Running KumuluzEE with OpenJ9 shared classes"
	CMD="java -Xshareclasses:name=kumuluzee -Xtune:virtualized -jar $MERCHANTBO_JAR_FILE"
fi

echo $CMD
echo "Strike any key when ready"
read

$CMD
