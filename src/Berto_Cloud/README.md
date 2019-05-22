# Berto Cloud

The Berto Cloud driver is the master driver for all other Berto drivers. The driver provides integration services to MQTT brokers that is used by other Berto drivers. 

You can also setup an [OpenVPN](https://openvpn.net) server on your system and can then set individual clients up to access your network using the [Berto_Profile](../../src/Berto_Profile/README.md) driver. The OpenVPN server listens on UDP port 2194 so you will need to configure a port forward NAT on your router to point to your this port on your system.

To enable the OpenVPN server you first need to create a configration using the Reset Configuration option under Management Action. Once the configuration has been created it can be enabled and disabled from the Enable Remote Access property or the UI button on any Navigator screen.

## Properties

* Email Address - Email address used as From address when sending emails via the Berto Mail service.
* Enable Berto Dynamic DNS - Creates a bertio.io hostname entry in the Berto DNS for use with the OpenVPN server in the event you do have not a static IP address or your own dynamic DNS service. The hostname created will be used in the OpenVPN client configurations.
* Berto Dynamic DNS Hostname - Display only field showing the Berto DNS hostname created.
* Hostname - The external hostname or IP address to be used for the OpenVPN server if not using the Berto Dynamic DNS service.
* Remote Access Network - This is the subnet used by the OpenVPN server. Clients are issued IP addresses from this subnet when they connect.
* Driver - Dropdown list of available Berto drivers.
* Room - Room that you would like to install specified driver into.
* Management Action - Action to take against specified Driver and Room
	
	* Install Driver Into Room
	* Upgrade Driver
	* Upgrade All Drivers
	* List Installed Drivers
	* Refresh Drivers List
	* Reset Configuration
	
* Enable Watchdog - Starts a watchdog timer in background that monitors the system specifically the state of the "director" process and in the event that the system becomnes unresponsive the "director" is restarted.
* Enable Remote Access - Start/Stop the Remote Access Server.
	
## Programming

### Events

* Selected - Event triggered when the UI button is selected from any Navigator screen

### Actions

* EXECUTE_COMMAND - Allows the execution of any system command on the local controller eg. reboot to reboot or halt to shutdown system.
* SEND_MAIL - Sends a simple email message using the Berto mail server.

## Release Notes

### v1 - 2018-12-13

- Initial Release

### v2 - 2019-02-11 

#### Added

- New command to send email notifications using the Berto mail server.

### v3 - 2019-03-14

#### Changed

- Changed SMTP authentication to use StartTLS submission protocol when connecting to Berto SMTP mail relay server.

### v4 - 2019-03-16

#### Added

- Added Enable Remote Access property.
- Both the status of the Watchdog and Remote Access properties are retained following a reboot and started automatically if enabled.

### v5 - 2019-03-17

#### Added

- Added hidden control binding to query status of Berto drivers.

### v6 - 2019-03-30

#### Fixed

- Issue with 2.10.5 systems not supporting C4:url function and causing the Cloud driver to intermittently stop connecting to MQTT brokers and Websocket servers for other drivers. Systems running 2.10.5 or below will need to update the driver from Compsoer Pro using the Update option.

### v7 - 2019-05-21

#### Added

- Email address added to be used as From address when senbding emails via the Berto Mail service.

## Licence

[DM](../../LICENSE.md)