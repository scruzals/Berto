# Berto Home Assistant

The Berto Home Assistant driver exposes selected Control4 devices to [Home Assistant](https://www.home-assistant.io) using its MQTT broker. 

## Properties

* Server - The MQTT Boker to connect to in the form mqtt:// or mqtts:// followed by the hostname:[port]. The port number is optional and defaults to 1883 for mqtt connections and port 8883 for mqtts SSL connections.
* Username - Broker username.
* Password - Broker password.
* Discovery Topic - Discovery prefix topic setup in Home Assistant.
* Home Assistant Devices - Devices to expose to Home Assistant.
* Last Update - Date and time of the last message received.
* Last Message - Last Topic and Message received from the broker.

## Programming 

Messages received update the UPDATE, TOPIC, MESSAGE and NUMBER variables which can be used under programming. The NUMBER variable is any number specified in the MESSAGE received. You can also Publish your own messages to any Topic under programming Actions.

The MESSAGE_RECEIVED event is fired when a message is received from the Home Assistant topic.

There is also a KEEPALIVE variable which is updated every 10 seconds showing the age of the last keepalive packet received. This can be used to force a reconnection to the broker using the Restart MQTT command.

## Release Notes

### v1 - 2019-04-17

- Initial Release

## Licence

[DM](../../LICENSE.md)