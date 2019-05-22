#!/bin/sh

prog="berto.sh"

file=$1

[ -z "$file" ] && exit 0

bin=`dirname $0`
sandbox=`dirname $file`

# Run Processes Defined 
if [ -e "$file" ]; then
	cat $file | while read job
	do
		$job
	done
fi

# Record Last Time Run
date +%FT%H%M%S > $sandbox/.berto