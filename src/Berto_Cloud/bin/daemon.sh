#!/bin/sh

# Script To Check Process And Start If Required

# Get Command
command=$*

# Get Pid For Process
pid=`psreal -C "$command" -o pid,cmd | grep "$command" | awk '{print $1}'`

# Start If Not Running
if [ -z "$pid" ]; then
	$command
fi

exit 0