#! /bin/bash

clear

PAYARA_MICRO_HOME=~/javatools/payara-micro-5.193
EASYPAY_WAR_FILE=~/javadev/demo/oco2019/easypay/target/easypay.war
HSQLDB_HOME=~/javatools/hsqldb-2.5.0
UBER_JAR_FILE=~/javadev/demo/oco2019/easypay/target/easypay-uber.jar

echo "Building Payara Micro FatJar"

echo ""
echo ""
echo ""

CMD="java --add-opens java.base/jdk.internal.loader=ALL-UNNAMED  
-jar $PAYARA_MICRO_HOME/payara-micro-5.193.jar 
--addJars $HSQLDB_HOME/lib/hsqldb.jar  
--deploy $EASYPAY_WAR_FILE --outputUberJar $UBER_JAR_FILE"


echo $CMD

echo "Type any key when ready"
read

$CMD
