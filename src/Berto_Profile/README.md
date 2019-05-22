# Berto Profile

The Berto Profile driver is used to define a user on your system. The user can then be allowed to connect to your system using any [OpenVPN](https://openvpn.net) client.

Users can also setup a pin code which is used by the [Berto Pushover](../../src/Berto_Pushover/README.md) and [Berto IFTTT](../../src/Berto_IFTTT/README.md) drivers to enable a message to be sent to the user when received by Pushover or IFTTT. When a message is received the MESSAGE_RECEIVED event is fired which can be used in programming.


## Properties

* Name - Name of user.
* Email Address - Email address of user.
* Remote Access - Enable or Disable Remote Access. 
* Pin Code - Pin code used for accepting messages.
* Assist Token - System generated authentiction token used by Berto Assist.
* Received - Type of message last received.
* Title - Title last received.
* Message - Message last received.
* URL - URL last received.
* Status - Reserved for future use.
* Location - Reserved for future use.

When the user is first enabled for Remote Access an OpenVPN client configuration is created using the name you have specifed for the driver in your project. Once the configuration is created it is copied to the /tmp directory on your master controller. The configration is called "Username.ovpn" and needs to be copied from the controller and imported into your OpenVPN client software. 

Subsequently disabling the user does not revoke the configutration but just disables access for the user until you re-enable it again.

When a users details are changed you will need to Refresh Navigators to ensure other Berto drivers receive the profile chnages.

## Programming

The following variables are available under programming and are updated by any linked Berto_VoiceScene or [Berto_OwnTracks](../../src/Berto_OwnTracks/README.md) drivers.

* ALTITUDE - Last altitude reading received from a linked OwnTracks driver.
* BATTERY - Last battery reading received from a linked OwnTracks driver.
* CONNECTIVITY - Last connectivity reading received from a linked OwnTracks driver.
* EVENT - Last event received from a linked OwnTracks driver.
* IS HOME - Home location indicator.
* LAST REGION - Last region before the previous region changed based on the last reading received from a linked OwnTracks driver.
* LAST UPDATE - Last date and time when a reading was received from a linked OwnTracks driver.
* LATITUDE - Last latitude reading received from a linked OwnTracks driver.
* LONGITUDE - Last longitude reading received from a linked OwnTracks driver.
* REGION - The current region based on the last reading received from a linked OwnTracks driver.

* PIN CODE - The pin code assigned to the user profile.
* ROOM ID - The room id associated to the user profile.
* RECEIVED - Last message received type, currently only "PUSHOVER" and "IFTTT" are supported.
* TITLE - Last title received.
* MESSAGE - Last message received.
* URL - Last url received.

## Release Notes

### v1 - 2018-12-13

- Initial Release

### v2 - 2019-03-14

#### Added

- Event MESSAGE_RECEIVED fired when a message is received from Pushover.

## Licence

[DM](../../LICENSE.md)