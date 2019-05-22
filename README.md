# Berto Control4 Drivers

A collection of Control4 drivers providing integration using various technologies along with other ancillary drivers. The [Berto_Cloud](src/Berto_Cloud/README.md) should be installed first which subsequently allows the installation and updates of all other Berto drivers.

The Berto Cloud driver also provides a programming action to execute system commands on the local controller eg. to cleanly shutdown the controller in the event of a power cut or reboot.

## Installation
Download the [Berto Cloud](c4z/Berto_Cloud.c4z) driver and copy to your Control4 Drivers directory. Once installed all other available Berto drivers can be installed from the Properties page by selecting the driver and room and then the Install option from the Management Action property. 

All Berto drivers require OS 2.10.0 or above.

## Drivers

### Integration

* [Berto_Cloud](src/Berto_Cloud/README.md) - Master Berto driver which manages all installs and updates of the Berto drivers. The driver provides integration to MQTT brokers allowing the sending and receiving of IoT messages. The driver also provides the ability to send emails using the Berto email service.

* [Berto_MQTTBridge](src/Berto_MQTTBridge/README.md) - Provides connection to MQTT brokers and IoT devices eg. Sonoff Relay, Homekit Bridge.

* [Berto_LifxBridge](src/Berto_LifxBridge/README.md) - Provides integration to Lifx devices on the local network without the need for an Internet connection or access to the Lifx Cloud. 

* [Berto_SonoffRelay](src/Berto_SonoffRelay/README.md) - Sonoff 4 Channel Relay driver for the Standard and Pro model.

* [Berto_ShellyRelay](src/Berto_ShellyRelay/README.md) - Shelly Relay driver for the Shelly1, Shelly1PM, Shelly 2.5 and Shelly 4 Pro relays.

* [Berto_ShellyLight](src/Berto_ShellyLight/README.md) - Shelly Light driver for the Shell RGBW2 LED dimmer.

* [Berto_RelayLight](src/Berto_RelayLight/README.md) - Simple On/Off Light driver that connects to a standard relay.

* [Berto_Pushover](src/Berto_Pushover/README.md) - Provides integration to the Pushover messaging service.

* [Berto_IFTTT](src/Berto_IFTTT/README.md) - Provides integration to the IFTTT Webhooks service.

* [Berto_OwnTracks](src/Berto_OwnTracks/README.md) - Provides integration to an OwnTracks location service.

* [Berto_ABGateway](src/Berto_ABGateway/README.md) - Provides integration to the April Beacon Gateway V4.0.

* [Berto_Hub](src/Berto_Hub/README.md) - Provides integration to the Homekit and Flic Buttons via the Berto Hub.

* [Berto_HomeAssistant](src/Berto_HomeAssistant/README.md) - Provides integration to Home Assistant.

* [Berto_Mail](src/Berto_Mail/README.md) - Provides integration to most mail servers including SSL and TLS support.

### Audio & Video

* [Berto_Humax_DTR-2000T](src/Berto_Humax_DTR-2000T/README.md) - IR driver for the Humax Youview+ HD TV Recorder.

* [Berto_SkyQ](src/Berto_SkyQ/README.md) - IP driver for the Sky Q & Sky Q Mini Boxes.

* [Berto_Kodi](src/Berto_Kodi/README.md) - IP driver for the for the Kodi Media Player.

* [Berto_NowTV](src/Berto_NowTV/README.md) - IP driver for the for the Now TV Player.

* [Berto_BenQ](src/Berto_BenQ/README.md) - IP driver for the for the BenQ range of projectors.

### Other

* [Berto_Profile](src/Berto_Profile/README.md) - Provides user profile configuration used by other Berto drivers.

* [Berto_BeaconManager](src/Berto_BeaconManager/README.md) - Provides management of beacon gateways to beacon devices.

* [Berto_ButtonBeacon](src/Berto_ButtonBeacon/README.md) - Provides button state updates from beacons which are availabe in programming.

* [Berto_ProximityBeacon](src/Berto_ProximityBeacon/README.md) - Provides proximity updates from beacons which are availabe in programming.

* [Berto_TemperatureBeacon](src/Berto_TemperatureBeacon/README.md) - Provides temperature updates from beacons which are availabe in programming.

* [Berto_LifxBulb](src/Berto_LifxBulb/README.md) - Provides integration of Lifx bulbs with the Berto Lifx Bridge.

* [Berto_FlicButton](src/Berto_FlicButton/README.md) - Provides button state updates from Flic buttons which are availabe in programming.

## Licence

[DM](LICENSE.md)