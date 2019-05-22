# Berto IFTTT

The Berto IFTT driver provides integration to the [IFTTT Webhooks Service](https://ifttt.com/maker_webhooks). To use the driver you need to connect your IFTTT account to the Webhooks service to obtain a key.

In order for your Control4 system to recieve messages from the IFTTT service you need to post your webhook request to https://ifttt.bertio.io which in turn securely forwards the request to your system using MQTT over SSL. Authentication is provided by your IFTTT key being part of the URL that is setup on the Webhooks service. The URL is in the format used for sending webhook requests from IFTTT to the Berto service is https://ifttt.berto.io/trigger/{event}/{system MAC address}/{key}. Requests not macthing this URL are immediately closed and also any requests with a content length greater that 1024 bytes are shutdown.

Users setup with a [Berto Profiles](../../src/Berto_Profile/README.md) driver will be able to receive messages from the IFTTT driver based on the pin number supplied in the event of the message. The IFTTT message event should contain the user porfile name in uppercase followed by a space and the users pin number. This ensures that the driver only processes message received with the correct credentials. The message is then sent to the corresponding user profile driver.

## Properties

* IFTTT Key - The key associated to your IFTTT Webhooks service.
* Text Variables - A list of text variables seperated by commands that will be created to be used under programming.
* Number Variables - A list of number variables seperated by commands that will be created to be used under programming.
* Boolean Variables - A list of boolean variables seperated by commands that will be created to be used under programming.

## Programming 

When an IFTTT message is received an event is fired and the appropriate variables will be updated, see below. If the message contains a body and is in JSON format then values will be extracted from the JSON to update the variables setup under Properties. eg. '{ "NAME": "Jon Doe", "TEMPERATURE": 23, "STATE": true }'.

The driver also provides the Send Event action to post an event to the Webhooks service. You need to specify the Event to publish and optionally 3 values that can be used by the IFTTT Webhooks service.

## Variables

* RECEIVED - Date and time of last message received.
* EVENT - Event received.
* CONTENT TYPE - The content type of the message.
* BODY - The body of the message.

## Release Notes

### v1 - 2018-12-13

- Initial Release

### v2 - 2019-02-11 

#### Fixed

- Fixed issue Send Event command posted incorrectly formed IFTTT request.

### v3 - 2019-03-14

#### Added

- Added HTTPS support listening on port 10443.

### v4 - 2019-05-14

#### Changed

- Removed support for direct HTTP/HTTPS connections avoifing the need to add port forwarding rulues to your router.
- Added HTTPS suppoort only using the Berto HTTPS service at https://ifttt.berto.io.

### v5 - 2019-05-17

#### Changed

- Chnaged the URL format that is used to send requests from IFTTT to the Berto service to allow for support of multiple Control4 systems for the same IFTTT user.

## Licence

[DM](../../LICENSE.md)