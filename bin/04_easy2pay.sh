#! /bin/bash

clear

EASYPAY_PORT=8080
EASYPAY_JAR_FILE=~/javadev/demo/oco2019/easypay/target/easypay.jar

echo "Starting Easy to Pay with KumuluzEE on port $EASYPAY_PORT"

echo "Fat Jar deployment, 1 involved file:"
du -h $EASYPAY_JAR_FILE

echo ""
echo ""
echo ""


if [ -z $1 ]
then
	echo "Running KumuluzEE with OpenJ9 shared classes"
	CMD="java -Xshareclasses:name=kumupay -jar $EASYPAY_JAR_FILE"
else
	echo "Running KumuluzEE without OpenJ9 shared classes"
	CMD="java -jar $EASYPAY_JAR_FILE"
fi

echo $CMD

echo "Type any key when ready"
read

$CMD
