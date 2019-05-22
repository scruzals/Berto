# Berto Flic Button

The Berto Flic Button driver receives Flic Button advertisments from a [Berto Hub](../../src/Berto_Hub/README.md) and updates driver variables that can be used under programming and also fires the appropriate click action for the button.

The Flic button will report Single, Double and Triple clicks and also Hold events as well as State either Online or Offline.

## Properties

* Registered Buttons - The buttons registered with the Berto Flic Gateway available to be associated this driver. Select the button you wish to assign.
* Selected Button - The button address selected from the Registered Buttons list.
* Last Click - The Date/Time and click type of the last button click received.
* Status - The connection status of the driver to the the Flic gateway.

## Actions

* Refresh Button List - Get a list of buttons registered with the Bert Hub. The button can then be selected on the properties page.
* Pair Button - Put the Berto Hub in pairing mode. Pressing the Flic button will initiate pairing. If the button has been paired before it may need to be unpaired first or hold the button until pairing is complete.
* Unpair Button - Unpair the button selected in the Selected Button porperty.


## Variables

The following varaibles are available under programming.

* ADDRESS
* CLICK
* LAST CLICK
* STATE

## Licence

[DM](../../LICENSE.md)