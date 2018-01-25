#!/bin/sh

appname="example-springbootmvc"
cwd=`cd $(dirname $0)/..;pwd`

cd $cwd

pidfile="logs/$appname.pid"

if [ ! -f $pidfile ]; then
	echo "$appname process not exists"
	exit 0
fi

pid=`cat $pidfile`
trycount=0

echo "start kill $appname process"
while [ $trycount -lt 10 ]; do
	procinfo=`ps -ef|grep -w $pid|grep -v grep`
	
	if [ -z "$procinfo" ]; then
		echo "$appname process $pid killed successful"
		rm -rf $pidfile
		break
	fi
	
	kill $pid
	sleep 0.5
	
done

if [ -f $pidfile ]; then
	echo "$appname process $pid failed"
fi

