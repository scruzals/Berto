# Berto Beacon Manager

The Berto Beacon Mamager driver manages all beacon advertisments received by Bertro Beacon Gateway drivers such as the [Berto AB Gateway](../../src/Berto_ABGateway/README.md).

The driver processes messages into a common format which are then forwarded onto a registered Berto Beacon driver suchs as [Berto Proximity Beacon](../../src/Berto_ProximityBeacon/README.md), [Berto Button Beacon](../../src/Berto_ButtonBeacon/README.md) or [Berto Temperature Beacon](../../src/Berto_TemperatureBeacon/README.md).

Multiple copies of this driver can be installed to define different locations that you would like to track beacon proximity locations against.

When identifying beacons you can select different addresses to use for the device. The BLE address should the unique MAC address of the beacon but you are also able to group beacons by using the UUID, Major and Minor numbers eg. If you use just the UUID then you can have a set of beacons all with the same UUID trigger certain events. You can then add a futher beacon driver to identify the device by it's UUID and Major number etc.

The basic process flow for the driver is as follows :-

* Beacon advertisements are received on a supported Beacon Gateway.
* The Beacon Gateway sends updates via MQTT to a broker.
* The Berto MQTT Bridge receives subscribed beacon messages from the broker.
* The MQTT messages are passed onto the Beacon Gateway.
* The Beacon Gateway translates the messages and sends them on, in a common format, to the Berto Beacon Manager.
* The Beacon Manager checks the messages by BLE address and sends them on to the relevant Berto Beacon driver.
* The Beacon driver updates its variables with message parameters ie. UUID, Major, Minor, Power, RSSI, Distance, Proximity etc.

## Properties

* Beacons - List of beacon addresses that are captured duing a Berto Beacon identify phase. When the address is selected and Set the details are passed onto the Berto Beacon driver that initiated the identify process.
* Status - Shows the status of the Beacon Manager.

## Actions

* Cancel Indentifications - Cancel a running identification process from a Berto Beacon driver.

## Licence

[DM](../../LICENSE.md)