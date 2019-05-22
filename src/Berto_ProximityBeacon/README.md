# Berto Proximity Beacon

The Berto Proximity Beacon driver receives beacon advertisments from the [Berto Beacon Manager](../../src/Berto_BeaconManager/README.md) and updates driver variables that can be used under programming.

The driver monitors the proximity of the beacon and sets it to either the location of the gateway or "Away" when the beacon is out of range. For the proximity to change to "Away" the beacon needs to not have communicated with its gateway for at least timeout set on the Properties page.

## Properties

* MAC Address - The MAC address of the Beacon.
* Identity - The address used to identify the device, could be either the MAC address or UUID with optional Major and Minor numbers.
* Type - Beacon type. Currently only the iBeacon standard is supported.
* UUID - The unique beacon identifier configiured on the beacon.
* Major Minor Numbers - The Major and Minor numbers configured on the beacon.
* Signal Power - The base line signal power calibrated on the beacon when it is 1m from the receiver.
* Away Timeout - The number of seconds without receiving a signal from the beacon before the proximity is set to "Away".
* Packet Count For Average - Number of packets collected before avarage is taken and sent on to the Beacon. This will override the average setting on the gateway that recieved the packet. A setting of zero forces use of the gateway setting.
* RSSI - The signal strength of the last packet received from the beacon.
* Distance - The distance in metres calculated from the Signal Power and RSSI values.
* Gateway - The gateway location of the last packet received.
* Proximity - The current proximity of the beacon. Currently only the location of the gateway or "Away".
* Last Packet - The Date and Time of the last beacon packet received.
* Status - The connection status of the driver to the the Beacon Manager.

## Actions

* Identify Beacon - Put the Beacon Manager into identification mode. After initiating this action your can go to the Beacon Manager and select the relevant beacon MAC address for the beacon. When then selecting Set the identity of the beacon is sent to the Beacon driver that initiated the identification process. Beacons need to be within 1m of the receiver to be within identification Range. Going forward any advertisements from that beacon will be passed to the driver.

## Variables

The following varaibles are available under programming.

* MAC ADDRESS
* IDENTITY
* TYPE
* UUID
* MAJOR NUMBER
* MINOR NUMBER
* POWER SIGNAL
* RSSI
* DISTANCE
* GATEWAY
* PROXIMITY
* LAST PACKET

## Licence

[DM](../../LICENSE.md)