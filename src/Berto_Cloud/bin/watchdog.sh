#!/bin/sh

prog="watchdog.sh"

file=$1

# Exit If No File
[ -z "$file" ] && exit 0

bin=`dirname $0`
sandbox=`dirname $file`

# Kill Director
kill_director () {
	
	logger -p user.1 "Berto Watchdog - Killing Director"
	
	timestamp=`date +%FT%H%M%S`
	
	# Archive Current Logs
	cd /var/log && zip -r $sandbox/$timestamp.zip debug/*.log
	
	# Kill Director
	killall director
	
}

# Record Open Files If Close To Limit
openfiles=`sh $bin/process.sh openfiles`
perc=`echo $openfiles | awk '{print $3}'`
	
if [ $perc -gt 80 ]; then

	# Kill Director If Openfiles is at 100%
	if [ $perc -gt 99 ]; then
		
		logger -p user.1 "Berto Watchdog - Max Open Files Limit - $openfiles" 
		
		kill_director
		
	else
		logger -p user.1 "Berto Watchdog - Near Open Files Limit - $openfiles" 
	fi
	
fi
	
# Check Prcoess Kill Does The Timestamp File Exist
if [ -e "$file" ]; then
		
	timeout=`cat $file`
	current=`date +%s`
		
	# Have We Timed Out
	if [ $current -gt $timeout ]; then
		logger -p user.1 "Berto Watchdog - Timeout Occurred"
		berto=`psreal --no-header -C sh -o pid,cmd | grep -w BERTO | awk '{print $1}'`
		# Kill All Processes Or Kill Director
		if [ "$berto" ]; then
			logger -p user.1 "Berto Watchdog - Kill All Processes Associated With Parent IDs $berto"
			for pid in $berto
			do
				# Get ALl Pids For Parent Process And Kill Them
				psreal x -o ppid,pid | awk '{print $1" "$2}' | grep -w ^$pid | xargs kill -9
			done
		else
			kill_director
			break
		fi
	fi
fi