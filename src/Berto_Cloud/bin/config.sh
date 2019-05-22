#!/bin/sh

prog="config.sh"

file=$1
ip=$2

[ -z "$file" ] && exit 0
[ -z "$ip" ] && exit 0

bin=`dirname $0`

timestamp=`date +%FT%H%M%S`
gateway=`netstat -nr | grep '^0.0.0.0' | awk '{print $2}' | head -1`

echo "{" > $file
echo "  \"timestamp\": \"$timestamp\"," >> $file
echo "  \"gateway\": \"$gateway\"," >> $file
echo "  \"drivers\": {" >> $file

stat -c "%s %n" /mnt/internal/c4z/Berto_*.c4z | grep -v Berto_Cloud.c4z | while read line
do
	size=`echo $line | cut -f1 -d" "`
	driver=`echo $line | cut -f2-999 -d" " | cut -f5 -d"/"`

	echo "    \"$driver\": $size," >> $file     
done

stat -c "%s %n" /mnt/internal/c4z/Berto_Cloud.c4z | while read line                          
do         
	size=`echo $line | cut -f1 -d" "`   
	driver=`echo $line | cut -f2-999 -d" " | cut -f5 -d"/"` 
	     
	echo "    \"$driver\": $size" >> $file                  
done   

echo "  }," >> $file
echo "  \"uptime\": \"`cat /proc/uptime`\"," >> $file
echo "  \"loadavg\": \"`cat /proc/loadavg`\"," >> $file

director=`pidof director`
echo "  \"director\": {" >> $file
if [ "$director" ]; then
	echo "    \"pid\": $director," >> $file   
	echo "    \"openfiles\": {" >> $file
	echo "      \"count\": \"`ls /proc/$director/fd | wc -l`\"," >> $file
	echo "      \"limit\": \"`grep -w "Max open files" /proc/$director/limits | awk '{print $4}'`\"" >> $file
	echo "    }" >> $file 
fi 
echo "  }" >> $file 

echo "}" >> $file