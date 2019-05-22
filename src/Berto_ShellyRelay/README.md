# Berto Shelly Relay

The Berto Shelly Relay driver allows connection of [Shelly Relay](https://shelly.cloud) devices including the [Shelly 1](https://shelly.cloud/product/shelly-1-open-source), [Shelly 1PM](https://shelly.cloud/product/wifi-smart-home-automation-shelly-1pm-switch-relay), [Shelly 2.5](https://shelly.cloud/shelly-25-wifi-smart-relay-roller-shutter-home-automation) and [Shelly 4 Pro](https://shelly.cloud/product/shelly-4pro). Messaging to and from the devices is managed by the [Berto MQTT Bridge](../../src/Berto_MQTTBridge/README.md).

The Berto MQTT Bridge needs to be installed in your project.

## Properties

* Registered Devices - List of available Shelly devices registered on the MQTT broker.
* Selected Device - The Shelly relay used by the driver.
* Model - Model of relay
* MAC Address - MAC Address relay
* IP Address - IP Address of relay
* Firmware - Firmware version installed on the relay.
* Relay (1-4) State - Current state of relay (On or Off)
* Button (1-4) State - Current state of button (On or Off)
* Status - MQTT connection status

## Connections

The driver creates the required standard relay connections that can be connected to relay devices. The [Berto Relay Light](../../src/Berto_RelayLight/README.md) can be used to add simple On/Off lights.

## Licence

[DM](../../LICENSE.md)