#! /bin/bash

clear

UBER_JAR_FILE=~/javadev/demo/oco2019/easypay/target/easypay-uber.jar

echo "Running Easy2Pay Payara Micro FatJar"

echo ""

CMD="java -Xshareclasses:name=easyfat,bootClassesOnly -Xscmx64m -jar $UBER_JAR_FILE --noCluster"

echo $CMD

echo "Type any key when ready"
read

$CMD
