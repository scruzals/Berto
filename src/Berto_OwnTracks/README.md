# Berto Owntracks

The Berto Owntracks driver provides integration to an [OwnTracks](https://owntracks.org) service either public or private. This allows for users setup with a [Berto_Profile](../../src/Berto_Profile/README.md) to have their specific location tracked by using either the [iPhone](https://itunes.apple.com/us/app/mqttitude/id692424691) or [Android](https://play.google.com/store/apps/details?id=org.owntracks.android) apps.

A private broker such as [Mosquitto](https://mosquitto.org) can be used to host your own Owntracks service allowing for you to share all registered users locations with your system which can then be used in programming.

## Properties

* Server - The OwnTracks Boker to connect to in the form mqtt:// or mqtts:// followed by the hostname:[port]. The port number is optional and defaults to 1883 for mqtt connections and port 8883 for mqtts SSL connections.
* Username - Broker username.
* Password - Broker password.
* Topic - The topic used in the OwnTracks topics, the default is owntracks/#.
* Home Region Name - The name of the location which the system designates as Home.
* Home Radius - The distance from the Home location before it is designated as left Home.
* Profiles - The user profiles that will have OwnTracks location data updated for them. The name of the profile needs to match the name of the topic being sent by the phone app to the OwnTracks server. The names are not case sensitive.
* Last Update - Date and time of the last OwnTracks location received along with the username.
* Status - The status of the last OwnTracks message received for the user.

## Programming 

OwnTracks updates received update the LAST UPDATE, PROFILE and STATUS variables which can be used under programming.

## Licence

[DM](../../LICENSE.md)