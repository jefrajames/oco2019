#! /bin/bash

clear 

HSQLDB_HOME=~/javatools/hsqldb-2.5.0
DATA_HOME=~/javadev/data/hsqldb

if [ $# -eq 1 ]
then
	echo "Removing existing data, type any key to confirm, CtrlC to exit"
	read	
	rm -rf $DATA_HOME
else
	echo "Keeping existing data"
fi

echo "Starting HSQL Database Server in verbose mode"

java -cp $HSQLDB_HOME/lib/hsqldb.jar org.hsqldb.server.Server --silent false --database.0 $DATA_HOME/oco --dbname.0 oco
