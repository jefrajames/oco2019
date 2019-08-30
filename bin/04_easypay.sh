#! /bin/bash

clear

EASYPAY_PORT=8080
PAYARA_MICRO_HOME=~/javatools/payara-micro-5.193
EASYPAY_WAR_FILE=~/javadev/demo/oco2019/easypay/target/easypay.war
HSQLDB_HOME=~/javatools/hsqldb-2.5.0

echo "Starting EasyPay with Payara Micro on port $EASYPAY_PORT"

echo "Hollow Jar deployment, 2 involved files:"
du -h $EASYPAY_WAR_FILE
du -h $PAYARA_MICRO_HOME/payara-micro-5.193.jar

echo ""
echo ""
echo ""


if [ -z $1 ]
then
	echo "Running Payara Micro without OpenJ9 shared classes"
	CMD="java --add-opens java.base/jdk.internal.loader=ALL-UNNAMED 
	-jar $PAYARA_MICRO_HOME/payara-micro-5.193.jar
	--noCluster --addJars $HSQLDB_HOME/lib/hsqldb.jar --port $EASYPAY_PORT
	--deploy $EASYPAY_WAR_FILE"
else
	echo "Running Payara Micro with OpenJ9 shared classes"
	CMD="java --add-opens java.base/jdk.internal.loader=ALL-UNNAMED 
	-Xshareclasses:name=smartbank -Xtune:virtualized -Xscmx128m
	-jar $PAYARA_MICRO_HOME/payara-micro-5.193.jar
	--noCluster --addJars $HSQLDB_HOME/lib/hsqldb.jar --port $EASYPAY_PORT
	--deploy $EASYPAY_WAR_FILE"
fi


echo $CMD

echo "Type any key when ready"
read

$CMD
