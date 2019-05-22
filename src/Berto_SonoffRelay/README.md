# Berto Sonoff Relay

The Berto Sonoff Relay driver allows connection of [Sonoff](https://sonoff.itead.cc) devices such as the [Sonoff 4 Channel Relay](https://sonoff.itead.cc/en/products/sonoff/sonoff-4ch-pro). Messaging to and from the devices is managed by the [Berto MQTT Bridge](../../src/Berto_MQTTBridge/README.md).

The Sonoff devices need to be flashed with custom firmware such as [ESPurna](https://github.com/xoseperez/espurna) or [Tasmota](https://github.com/arendst/Sonoff-Tasmota).

The Berto MQTT Bridge needs to be installed in your project.

## Properties

* Firmware - The custom firmware to use either ESPurna or Tasmota.
* Topic - The Sonoff Relay topic name setup on the device.
* Status - Shows the connection status of the relay.

## Connections

The driver has 4 standard relay connections that can be connected to relay devices. The [Berto Relay Light](../../src/Berto_RelayLight/README.md) can be used to add simple On/Off lights.

## Licence

[DM](../../LICENSE.md)