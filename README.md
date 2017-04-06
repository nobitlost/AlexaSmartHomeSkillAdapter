# AlexaSmartHomeSkill

This library provides a convenient way to implement the
 [Alexa Smart Home Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-the-smart-home-skill-api) within an agent. It takes care of the JSON verification, data parsing and response formatting.

Supported requests are:

- Appliance discovery
- Device status query
- Device control
- System health check

**To add this library to your project, add** `#require "AlexaSmartHomeSkill.class.nut:1.0.0"` **to the top of your agent code**

## AlexaSmartHomeSkill Class Usage

### Constructor: AlexaSmartHomeSkill()

The constructor takes no parameters.

```squirrel
#require "AlexaSmartHomeSkill.class.nut:1.0.0"

mySkill <- AlexaSmartHomeSkill();
```

## AlexaSmartHomeSkill Class Methods

### registerAppliance(*applianceId, applianceInfo, actionCallback*)

This method makes the device accessible through the [Alexa Smart Home Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-the-smart-home-skill-api).

*applianceId* specifies the device identifier. It must be unique across all devices.

*applianceInfo* is a table containing a number of required [properties](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#discoverappliancesresponse). It must contain the following keys:

| Key | Description |
| --- | --- |
| *manufacturerName* | The name of the device manufacturer |
| *modelName* | Device model name |
| *version* | The vendor-provided version of the device |
| *friendlyName* | The name used by the customer to identify the device |
| *friendlyDescription* | A human-readable description of the device |
| *actions* | An array of actions that the device supports. The library uses the array to verify that incoming requests can be fulfilled and are supported |
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

The *actionCallback* takes the following parameters:

| Parameter | Description |
| --- | --- |
| *session* | An *AlexaSmartHomeSkill.Session* instance |
| *applianceId* | The ID of the appliance |
| *action* | The Smart Home API action |
| *[parameter]* | Optional request-specific parameter |

The *actionCallback* function is executed when a Smart Home API request is received. The application is supposed to respond to this request by calling a confirm, response or error method on the *AlexaSmartHomeSkill.Session* object passed into the callback. This response can be made asynchronously.

The library checks that appropriate confirm/response function is called in response to the incoming request: the error is returned to the application if an inappropriate function is called. Error reporting functions are also allowed to be used in response to any command.

Exceptions thrown within the *actionCallback* function are handled by the library and so don’t result in an error being sent back to the Alexa service.

*registerAppliance()* returns `null` if the verification succeeds, otherwise it returns an error description.

#### Example

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
    // Handle Alexa request here
}.bindenv(this);

local alexa = AlexaSmartHomeSkill();
alexa.registerAppliance("SmartToaster", smartToasterInfo, actionCallback);
```

### removeAppliance(*applianceId*)

The *removeAppliance()* method removes the device from the list of accessible appliances. All further requests to the device with the given *applianceId* will be rejected and an [UnsupportedTargetError](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unsupportedtargeterror) issued.

The method does not return a value. Attempts to remove an appliance that has already been removed are ignored.

## AlexaSmartHomeSkill.Session Class Usage

This class is available only through the callback function registered with *registerAppliance()*. You should not instantiate it directly. Its main purpose is to encapsulate session data and to provide a convenient way to send responses.

## AlexaSmartHomeSkill.Session Class Methods

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

This method returns the request’s *additionalApplianceDetails* data.

### sendTurnOnConfirm()

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnonconfirmation) for a [TurnOn](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnonrequest) request.

The method returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *TurnOn* command, and transport-related errors.

### sendTurnOffConfirm()

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnoffconfirmation) for a [TurnOff](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#turnoffrequest) request.

The method returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *TurnOff* command, and transport-related errors.

### sendSetLockConfirm(*state*)

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setlockstateconfirmation) for a [SetLockState](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setlockstaterequest) request.

The method accepts the current lock state. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *setLockState* command, the *state* parameter is neither *LOCKED* nor *UNLOCKED*, and transport-related errors.

### sendGetLockStateResponse(*state*)

This method creates and sends a [response](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getlockstateresponse) to a [GetLockState](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getlockstaterequest) query.

The method accepts the current lock state. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *getLockState* command, the *state* parameter is neither *LOCKED* nor *UNLOCKED*, and transport-related errors.

### sendSetPercentageConfirm()

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setpercentageconfirmation) for a [setPercentage](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#setlockstaterequest) request.

The method returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *setPercentage* command, and transport-related errors.

### sendIncPercentageConfirm()

The *sendIncPercentageConfirm()* method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementpercentageconfirmation) for an [incrementPercentage](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementpercentagerequest) request.

The method returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *incrementPercentage* command, and transport-related errors.

### sendDecPercentageConfirm()

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementpercentageconfirmation) for a [decrementPercentage](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementpercentagerequest) request.

The method returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *decrementPercentage* command, and transport-related errors.

### sendIncTempConfirm(*temp, mode, prevTemp, prevMode*)

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementtargettemperaturerequest) for an [incrementTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#incrementtargettemperaturerequest) request.

The method accepts the current temperature and the temperature mode set by the device, and the temperature and temperature mode before the changes were made. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *incrementTargetTemperature* command, the *mode* and/or *prevMode* parameters is not *AUTO*, *COOL* or *HEAT*, and transport-related errors.

### sendDecTempConfirm(*temp, mode, prevTemp, prevMode*)

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementtargettemperatureconfirmation) for a [decrementTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#decrementtargettemperaturerequest) request.

The method accepts the current temperature and the temperature mode set by the device, and the temperature and temperature mode before the changes were made. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *decrementTargetTemperature* command, the *mode* and/or *prevMode* parameters is not *AUTO*, *COOL* or *HEAT*, and transport-related errors.

### sendSetTempConfirm(*temp, mode, prevTemp, prevMode*)

This method creates and sends a [confirmation](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#settargettemperatureconfirmation) for a [setTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#settargettemperaturerequest) request.

The method accepts current temperature and temperature mode set by the device, temperature and temperature mode
before changes were made.

The method accepts the current temperature and the temperature mode set by the device, and the temperature and temperature mode before the changes were made. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *setTargetTemperature* command, the *mode* and/or *prevMode* parameters is not *AUTO*, *COOL* or *HEAT*, and transport-related errors.

### sendGetTempResponse(*temperatureMode[, optionalValues]*)

This method creates and sends a [response](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTargetTemperatureResponse) to a [getTargetTemperature](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTargetTemperatureRequest) query.

The method accepts a temperature mode, and a table with optional fields:

| Key | Description |
| --- | --- |
| *targetTemperature* | Indicates the target temperature set by the device in single-setpoint mode in degrees Celsius |
| *coolingTargetTemperature* | Indicates the target temperature (setpoint) for cooling, in degrees Celsius, when a device has dual setpoints |
| *heatingTargetTemperature* | Indicates the target temperature (setpoint) for heating, in degrees Celsius, when a device has dual setpoints |
| *friendlyName* | Indicates a device specific name for a temperature mode |

The method accepts the current temperature and the temperature mode set by the device, and the temperature and temperature mode before the changes were made. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *getTargetTemperature* command, the *temperatureMode*  parameter is not *AUTO*, *COOL*, *HEAT*, *OFF*, *ECO* or *CUSTOM*, and transport-related errors.

### sendGetTempReadingResponse(*temperature*)

This method creates and sends a [response](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTemperatureReadingRequest) to a [getTemperatureReading](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#getTemperatureReadingRequest) query.

The method accepts a temperature reading from the device. It returns a message string if an error was detected, otherwise `null`. Possible error conditions include: the ongoing session is not related to the *getTemperatureReading* command, and transport-related errors.

### valueOutOfRangeError(*min, max*)

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#valueoutofrangeerror) that the target value is out of the supported range.

It accepts lowest and highest allowed values, and returns an error message string if a network problems was detected.

#### unwillingToSetValueError(*code, description*)

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unwillingtosetvalueerror) that a partner device has rejected a requested value.

It accepts an error code in string format and a custom description, and returns an error message string if a network problems was detected.

#### unsupportedTargetSettingError()

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unsupportedtargetsettingerror) that a setting is not valid for the device or the operation.

The method returns an error message string if a network problems was detected.

### driverInternalError()

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#driverinternalerror) that a general runtime error has taken place.

The method returns an error message string if a network problems was detected.

### noSuchTargetError()

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#nosuchtargeterror) that the target device cannot be found.

The method returns an error message string if a network problems was detected.

#### unsupportedOperationError()

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unsupportedoperationerror) that a requested operation is not supported on the target device.

The method returns an error message string if a network problems was detected.

### unexpectedInformationReceivedError(*invalidParam*)

This method is used to [notify](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference#unexpectedinformationreceivederror) that a message was malformed.

It accepts malformed property name, and returns an error message string if a network problems was detected.

## Demo Instructions

Please follow the [demo/README](./demo/README.md) for more information on the demo setup and instructions.

## License

AlexaSmartHomeSkill library is licensed under the [MIT License](./LICENSE).
