# Berto MQTT Bridge

The Berto MQTT Bridge driver allows connection to a public or private MQTT broker. The driver has connections for other Berto drivers that use MQTT messaging and IoT to control devices such as [Sonoff Relays](https://www.itead.cc/smart-home/sonoff-4ch.html) and the [Homekit MQTT Bridge](https://github.com/hobbyquaker/homekit2mqtt).

A private broker such as [Mosquitto](https://mosquitto.org) can be used to manage connections. The broker is used to send and optionally receive messages based on the Topic specified on the Properties page.

Any MQTT client can be used to send and receive messages that can be used in programming. Numerous apps are available for iPhone( [iHomeTouch](http://1j2.com/ihometouch)) and Android([MQTT Dash](https://play.google.com/store/apps/details?id=net.routix.mqttdash)).

## Properties

* Client Id - MQTT client Id otherwise defaults to the system MAC address and driver device Id.
* Quality of Service - MQTT QoS value used for subscriptions.
* Server - The MQTT Boker to connect to in the form mqtt:// or mqtts:// followed by the hostname:[port]. The port number is optional and defaults to 1883 for mqtt connections and port 8883 for mqtts SSL connections.
* Username - Broker username.
* Password - Broker password.
* Topics - Optional Topics to subscribe to seperated by commas. eg. bridge/#
* Maximum Message Size - Message size limit that will be accepted between 1Mb and 256Mb, default is 1Mb. IoT messages are generally very small, anything from a few bytes to a few hundred.
* Last Update - Date and time of the last message received.
* Last Message - Last Topic and Message received from the broker.

## Programming 

Messages received update the UPDATE, TOPIC, MESSAGE and NUMBER variables which can be used under programming. The NUMBER variable is any number specified in the MESSAGE received. You can also Publish your own messages to any Topic under programming Actions.

There are two events that are fired when a message is received. The GENERAL_MESSAGE_RECEIVED event is fired when a message is received on the one of the topics specified in the Topics property whilst the DEVICE_MESSAGE_RECEIVED is fired when a message is received on the topic from a specific bound device such as the [Berto Sonoff Relay](../../src/Berto_SonoffRelay/README.md).

There is also a KEEPALIVE variable which is updated every 10 seconds showing the age of the last keepalive packet received. This can be used to force a reconnection to the broker using the Restart MQTT command.

## Release Notes

### v1 - 2018-12-13

- Initial Release

### v2 - 2019-02-11 

#### Added

- New action "Restart MQTT" to restart the MQTT connection and re-subscribe to topics. ** Director restart required **
- New KEEPALIVE variable and "Restart MQTT" programming command.

#### Changed

- Changed order in which received mssages are processed so that device topics are checked first followed by the local Topics specificed in Properties.
- Changed subscription time delay from 3 to 10 seconds to give the MQTT connection to broker time to establish before subscription messages are sent.

#### Fixed

- Fixed issue where by the NUMBER variable assignment would cause an exception when no number was specified in the received MESSAGE, now defaults to 0.

### v3 - 2019-02-14

#### Fixed

- Fixed issue where by progamming code for events would disappear after a driver update.

### v4 - 2019-02-24

#### Changed

- Changed KEEPALIVE age variable to be updated based on last keepalive packet received rather than sent.

### v5 - 2019-04-06

#### Added

- Added property to define the MQTT client Id for brokers that require a specific Id such as [IBM's IoT Service](https://internetofthings.ibmcloud.com).

### v6 - 2019-04-07

#### Added

- Added property to define the MQTT Quality of Service (QoS) used for subscriptions.

### v7 - 2019-04-09

#### Added

- Added validation to Server property to ensure it starts with mqtt:// or mqtts://.

## Licence

[DM](../../LICENSE.md)