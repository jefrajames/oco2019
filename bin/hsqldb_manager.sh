#! /bin/bash

export HSQLDB_HOME=~/javatools/hsqldb-2.5.0

java -cp $HSQLDB_HOME/lib/hsqldb.jar \
     org.hsqldb.util.DatabaseManager \
     --url jdbc:hsqldb:hsql://localhost/oco \
     --user sa \
     --password ""
