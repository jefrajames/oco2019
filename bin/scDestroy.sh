#! /bin/bash -x
if [ -z $1 ]
then
	echo "Cache name needed as argument"
else
	java -Xshareclasses:name=$1,destroy
fi
