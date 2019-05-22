# Berto Lifx Bridge

The Berto Lifx Bridge driver provides intergation to [Lifx Light Bulbs](https://www.lifx.com). You will need to add the appropriate [Berto Lifx Bulb](../../src/Berto_LifxBulb/README.md) drivers for each Lifx bulb in your system.

The Berto Lifx Bridge utilises the [Lifx LAN Protocol](https://lan.developer.lifx.com). The driver works on the local network to control Lifx devices. Access to the Internet and the Lifx Cloud is not required to configure and control your Lifx devices.

A refresh interval can be set to enable polling of device states. This can be used if you are controlling the Lifx devices outside of Control4 so that Control4 receives device state changes.

## Properties

* Devices - List of discovered Lifx devices.
* Status - Number of devices found.
* Refresh Interval - Interval, in seconds, for polling all bulb states. Zero disables polling.

## Actions

* Search For Devices - Start a 10 second discovery process to find Lifx devices on your local network.

## Release Notes

### v1 - 2018-12-13

- Initial Release

## Licence

[DM](../../LICENSE.md)