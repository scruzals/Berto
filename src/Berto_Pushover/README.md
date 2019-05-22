# Berto Pushover

The Berto Pushover driver provides integration to the [Pushover](https://pushover.net) messaging service. To use the driver you need to setup an account on [Pushover](https://pushover.net) and purchase the appropriate licences for the devices you intend to send and receive messages with. The licences are by device type and are a small one off cost only.

To send messages from your Control4 system you will also need to setup an [Application Token](https://pushover.net/apps/build).

Messages received update the TITLE, MESSAGE, URL, PROFILE and LAST_MESSAGE variables which can be used in programming. Messages can also be sent to other Pushover devices registered to your account.

Users setup with a [Berto Profiles](../../src/Berto_Profile/README.md) driver will be able to received messages from the Pushover driver based on the pin number supplied in the title of the message. The Pushover message title should contain the user porfile name in uppercase followed by a space and the users pin number. This ensures that the driver only processes message received with the correct credentials. When a secure message is received the profile name and pin number are removed from the title and the PROFILE varibale is updated with the profile name. The NORMAL_MESSAGE_RECEIVED or SECURE_MESSAGE_RECEIVED event is fired indicating the type of message received. The message is then sent to the corresponding user profile driver.

In conjuction with [IFTTT](https://ifttt.com) and the [IFTTT Pushover](https://ifttt.com/pushover) service you can integrate other external devices to trigger programming in your system eg. [Alexa](https://ifttt.com/amazon_alexa) or [Google Assistant](https://ifttt.com/google_assistant). Alternatively you can use the [Berto IFTTT](../../src/Berto_IFTTT/README.md) to integrate directly with the [IFTTT Webhooks Service](https://ifttt.com/maker_webhooks).

## Properties

* Device Name - The name used to register your system against your Pushover account.
* Username - Pushover account username.
* Password - Pushover account password.
* Application Token - Pushover account application token used to send messages.
* User Id - The User Id created when registering to your Pushover account.
* Secret - The Secret created when registering to your Pushover account.
* Device Id - The device id created when registering to your Pushover account.
* Status - Last message type sent or received.
* Last message - Timestamp of last message received.
* Title - Title last received.
* Message - Message last received.
* URL - URL last received.
* Profile - Profile name of last secure message received.

## Programming 

Messages received update the TITLE, MESSAGE, URL, PROFILE and LAST_MESSAGE variables which can be used under programming. You can also send your own messages to another device, or devices seperated by commas, registered to your Pushover account under programming Actions.

## Release Notes

### v1 - 2018-12-13

- Initial Release

### v2 - 2019-03-04

#### Added

- Profiles can now be associated to the driver providing the ability to receive secure messages based on the user profile name and their pin code.
- New NORMAL_MESSAGE_RECEIVED and SECURE_MESSAGE_RECEIVED events fired when appropriate message is received.
- New PROFILE variable added updated with the user profile name when a secure message is received.
- Messages received with a user pin code are sent to the appropriate user profile driver.

#### Changed

- Removed the Authenticated fields as as now secure messages are indicated by the event fired.

### v3 - 2019-03-04

#### Changed

- Removed websocket keepalive timer as already catered for by Pushover keepalive

## Licence

[DM](../../LICENSE.md)