#! /bin/bash


clear

PORT=8082
TOMEE_HOME=~/javatools/apache-tomee-microprofile-8.0.0-M3-oc1
SMARTBANK_WAR_FILE=~/javadev/demo/oco2019/smartbank/target/smartbank.war

echo "Starting Smart Bank Gateway with TomEE on port $PORT."

# TomEE cleanup
rm -rf $TOMEE_HOME/logs
mkdir $TOMEE_HOME/logs
rm -rf $TOMEE_HOME/webapps
mkdir $TOMEE_HOME/webapps

echo "Thin war deployment, 2 files involved:"
du -h $SMARTBANK_WAR_FILE
du -sh $TOMEE_HOME

echo ""
echo ""
echo ""

# Deploy the webapp
cp $SMARTBANK_WAR_FILE $TOMEE_HOME/webapps

echo "Running TomEE with OpenJ9 shared classes"

export CATALINA_OPTS="-Xshareclasses:name=smartbank -Xscmx64m"
echo CATALINA_OPTS=$CATALINA_OPTS

CMD="$TOMEE_HOME/bin/catalina.sh run"

echo $CMD

echo "Type any key when ready"
read

$CMD
