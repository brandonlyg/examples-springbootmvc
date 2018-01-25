#!/bin/sh

appname=example-springbootmvc
cwd=`cd $(dirname $0)/..;pwd`

cd $cwd

logsdir=logs
if [ ! -d $logsdir ]; then
	mkdir $logsdir
fi

pidfile="$logsdir/$appname.pid"

echo "pidfile $pidfile"

if [ -f $pidfile ]; then
	bin/shutdown.sh
fi

stdlogfile="$logsdir/stdout.$appname.log"

JAVA=java
jars="$cwd/build/libs/$appname.jar"

$JAVA -jar $jars >> $stdlogfile 2>&1 &
pid=$!

echo $pid > $pidfile

echo "$appname start pid:$pid"




