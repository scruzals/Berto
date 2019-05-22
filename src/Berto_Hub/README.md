# Berto Hub

The Berto Hub driver connects to the Berto Hub which provides intergation to [Flic Buttons](https://flic.io). You will need to add the appropriate [Berto Flic Button](../../src/Berto_FlicButton/README.md) drivers for each Flic button in your system. 

The Berto Hub can also expose selected Control4 devices as Homekit accessories. The pin code used to identify the Berto Hub is 031-45-154.

Instructions below detail the steps required to setup a Raspberry Pi 3+ with the Berto Hub server software for use with this driver.

The Berto Hub installs a local Mosquitto MQTT broker which can also be used by the Berto MQTT Bridge. There is no username or password setup on the MQTT broker and connections are made to port 1883. eg. mqtt://IP ADDRESS.

## Properties

* Hub Address - The IP address of the Berto Hub.
* MAC Address - The MAC address of the Berto Hub.
* Status - Shows the connection status of tbe Berto Hub.
* HomeKit Devices - Devices that will be exposed as Homekit devices by the Berto Hub.

## Actions

* Publish Homekit Configuration - Send the Homekit configration to the Berto Hub.

## Berto Hub Installation On A Raspberry Pi 3+

Install the Raspberry Pi 3+ with Raspbian Lite and ensure that you use a static IP address either by DHCP or setting on the Pi itself.

1. Install the Berto Hub driver on the Control4 master controller.
2. Login in the Pi using the defaul username "pi" and password "raspberry".
3. Enter "sudo su: to gain "root" access.
4. Copy the Berto Hub software from the Control4 master controller by entering "scp -r [Control4 Controller Ip Address]:/mnt/internal/c4z/Berto_Hub/hub /tmp". The password for the Control4 master controller is "t0talc0ntr0l4!".
4. To start the instalation enter "sh /tmp/hub/install.sh".
5. Reboot the Pi by enterting "reboot" and once restarted you can eneter the IP address of the Pi into the Berto Hub properties page.

## Release Notes

### v1 - 2018-12-13

- Initial Release

### v2 - 2019-03-22 

#### Added

- Software and instructions to install the Berto Hub server on a Raspberry Pi 3+.

## Licence

[DM](../../LICENSE.md)