#!/bin/sh

# Script To Check Processes For Max Open Files

# Get Action
script=$0
command=$1
cmd=$2

# Start Program
openfiles() {
	
	if [ "$cmd" ]; then

		pid=`pidof $cmd`
		
		if [ "$pid" ]; then

			fd=`lsof -n | grep -w ^$pid | wc -l`
						
		fi
		
	else

		process=`lsof -n | awk '{print $1" "$2}' | sort | uniq -c | awk '{print $1" "$2" "$3}' | sort -rn | head -n1`
	
		fd=`echo $process | awk '{print $1}'`
		pid=`echo $process | awk '{print $2}'`
		path=`echo $process | awk '{print $3}'`
		cmd=`basename $path`

	fi
	
	if [ "$pid" ]; then

		max=`grep "^Max open files" /proc/$pid/limits | awk '{print $4}'`
		perc=$(($fd * 100 / $max))

		echo -n $fd $max $perc $pid $cmd

	else

		echo -n 0 0 0 0 $cmd

	fi
	
}

# Process Action
case "$command" in
	openfiles)
		openfiles
		;;
esac
