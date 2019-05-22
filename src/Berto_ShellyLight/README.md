# Berto Shelly Light

The Berto Shelly Light driver allows connection of [Shelly RGBW2](https://shelly.cloud/product/smart-wifi-shelly-rgbw-switch-dimmer) device. The driver operates as eitehr a single colour RGBW bulb or as 4 seperate white bulbs depending on the Shelly configuration.  Messaging to and from the devices is managed by the [Berto MQTT Bridge](../../src/Berto_MQTTBridge/README.md).

The Berto MQTT Bridge needs to be installed in your project.

## Properties

* Registered Devices - List of available Shelly devices registered on the MQTT broker.
* Selected Device - The Shelly light used by the driver.
* Model - Model of relay
* MAC Address - MAC Address relay
* IP Address - IP Address of relay
* Firmware - Firmware version installed on the relay
* Mode - The device configuation either Color RGBW or 4 Channel White
* Channel - The light channel when in White mode
* State - Current power state of light
* Level - The bright level when in White mode (0 -100)
* Red - The level of red color (0 - 255)
* Green - The level of green color (0 - 255)
* Blue - The level of blue color (0 - 255)
* White - The level of white color (0 - 255)
* Brightness - The level of brightness for all colors (0 - 100)
* Effect - The effect configured on the light
* Status - MQTT connection status

## Licence

[DM](../../LICENSE.md)