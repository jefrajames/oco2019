#! /bin/bash

clear

UBER_JAR_FILE=~/javadev/kumupay/target/kumupay-1.0.0.jar

echo "Running Kumuluzee Easy2Pay"

echo ""

CMD="java -Xshareclasses:name=kumupay -Xscmx64m -jar $UBER_JAR_FILE"

#CMD="java -jar $UBER_JAR_FILE"

echo $CMD

echo "Type any key when ready"
read

$CMD
