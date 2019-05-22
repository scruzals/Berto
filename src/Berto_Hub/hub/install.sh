#!/bin/sh

dirname=`dirname $0`

# Update System
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove

# Install Packages
apt-get -y install nodejs npm mosquitto monit

# Halt If NPM Did Not Install
if [ ! -x "/usr/bin/npm" ]; then
	echo "Failure Installing Packages, Please Reboot And Try Again"
	exit 1
fi

# Install Node Packages
npm install -g mqtt node-getmac hap-nodejs

# Download Flic Daemon
wget -O /usr/local/bin/flicd https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/master/bin/armv6l/flicd
chmod 755 /usr/local/bin/flicd

# Install Berto Hub Server
rm -rf /usr/local/lib/node_modules/berto-hub
cp -av $dirname /usr/local/lib/node_modules/berto-hub

# Install Berto Service
cp /usr/local/lib/node_modules/berto-hub/berto.service /etc/systemd/system

# Install Berto Monit Service
cp /usr/local/lib/node_modules/berto-hub/berto.monit /etc/monit/conf.d/berto

# Setup Services
systemctl daemon-reload
systemctl disable berto
systemctl enable ssh