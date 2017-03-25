# AlexaSmartHomeSkill

The library provides a convenient way to implement the
 [Alexa Smart Home Skill Adapter](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-the-smart-home-skill-api)
 on the agent side.
It takes care of the JSON verification, data parsing and response formatting.
Supported requests are:

- Appliance discovering
- Device status query
- Device control command
- System health check

## AlexaSmartHomeSkill usage

### Constructor: AlexaSmartHomeSkill()

The constructor creates the instance of the *AlexaSmartHomeSkill*.

```squirrel
#require "AlexaSmartHomeSkill.class.nut:1.0.0"

mySkill <- AlexaSmartHomeSkill();
```

### Instance Methods

#### registerAppliance(_applianceId_, _applianceInfo_, _actionCallback_)

The *registerAppliance* method makes the device accessible through the
[Alexa Smart Home Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-the-smart-home-skill-api)
requests.

*applianceId* specifies the device identifier. It must be unique across all devices of the adapter.

*applianceInfo* is a table with several required
[properties](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#discoverappliancesresponse).
It must contain the following keys:

| Key | Description |
|-----|-------------|
| *manufacturerName* | The name of the device manufacturer |
| *modelName* | Device model name |
| *version* | The vendor-provided version of the device |
| *friendlyName* | The name used by the customer to identify the device |
| *friendlyDescription* | A human-readable description of the device |
| *actions* | An array of actions that the device supports. The library uses the array to verify that incoming requests can be fulfilled and are supported. |
| *additionalApplianceDetails* | String name/value pairs that provide additional information |

Supported actions are:
 - decrementPercentage
 - decrementTargetTemperature
 - getLockState
 - getTargetTemperature
 - getTemperatureReading
 - incrementPercentage
 - incrementTargetTemperature
 - setLockState
 - getLockState
 - setPercentage
 - setTargetTemperature
 - turnOff
 - turnOn

Please see the design [notes](./README.md#callback-design-notes) on the *actionCallback* for more details.

**Agent code example:**
```squirrel
local smartToasterInfo = {
    "actions": [
        "turnOn",
        "turnOff"
    ],
    "additionalApplianceDetails": {
        "extraDetail1": "pin1",
    },
    "friendlyDescription": "My super smart toaster",
    "friendlyName": "SmartToaster",
    "manufacturerName": "Mars Industrial",
    "modelName": "Smart Toaster 1.0",
    "version": "1.0"
};

// Callback executed upon Alexa request
local actionCallback = function(session, applianceId, action, params) {
    server.log("Got action " + action + " for " + applianceId);
    // handle Alexa request here
}.bindenv(this);

local alexa = AlexaSmartHomeSkill();
alexa.registerAppliance("SmartToaster", smartToasterInfo, actionCallback);
```

The *registerAppliance* method returns **null** if the arguments verification succeeds, or 
the error description otherwise.

When a **Smart Home API** request is received, the *actionCallback* function is executed.
The first argument is the newly created [AlexaSmartHomeSkill.Session](alexasmarthomeskill-session-usage) 
object, then the appliance id, action and the request specific parameters follow.

See [callback design notes](./README.md#callback-design-notes) for more details on the *actionCallback* arguments.

#### removeAppliance(applianceId)

The *removeAppliance()* removes the device from accessible appliance list.
All further request to the device with given *applianceId* will be rejected with
[UnsupportedTargetError](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unsupportedtargeterror).

There is nothing being returned from the method. Attempts to remove an appliance that
was already removed previously are ignored.


### Callback Design Notes
The *actionCallback* takes the following arguments:

| Parameter | Description |
|-----------|-------------|
| *session* | __AlexaSmartHomeSkill.Session__ instance |
| *applianceId* | The ID of the appliance |
| *action* | Smart Home API action |
| *[parameter]* | optional request specific parameter |

Application is supposed to respond to the Alexa service request by calling a ***Confirm**, ***Response**,
or ***Error** method on the *AlexaSmartHomeSkill.Session* object.
The response can be made asynchronously.

The library checks that appropriate Confirm/Response function is called in response to the incoming request. 
The error is returned to the application if not appropriate function is called.
At the same time any error reporting functions are allowed to be used in response to any command.

Exceptions thrown withing the *actionCallback* function are handled and don't result in an error sent back to the Alexa service.


## AlexaSmartHomeSkill.Session Usage

This class is available only as first parameter of action callback. Its main purpose is to encapsulate session related
data and provide convenient  way for response message sending.

### Instance Methods
- [getAdditionalDetails](#getadditionaldetails)
- [sendTurnOnConfirm](#sendturnonconfirm)
- [sendTurnOffConfirm](#sendturnoffconfirm)
- [sendSetLockConfirm](#sendsetlockconfirmstate)
- [sendGetLockStateResponse](#sendgetlockstateresponsestate)
- [sendSetPercentageConfirm](#sendsetpercentageconfirm)
- [sendIncPercentageConfirm](#sendincpercentageconfirm)
- [sendDecPercentageConfirm](#senddecpercentageconfirm)
- [sendIncTempConfirm](#sendinctempconfirmtemp-mode-prevtemp-prevmode)
- [sendDecTempConfirm](#senddectempconfirmtemp-mode-prevtemp-prevmode)
- [sendSetTempConfirm](#sendsettempconfirmtemp-mode-prevtemp-prevmode)
- [sendGetTempResponse](#sendgettempresponsetemperaturemode-optionalvalues)
- [sendGetTempReadingResponse](#sendgettempreadingresponsetemp)
- [valueOutOfRangeError](#valueoutofrangeerrormin-max)
- [unwillingToSetValueError](#unwillingtosetvalueerrorcode-descr)
- [unsupportedTargetSettingError](#unsupportedtargetsettingerror)
- [driverInternalError](#driverinternalerror)
- [noSuchTargetError](#nosuchtargeterror)
- [unsupportedOperationError](#unsupportedoperationerror)
- [unexpectedInformationReceivedError](#unexpectedinformationreceivederrorinvalidparam)

#### getAdditionalDetails()

The *getAdditionalDetails()* method returns **additionalApplianceDetails** of the request.

#### sendTurnOnConfirm()

The *sendTurnOnConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnonconfirmation) for [TurnOn](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnonrequest) request.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *TurnOn* command
- Transport related errors

#### sendTurnOffConfirm()

The *sendTurnOffConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnoffconfirmation) for [TurnOff](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnoffrequest) request.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *TurnOff* command
- Transport related errors

#### sendSetLockConfirm(_state_)

The *sendSetLockConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setlockstateconfirmation) for [SetLockState](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setlockstaterequest) request.

The method accepts the lock current state.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *getLockState* command
- State parameter is neither **LOCKED** nor **UNLOCKED**
- Transport related errors

#### sendGetLockStateResponse(_state_)

The *sendGetLockStateResponse()* method creates and sends [response](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getlockstateresponse) for [GetLockState](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getlockstaterequest) query.

The method accepts the lock current state.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *setLockState* command
- State parameter is neither **LOCKED** nor **UNLOCKED**
- Transport related errors

#### sendSetPercentageConfirm()

The *sendSetPercentageConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setpercentageconfirmation) for [setPercentage](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setlockstaterequest) request.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *setPercentage* command
- Transport related errors

#### sendIncPercentageConfirm()

The *sendIncPercentageConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementpercentageconfirmation) for [incrementPercentage](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementpercentagerequest) request.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *incrementPercentage* command
- Transport related errors

#### sendDecPercentageConfirm()

The *sendDecPercentageConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementpercentageconfirmation) for [decrementPercentage](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementpercentagerequest) request.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *decrementPercentage* command
- Transport related errors

####  sendIncTempConfirm(_temp, mode, prevTemp, prevMode_)

The *sendIncTempConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementtargettemperaturerequest) for [incrementTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementtargettemperaturerequest) request.

The method accepts current temperature and temperature mode set by the device,
temperature and temperature mode before changes were made.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *incrementTargetTemperature* command
- Mode parameters are not from **AUTO**, **COOL**, **HEAT**
- Transport related errors

####  sendDecTempConfirm(_temp, mode, prevTemp, prevMode_)

The *sendDecTempConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementtargettemperatureconfirmation) for [decrementTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementtargettemperaturerequest) request.

The method accepts current temperature and temperature mode set by the device,
temperature and temperature mode before changes were made.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *decrementTargetTemperature* command
- Mode parameters are not from **AUTO**, **COOL**, **HEAT**
- Transport related errors


####  sendSetTempConfirm(_temp, mode, prevTemp, prevMode_)

The *sendSetTempConfirm()* method creates and sends [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#settargettemperatureconfirmation) for [decrementTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#settargettemperaturerequest) request.

The method accepts current temperature and temperature mode set by the device, temperature and temperature mode
before changes were made.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *setTargetTemperature* command
- Mode parameters are not from **AUTO**, **COOL**, **HEAT**
- Transport related errors

####  sendGetTempResponse(_temperatureMode, [optionalValues]_)

The* sendGetTempResponse()* method creates and sends [response](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTargetTemperatureResponse) for [getTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTargetTemperatureRequest) query.

The method accepts temperature mode, and a table with optional fields:

| Key | Description |
|-----|-------------|
| *targetTemperature* | Indicates the target temperature set by the device in single-setpoint mode in degrees Celsius. |
| *coolingTargetTemperature* | Indicates the target temperature (setpoint) for cooling, in degrees Celcius, when a device has dual setpoints. |
| *heatingTargetTemperature object* | object 	Indicates the target temperature (setpoint) for heating, in degrees Celcius, when a device has dual setpoints. |
| *friendlyName* | Indicates a device specific name for a temperature mode. |

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *getTargetTemperature* command
- Mode parameters are not from **AUTO**, **COOL**, **HEAT**, **OFF**, **ECO**, **CUSTOM**
- Transport related errors

####  sendGetTempReadingResponse(_temp_)

The *sendGetTempReadingResponse()* method creates and sends [response](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTemperatureReadingRequest) for [getTemperatureReading](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTemperatureReadingRequest) query.

The method accepts temperature reading from the device.

The method returns **message string** if error was detected, or **null** otherwise.
The list of possible error conditions:
- Ongoing session is not related to *getTemperatureReading* command
- Transport related errors

#### valueOutOfRangeError(_min, max_)
The *valueOutOfRangeError()* is used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#valueoutofrangeerror) about target value is out of its supported range.

It accepts lowest and highest allowed values.

The method returns **message string** if network problem was detected.

#### unwillingToSetValueError(code, descr)
The *unwillingToSetValueError()* is used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unwillingtosetvalueerror) about partner device is rejecting to set requested value.

It accepts error code in string format and custom description.

The method returns **message string** if network problem was detected.

#### unsupportedTargetSettingError()
The *unsupportedTargetSettingError()* is used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unsupportedtargetsettingerror) about setting is not valid for the device or the operation.

The method returns **message string** if network problem was detected.

#### driverInternalError()
The *driverInternalError()* is used to be used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#driverinternalerror) about general runtime error.

The method returns **message string** if network problem was detected.

#### noSuchTargetError()
The *noSuchTargetError()* is used to be used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#nosuchtargeterror) about  target device cannot be found.

The method returns **message string** if network problem was detected.

#### unsupportedOperationError()
The *unsupportedOperationError()* is used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unsupportedoperationerror) about  requested operation is not supported on the target device.

The method returns **message string** if network problem was detected.

#### unexpectedInformationReceivedError(_invalidParam_)
The *unexpectedInformationReceivedError()* is used for [notification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unexpectedinformationreceivederror) about malformed message.

It accepts malformed property name.

The method returns **message string** if network problem was detected.

## Demo Instructions

Please follow the [demo/README](./demo/README.md) for more information on the demo setup and instructions.

## License

AlexaSmartHomeSkill library is licensed under the [MIT License](./LICENSE).
