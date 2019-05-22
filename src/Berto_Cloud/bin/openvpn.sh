#!/bin/sh

# Script To Start/Stop The OpenVPN Daemon

# Get Action
script=$0
action=$1
root=$2
source=$3
param1=$4
param2=$5

program="vpn"
openssl=openssl
vpn=$root/bin/vpn
dir=$root/etc/openvpn

export HOME=$dir
export KEY_DIR=$dir
export KEY_SIZE=1024
export CA_EXPIRE=3650
export KEY_EXPIRE=3650
export PKCS11_MODULE_PATH="dummy"
export PKCS11_PIN="dummy"

export KEY_COUNTRY="C4"
export KEY_PROVINCE="C4"
export KEY_CITY="C4"
export KEY_ORG="C4"
export KEY_EMAIL="C4"
export KEY_CN="C4"
export KEY_NAME="C4"
export KEY_OU="C4"

# Get Network
eth=`netstat -nr | grep -w ^0.0.0.0 | awk '{print $8}'`
if [ "$eth" ]; then
	network=`netstat -nr | grep -w $eth | grep -w U | grep -vw ^224.0.0.0 | awk '{print $1" "$3}'`
fi

# Create Initial Setup 
if [ ! -e "$vpn" ]; then
	mkdir -p $root/bin
	mkdir -p $root/etc/openvpn
	cp $source/etc/openvpn/* $root/etc/openvpn
	ln /control4/bin/openvpn $vpn
fi

# Start Program
start() {
	
	echo -n "Starting $program: "

	# Start OpenVPN
	if [ -e "$dir/server.ovpn" ]; then
		
		cd $dir                      
		$vpn --cd $dir --config $dir/server.ovpn --writepid $dir/server.pid --daemon

		# Turn IP Forwarding On
		echo 1 > /proc/sys/net/ipv4/ip_forward
	
		# Masquerade Traffic From VPN To LAN
		network=`grep ^server $dir/server.ovpn | cut -f2-3 -d" " | tr ' ' '/'`
		iptables -t nat -A POSTROUTING -s $network -o $eth -j MASQUERADE
	
		echo "Done"
		
	else
		
		echo "Failed - Server Configuration Does Not Exist"
		
	fi
	
}

# Stop Program
stop() {
	
	echo -n "Stopping $program: "
	prog=`basename $vpn`
	kill `pidof $prog`
	
	# Turn IP Forwarding Off
	echo 0 > /proc/sys/net/ipv4/ip_forward
	
	# Remove Masquerade Of Traffic From VPN To LAN
	network=`grep ^server $dir/server.ovpn | cut -f2 -d" "`
	rule=`iptables -t nat -nL -v --line-numbers | grep -w MASQUERADE | grep -w $eth | grep -w $network | cut -f1 -d" "`
	[ "$rule " ] && iptables -t nat -D POSTROUTING $rule
	
	echo "Done"
}

# Build Server Configuration
server() {
	
	echo -n "Building Server Configuration: "
	
	network="$param1 $param2"

	cd $dir
		
	# Reset                                                                                                                
	rm -f *.ovpn *.key *.crt *.csr *.pem *.attr *.old *.log *.txt serial .rnd openssl.log
	touch index.txt                                                                                                        
	echo 01 > serial     
	
	# Create Certificates                                                                                                  
	$openssl req -batch -days 3650 -nodes -new -newkey rsa:1024 -sha1 -x509 -keyout $dir/ca.key -out $dir/ca.crt -config $dir/openssl.cnf >> $dir/openssl.log 2>&1
	$openssl req -batch -days 3650 -nodes -new -newkey rsa:1024 -keyout $dir/server.key -out $dir/server.csr -extensions server -config $dir/openssl.cnf >> $dir/openssl.log 2>&1
	$openssl ca -batch -days 3650 -out $dir/server.crt -in $dir/server.csr -extensions server -md sha1 -config $dir/openssl.cnf >> $dir/openssl.log 2>&1     
	$openssl dhparam -out $dir/dh1024.pem 1024 >> $dir/openssl.log 2>&1
	$openssl ca -gencrl -out $dir/crl.pem -config $dir/openssl.cnf >> $dir/openssl.log 2>&1

	chmod 600 $dir/server.key
	
	cat $source/etc/openvpn/server.conf | sed "s/{NETWORK}/$network/" > server.ovpn
	
	rm -rf clients
	mkdir clients
		
	echo "Done"
}

client() {
	
	echo -n "Creating Client: "
	
	client=$param1
	hostname=$param2
	
	cd $dir
		
    # Reset
	rm -f $client.* openssl.log

	# Create Client Certificate
	export KEY_CN=$client

	$openssl req -batch -days 3650 -nodes -new -newkey rsa:1024 -keyout $dir/$client.key -out $dir/$client.csr -config $dir/openssl.cnf >> $dir/openssl.log 2>&1
	$openssl ca -batch -days 3650 -out $dir/$client.crt -in $dir/$client.csr -md sha1 -config $dir/openssl.cnf >> $dir/openssl.log 2>&1
	
	cat $source/etc/openvpn/client.conf | sed "s/{HOSTNAME}/$hostname/" | sed "s/{NETWORK}/$network/" > $client.ovpn
	echo >> $client.ovpn
	echo "<ca>" >> $client.ovpn
	cat ca.crt >> $client.ovpn
	echo "</ca>" >> $client.ovpn
	echo >> $client.ovpn
	echo "<cert>" >> $client.ovpn
	cat $client.crt >> $client.ovpn
	echo "</cert>" >> $client.ovpn
	echo >> $client.ovpn
	echo "<key>" >> $client.ovpn
	cat $client.key >> $client.ovpn
	echo "</key>" >> $client.ovpn
	
	cp $client.ovpn /tmp
	
	touch clients/$client
	
	echo "Done"
   
}

enable() {
	
	echo -n "Enabling Client: "
	
	client=$param1
	
	touch $dir/clients/$client
}

disable() {
	
	echo -n "Disabling Client: "
	
	client=$param1
	
	rm -f $dir/clients/$client
}

revoke() { 
          
	client=$param1
	echo -n "Revoke Client $client: "
	
	rm -f $dir/openssl.log
	
	$openssl ca -revoke "$dir/$client.crt" -config $dir/openssl.cnf > $dir/openssl.log 2>&1
	$openssl ca -gencrl -out $dir/crl.pem -config $dir/openssl.cnf >> $dir/openssl.log 2>&1
	
	rm -f $dir/$client.*

}    

check() {
	
	echo -n "Checking Server Configuration: "
	
	if [ ! -e "$dir/server.ovpn" ]; then
		echo "Server Configuration Has Not Be Generated"
	else
		network=`grep ^server $dir/server.ovpn | cut -f2-99 -d" "`
		echo "Server Configuration Generated Using VPN Network $network"
	fi
}

# Check Status
status() {
	
	echo -n "Status $program: "
	
	pid=`pidof $program`
	if [ "$pid" ]; then
		echo "Server Running On Process $pid"
	else
		echo "Server Not Running"
	fi
}

# Process Action
case "$action" in
 	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	server)
		server
		;;
	client)
		client
		;;
	enable)
		enable
		;;
	disable)
		disable
		;;
	revoke)
		revoke
		;;
	check)
		check
		;;
	status)
		status
		;;
esac
