# Berto AB Gateway

The Berto AB Gateway driver receives beacon advertisments from the [April Beacon Gateway V4.0](https://blog.aprbrother.com/product/ab-ble-gateway-4-0) gateway and forwards them onto the [Berto Beacon Manager](../../src/Berto_BeaconManager/README.md) driver.

The Berto MQTT Bridge needs to be installed in your project.

## Properties

* Location - The location where the gateway is installed which is then used for proximity updates.
* Topic - The Beacon Gateway topic name setup on the gateway.
* Packet Count For Average - Number of packets collected before avarage is taken and sent on to Beacon.
* IP Address - IP Address of gateway.
* MAC Address - MAC Address of gateway.
* Firmware - Firmware version of gateway.
* Status - Shows the connection status of the relay.

## Licence

[DM](../../LICENSE.md)