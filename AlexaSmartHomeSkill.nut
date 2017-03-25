// MIT License
//
// Copyright 2017 Electric Imp
//
// SPDX-License-Identifier: MIT
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.


// Alexa Smart Home Skill API strings.
const ALEXA_CONTROL_NS          = "Alexa.ConnectedHome.Control";
const ALEXA_DISCOVERY_REQ_NAME  = "DiscoverAppliancesRequest";
const ALEXA_DISCOVERY_RES_NAME  = "DiscoverAppliancesResponse";
const ALEXA_DISCOVERY_NS        = "Alexa.ConnectedHome.Discovery";
const ALEXA_QUERY_NS            = "Alexa.ConnectedHome.Query";
const ALEXA_SYSTEM_NS           = "Alexa.ConnectedHome.System";
const ALEXA_PAYLOAD_VER         = "2";

const ALEXA_HEALTH_REQ          = "HealthCheckRequest";
const ALEXA_HEALTH_RES          = "HealthCheckResponse";

const ALEXA_DISCOVERED_APP      = "discoveredAppliances";
const ALEXA_APP_ID              = "applianceId";
const ALEXA_APP_MANUFACTURER    = "manufacturerName";
const ALEXA_APP_MODEL           = "modelName";
const ALEXA_APP_VERSION         = "version";
const ALEXA_FRIENDLY_NAME       = "friendlyName";
const ALEXA_APP_FRIENDLY_DESC   = "friendlyDescription";
const ALEXA_APP_ACTIONS         = "actions";
const ALEXA_APP_REACHABLE       = "isReachable";
const ALEXA_APP_DETAILS         = "additionalApplianceDetails";

const ALEXA_NAME_STR            = "name";
const ALEXA_HEADER_STR          = "header";
const ALEXA_NAMESPACE_STR       = "namespace";
const ALEXA_ACCESS_TOKEN_STR    = "accessToken";
const ALEXA_PAYLOAD_STR         = "payload";
const ALEXA_MESS_ID_STR         = "messageId";
const ALEXA_PAYLOAD_VER_STR     = "payloadVersion";
const ALEXA_APPLIANCE_STR       = "appliance";

const ALEXA_CMD_DEC_PERC        = "decrementPercentage";
const ALEXA_CMD_DEC_PERC_REQ    = "DecrementPercentageRequest";
const ALEXA_CMD_DEC_PERC_RES    = "DecrementPercentageConfirmation";

const ALEXA_CMD_DEC_TEMP        = "decrementTargetTemperature";
const ALEXA_CMD_DEC_TEMP_REQ    = "DecrementTargetTemperatureRequest";
const ALEXA_CMD_DEC_TEMP_RES    = "DecrementTargetTemperatureConfirmation";

const ALEXA_CMD_GET_TEMP        = "getTargetTemperature";
const ALEXA_CMD_GET_TEMP_REQ    = "GetTargetTemperatureRequest";
const ALEXA_CMD_GET_TEMP_RES    = "GetTargetTemperatureResponse";

const ALEXA_CMD_READ_TEMP       = "getTemperatureReading";
const ALEXA_CMD_READ_TEMP_REQ   = "GetTemperatureReadingRequest";
const ALEXA_CMD_READ_TEMP_RES   = "GetTemperatureReadingResponse";

const ALEXA_CMD_INC_PERC        = "incrementPercentage";
const ALEXA_CMD_INC_PERC_REQ    = "IncrementPercentageRequest";
const ALEXA_CMD_INC_PERC_RES    = "IncrementPercentageConfirmation";

const ALEXA_CMD_INC_TEMP        = "incrementTargetTemperature";
const ALEXA_CMD_INC_TEMP_REQ    = "IncrementTargetTemperatureRequest";
const ALEXA_CMD_INC_TEMP_RES    = "IncrementTargetTemperatureConfirmation";

const ALEXA_CMD_SET_PERC        = "setPercentage";
const ALEXA_CMD_SET_PERC_REQ    = "SetPercentageRequest";
const ALEXA_CMD_SET_PERC_RES    = "SetPercentageConfirmation";

const ALEXA_CMD_SET_TEMP        = "setTargetTemperature";
const ALEXA_CMD_SET_TEMP_REQ    = "SetTargetTemperatureRequest";
const ALEXA_CMD_SET_TEMP_RES    = "SetTargetTemperatureConfirmation";

const ALEXA_CMD_TURN_OFF        = "turnOff";
const ALEXA_CMD_TURN_OFF_REQ    = "TurnOffRequest";
const ALEXA_CMD_TURN_OFF_RES    = "TurnOffConfirmation";

const ALEXA_CMD_TURN_ON         = "turnOn";
const ALEXA_CMD_TURN_ON_REQ     = "TurnOnRequest";
const ALEXA_CMD_TURN_ON_RES     = "TurnOnConfirmation";

// it is strange but getLockState is not listed at valid action list
const ALEXA_CMD_GET_LOCK        = "getLockState";
const ALEXA_CMD_GET_LOCK_REQ    = "GetLockStateRequest";
const ALEXA_CMD_GET_LOCK_RES    = "GetLockStateResponse";
const ALEXA_CMD_SET_LOCK        = "setLockState";
const ALEXA_CMD_SET_LOCK_REQ    = "SetLockStateRequest";
const ALEXA_CMD_SET_LOCK_RES    = "SetLockStateConfirmation";
const ALEXA_LOCKED_STR          = "LOCKED";
const ALEXA_UNLOCKED_STR        = "UNLOCKED";
const ALEXA_LOCK_STATE_STR      = "lockState";


const ALEXA_DELTA_TEMP_STR      = "deltaTemperature";
const ALEXA_TEMP_STR            = "targetTemperature";
const ALEXA_TARGET_MODE_STR     = "temperatureMode";
const ALEXA_PREV_STATE_STR      = "previousState";
const ALEXA_MODE_STR            = "mode";
const ALEXA_COOL_TEMP_STR       = "coolingTargetTemperature";
const ALEXA_HEAT_TEMP_STR       = "heatingTargetTemperature";

const ALEXA_AUTO_STR            = "AUTO";
const ALEXA_COOL_STR            = "COOL";
const ALEXA_HEAT_STR            = "HEAT";
const ALEXA_ECO_STR             = "ECO";
const ALEXA_OFF_STR             = "OFF";
const ALEXA_CUSTOM_STR          = "CUSTOM";

const ALEXA_READ_TEMP_STR       = "temperatureReading";

const ALEXA_PERC_STATE_STR      = "percentageState";
const ALEXA_PERC_DELTA_STR      = "deltaPercentage";
const ALEXA_VALUE_STR           = "value";

// Alexa error information encoding strings
const ALEXA_ERR_INFO_STR        = "errorInfo";
const ALEXA_CODE_STR            = "code";
const ALEXA_DESCR_STR           = "description";

// ALEXA ERROR MESSAGES
const ALEXA_DI_ERR              = "DriverInternalError";
const ALEXA_NST_ERR             = "NoSuchTargetError";
const ALEXA_IT_ERR              = "InvalidAccessTokenError";
const ALEXA_UIR_ERR             = "UnexpectedInformationReceivedError";
const ALEXA_UO_ERR              = "UnsupportedOperationError";
const ALEXA_UTS_ERR             = "UnsupportedTargetSettingError";
const ALEXA_USV_ERR             = "UnwillingToSetValueError";
const ALEXA_VOR_ERR             = "ValueOutOfRangeError";

// Response fields length limits
const ALEXA_OPT_DESCR_LEN       = 5000;
const ALEXA_DEF_LEN             = 128;
const ALEXA_APPID_LEN           = 256;


// Error message templates
// Field not found message
const NOT_FOUND_ERR             = "Field not found: ";
// Invalid value error messages
const INVALID_VALUE_ERR         = "Invalid value of ";
// Appliance already exist error
const DUP_APP_ERR               = "Duplicating Appliance";
// Appliance responses with invalid heating mode
const WRONG_HEAT_MODE           = "App supplies invalid heat mode";

// Alexa Smart Home service integration class.
//
class AlexaSmartHomeSkill {

    static VERSION = "1.0.0";

    // Appliance description mandatory field list.
    // Doesn't include "applianceId" and "actions"
    static _mandatoryFields = [
        ALEXA_APP_MANUFACTURER,
        ALEXA_APP_MODEL,
        ALEXA_APP_VERSION,
        ALEXA_FRIENDLY_NAME,
        ALEXA_APP_FRIENDLY_DESC,
    ];

    // Alexa SmartHome Skill actions
    static _validActions = [
        ALEXA_CMD_DEC_PERC,
        ALEXA_CMD_DEC_TEMP,
        ALEXA_CMD_GET_TEMP,
        ALEXA_CMD_READ_TEMP,
        ALEXA_CMD_INC_PERC,
        ALEXA_CMD_INC_TEMP,
        ALEXA_CMD_SET_PERC,
        ALEXA_CMD_SET_TEMP,
        ALEXA_CMD_TURN_OFF,
        ALEXA_CMD_TURN_ON,
        ALEXA_CMD_SET_LOCK,
        ALEXA_CMD_GET_LOCK
    ];

    // List of registered appliances
    _appliances = {};

    // Debug flag
    _debug = true;

    // Constructor
    // Parameters:
    //         None
    // Return:
    //         Nothing
    constructor() {
        http.onrequest(_httpRequestHandler.bindenv(this));
    }

    // Register new appliance
    //
    // Parameters:
    //             applianceId     - A device identifier. Must be unique across devices available
    //                               through this adapter.
    //             applianceInfo   - A table with mandatory properties described at
    //                               DiscoverAppliancesResponse section of Smart Home Skill API.
    //                               E.g. { "modelName" : "superModel", ....}
    //             actionCb        - A handler to be called when new action request has arrived.
    //                               The handler's signature:
    //                                 actionCb(session, applianceId, action, details, data), where
    //                                     session     - An instance of Session
    //                                     applianceId - A device identifier.
    //                                     action      - An action string,
    //                                                   one from provided appliance info
    //                                     data        - string parameter required for particular action,
    //                                                     e.g. "LOCKED" for "setLockState"
    // Return:
    //             error description or null
    function registerAppliance(applianceId, applianceInfo, actionCb) {

        if (applianceId in _appliances) return DUP_APP_ERR;

        //  verify and copy mandatory fields
        local verifiedInfo = {};

        local err = _verifyAndCopy(applianceId, applianceInfo, verifiedInfo);
        if (null != err) return err;

        // check if actionCb is a function
        if (typeof actionCb != "function") return INVALID_VALUE_ERR + "actionCb";
        verifiedInfo["callback"] <- actionCb;

        _appliances[applianceId] <- verifiedInfo;

        return null;
    }

    // Removes registered appliance
    //
    // Parameters:
    //          applianceId - ID of appliance previously registered with registeredAppliance
    // Return:
    //          noting
    function removeAppliance(applianceId) {
        if (applianceId in _appliances) {
            delete _appliances[applianceId];
        } else {
            _log("Warning: no appliance with id = " + applianceId + " to remove");
        }
    }

    // -------------------- PRIVATE METHODS -------------------- //

    // Verify provided appliance info and copy mandatory subset to new table
    //
    // Parameters:
    //          applianceId     - A device identifier.
    //          applianceInfo   - appliance info provided by application
    //          verifiedInfo    - verified and reduced table
    // Return:
    //          error message with description of problem or null
    function _verifyAndCopy(applianceId, applianceInfo, verifiedInfo) {
        verifiedInfo[ALEXA_APP_REACHABLE] <- true;
        {
            // verify app ID.
            if (typeof applianceId == "string" && applianceId.len() < ALEXA_APPID_LEN) {
                verifiedInfo[ALEXA_APP_ID] <- applianceId;
            } else {
                return INVALID_VALUE_ERR + ALEXA_APP_ID;
            }
        }

        // verify mandatory fields
        foreach (key in _mandatoryFields) {
            if (!(key in applianceInfo)) return NOT_FOUND_ERR + key;

            local value = applianceInfo[key];

            if ((typeof value == "string") && 0 != value.len() && ALEXA_DEF_LEN > value.len()) {
                verifiedInfo[key] <- value;
            } else {
                return INVALID_VALUE_ERR + key;
            }
        }

        {
            // verify actions
            if (!(ALEXA_APP_ACTIONS in applianceInfo)) return NOT_FOUND_ERR + ALEXA_APP_ACTIONS;

            local actions = applianceInfo[ALEXA_APP_ACTIONS];
            if (typeof actions != "array") return INVALID_VALUE_ERR + ALEXA_APP_ACTIONS;

            local newActs = _validActions.filter(function(index, value) {
                return null != actions.find(value);
            });

            if (0 == newActs.len()) return INVALID_VALUE_ERR + ALEXA_APP_ACTIONS;

            verifiedInfo[ALEXA_APP_ACTIONS] <- newActs;
        }

        // verify optional details, no error is reported
        if (ALEXA_APP_DETAILS in applianceInfo) {
            local appInfoOpt = applianceInfo[ALEXA_APP_DETAILS];
            if (typeof appInfoOpt == "table") {
                local toOpt = {};
                local totalLen = 0;

                foreach (key, value in appInfoOpt) {
                    if (typeof  key == "string" && typeof value == "string") {
                        totalLen += key.len();
                        totalLen += value.len();

                        if (totalLen < ALEXA_OPT_DESCR_LEN) toOpt[key] <- value;
                    }
                }
                verifiedInfo[ALEXA_APP_DETAILS] <- toOpt;
            }
        }
        return null;
    }

    // HTTP Request Handler Callback
    //
    // Parameters:
    //          httpRequest The incoming HTTP request decoded into key-value pairs
    //          httpResponse An automatically generated HTTP response
    //                       for replying to the source of the request
    // Return:  Nothing
    function _httpRequestHandler(httpRequest, httpResponse) {
        local method = httpRequest.method;

        local session;

        _log("Received request: " + http.jsonencode(httpRequest));

        if (method == "GET") {
            session = Session(httpResponse, _appliances, null);
        } else if (method == "POST") {
            try {
                // Agent receives HTTP data at "body" section
                local body = httpRequest.body;
                local request = http.jsondecode(body);
                // verify and cache relevant data
                session = Session(httpResponse, _appliances, request);
            } catch (error) {
                // skip invalid request silently since we are not sure about originator
                _log("Invalid HTTP data. Suspicious 'body' section: " + error);
                return;
            }
        } else {
            _log("Unsupported HTTP method");
            return;
        }
        session._processAsync();
    }

    // Implements debug logging. Sends the log message
    // to the console output if "debug" configuration
    // flag is set
    //
    // Parameters:
    //                      message to print
    //
    // Returns:             Nothing
    function _log(message) {
        if (_debug) {
            server.log("[AlexaSkill] " + message);
        }
    }

    // Class that takes on responsibility for HTTP request processing.
    Session = class {

        // Ongoing session httpresponse instance
        _http = null;

        // Current request 'namespace'
        _ns = ALEXA_DISCOVERY_NS;

        // Current request 'name'
        _name = null;

        // Current request 'messageId'
        _messId = null;

        // Current request 'token'
        _token = null;

        // Current request 'payload' with deleted 'token'
        _payload = null;

        // List of registered appliances
        _appliances = null;

        // Cached appliance ID
        _applianceId = null;

        // Cached executed command
        _cmd = null;

        // Cached command parameter
        _param = null;

        // Cached callback
        _cb = null;

        // Debug flag
        _debug = true;

        // short list of valid temperature modes
        static _shortHeatModeList = [ALEXA_AUTO_STR, ALEXA_COOL_STR, ALEXA_HEAT_STR];
        // full list of valid temperature modes
        static _fullHeatModeList = [
            ALEXA_AUTO_STR,
            ALEXA_COOL_STR,
            ALEXA_HEAT_STR,
            ALEXA_ECO_STR,
            ALEXA_OFF_STR,
            ALEXA_CUSTOM_STR
        ];

        // constructor
        // Parameters:
        //      httpResponse    - HTTP response for replying to the source of the request
        //      applianceList   - registered applianceList
        //      request         - table with HTTP request data, may be null
        // Throws:
        //      if request is valid object but doesn't contain mandatory data
        constructor(httpResponse, applianceList, request = null) {
            _http = httpResponse;
            _appliances = applianceList;

            if (typeof request == "table") {
                local header = _extract(request, ALEXA_HEADER_STR);

                _ns     = _extract(header, ALEXA_NAMESPACE_STR);
                _name   = _extract(header, ALEXA_NAME_STR);
                _messId = _extract(header, ALEXA_MESS_ID_STR);

                if (_extract(header, ALEXA_PAYLOAD_VER_STR) != ALEXA_PAYLOAD_VER) {
                    throw ALEXA_PAYLOAD_VER_STR;
                }

                _payload = _extract(request, ALEXA_PAYLOAD_STR);
                _token = _extract(_payload, ALEXA_ACCESS_TOKEN_STR);

                // just to clean up
                delete _payload[ALEXA_ACCESS_TOKEN_STR];
            }
        }

        // Send response to TurnOn request
        function sendTurnOnConfirm() {
            local err = _checkResponse(ALEXA_CMD_TURN_ON);
            if (null == err) {
                return _sendOK(ALEXA_CMD_TURN_ON_RES);
            }
            return err;
        }

        // Send response to TurnOff request
        function sendTurnOffConfirm() {
            local err = _checkResponse(ALEXA_CMD_TURN_OFF);
            if (null == err) _sendOK(ALEXA_CMD_TURN_OFF_RES);
            return err;
        }

        // Send SetLockState confirmation
        // Parameters:
        //      state - current lock state (LOCKED, UNLOCKED)
        function sendSetLockConfirm(state) {
            {
                local err = _checkResponse(ALEXA_CMD_SET_LOCK);
                if (null != err) return err;
            }

            return _sendLockStateResponse(ALEXA_CMD_SET_LOCK_RES, state);
        }

        // Send GetLockState response
        // Parameters:
        //      state - current lock state (LOCKED, UNLOCKED)
        function sendGetLockStateResponse(state) {
            {
                local err = _checkResponse(ALEXA_CMD_GET_LOCK);
                if (null != err) return err;
            }

            return _sendLockStateResponse(ALEXA_CMD_GET_LOCK_RES, state);
        }

        // Send response to SetPercentageRequest
        function sendSetPercentageConfirm() {
            {
                local err = _checkResponse(ALEXA_CMD_SET_PERC);
                if (null != err) return err;
            }
            _sendOK(ALEXA_CMD_SET_PERC_RES);
        }

        // Send response to IncrementPercentageRequest
        function sendIncPercentageConfirm() {
            {
                local err = _checkResponse(ALEXA_CMD_INC_PERC);
                if (null != err) return err;
            }
            _sendOK(ALEXA_CMD_INC_PERC_RES);
        }

        // Send response to DecrementPercentageRequest
        function sendDecPercentageConfirm() {
            {
                local err = _checkResponse(ALEXA_CMD_DEC_PERC);
                if (null != err) return err;
            }
            _sendOK(ALEXA_CMD_DEC_PERC_RES);
        }

        // Send response to IncrementTargetTemperatureRequest command
        // Parameters:
        //          temp        - current target temperature
        //          mode        - current target mode
        //          prevTemp    - previous target temperature
        //          prevMode    - previous target mode
        function sendIncTempConfirm(temp, mode, prevTemp, prevMode) {
            {
                local err = _checkResponse(ALEXA_CMD_INC_TEMP);
                if (null != err) return err;
            }
            return _sendTempConfirm(ALEXA_CMD_INC_TEMP_RES, temp, mode, prevTemp, prevMode);
        }

        // Send response to DecrementTargetTemperatureRequest command
        // Parameters:
        //          temp        - current target temperature
        //          mode        - current target mode
        //          prevTemp    - previous target temperature
        //          prevMode    - previous target mode
        function sendDecTempConfirm(temp, mode, prevTemp, prevMode) {
            {
                local err = _checkResponse(ALEXA_CMD_DEC_TEMP);
                if (null != err) return err;
            }
            return _sendTempConfirm(ALEXA_CMD_DEC_TEMP_RES, temp, mode, prevTemp, prevMode);
        }

        // Send response to SetTargetTemperatureRequest command
        // Parameters:
        //          temp        - current target temperature
        //          mode        - current target mode
        //          prevTemp    - previous target temperature
        //          prevMode    - previous target mode
        function sendSetTempConfirm(temp, mode, prevTemp, prevMode) {
            {
                local err = _checkResponse(ALEXA_CMD_SET_TEMP);
                if (null != err) return err;
            }
            return _sendTempConfirm(ALEXA_CMD_SET_TEMP_RES, temp, mode, prevTemp, prevMode);
        }

        // Send response to GetTargetTemperatureRequest command
        // Parameters:
        //      temperatureMode - temperature mode set by the device
        //      options - a table with optional values:
        //                  friendlyName - specific name for a temperature mode
        //                  targetTemperature -  target temperature in single-setpoint mode
        //                  coolingTargetTemperature - cooling temperature in dual-setpoint mode
        //                  heatingTargetTemperature - heating temperature in dual-setpoint mode
        function sendGetTempResponse(temperatureMode, options = {}) {
            {
                local err = _checkResponse(ALEXA_CMD_GET_TEMP);
                if (null != err) return err;
            }

            local name     = (ALEXA_FRIENDLY_NAME in options) ? options[ALEXA_FRIENDLY_NAME] : null;
            local temp     = (ALEXA_TEMP_STR      in options) ? options[ALEXA_TEMP_STR]      : null;
            local coolTemp = (ALEXA_COOL_TEMP_STR in options) ? options[ALEXA_COOL_TEMP_STR] : null;
            local heatTemp = (ALEXA_HEAT_TEMP_STR in options) ? options[ALEXA_HEAT_TEMP_STR] : null;

            if ( !_isIn(temperatureMode, _fullHeatModeList)) {
                _log(WRONG_HEAT_MODE);
                return WRONG_HEAT_MODE;
            }

            if (null != temp && (null != coolTemp || null != heatTemp)) {
                _log("Warning: ambiguous dual/single setpoint type");
            }

            if ((null != coolTemp && null == heatTemp) ||
                (null == coolTemp && null != heatTemp) ) {
                _log("Warning: dual setpoint with a single value provided");
            }

            local payload = {};

            {  // sets temperatureMode
                local mode = _createValueTable(temperatureMode);
                payload[ALEXA_TARGET_MODE_STR] <- mode;

                if (null != name) {
                    mode[ALEXA_FRIENDLY_NAME] <- name;
                }
            }

            // sets targetTemperature
            if (null != temp) {
                payload[ALEXA_TEMP_STR] <- _createValueTable(temp);
            }

            if (null != coolTemp) {
                payload[ALEXA_COOL_TEMP_STR] <- _createValueTable(coolTemp);
            }

            if (null != heatTemp) {
                payload[ALEXA_HEAT_TEMP_STR] <- _createValueTable(heatTemp);
            }

            return _sendOK(ALEXA_CMD_GET_TEMP_RES, payload);
        }

        // Send response to GetTemperatureReadingRequest command
        // Parameters:
        //      temp - the temperature reading
        function sendGetTempReadingResponse(temp) {
            {
                local err = _checkResponse(ALEXA_CMD_READ_TEMP);
                if (null != err) return err;
            }

            local payload = {};
            payload[ALEXA_READ_TEMP_STR] <- _createValueTable(temp);
            return _sendOK(ALEXA_CMD_READ_TEMP_RES, payload);
        }

        // Send ValueOutOfRangeError
        // Parameters:
        //      min - lowest supported value
        //      max - highest supported value
        function valueOutOfRangeError(min, max) {
            local payload = {
                "minimumValue" : min,
                "maximumValue" : max
            };
            return _sendAppError(ALEXA_VOR_ERR, payload);
        }

        // Sends UnwillingToSetValueError error
        // Parameters:
        //      code    - error code string.
        //                Must be "ThermostatIsOff". The library doesn't check its value however.
        //      descr   - error description
        function unwillingToSetValueError(code, descr) {
            local errorInfo = {};
            errorInfo[ALEXA_CODE_STR] <- code;
            errorInfo[ALEXA_DESCR_STR] <- descr;
            local payload = {};
            payload[ALEXA_ERR_INFO_STR] <- errorInfo;
            return _sendAppError(ALEXA_USV_ERR, payload);
        }

        // Report UnsupportedTargetSettingError
        function unsupportedTargetSettingError() {
            return _sendAppError(ALEXA_UTS_ERR);
        }

        // Report DriverInternalError
        function driverInternalError() {
            return _sendAppError(ALEXA_DI_ERR);
        }

        // Reports wrong appliance ID error
        function noSuchTargetError() {
            return _sendAppError(ALEXA_NST_ERR);
        }

        // Reports about unsupported operation
        function unsupportedOperationError() {
            return _sendAppError(ALEXA_UO_ERR);
        }

        // Reports about invalid/unsupported parameter
        // Parameter:
        //      invalid parameter name
        function unexpectedInformationReceivedError(invalidParam) {
            return _sendAppError(ALEXA_UIR_ERR, {"faultingParameter" : invalidParam});
        }

        // Returns current  additionalApplianceDetails field of the request
        function getAdditionalDetails() {
            try {
                return _extract(_extract(_payload, ALEXA_APPLIANCE_STR), ALEXA_APP_DETAILS);
            } catch (error) {
                return {};
            }
        }

        // -------------------- PRIVATE METHODS -------------------- //

        // Start response asynchronous way
        function _processAsync() {
            imp.wakeup(0, _process.bindenv(this));
        }

        // Process request synchronously
        function _process() {
            // special case, no details should be extracted
            if (_ns == ALEXA_DISCOVERY_NS) {
                _handleDiscovery();
                return;
            } else if (_ns == ALEXA_SYSTEM_NS) {
                _handleSystem();
                return;
            }

            // convert request string to command string
            switch (_name) {
                case ALEXA_CMD_TURN_ON_REQ:
                    _cmd = ALEXA_CMD_TURN_ON;
                    break;
                case ALEXA_CMD_TURN_OFF_REQ:
                    _cmd = ALEXA_CMD_TURN_OFF;
                    break;
                case ALEXA_CMD_SET_TEMP_REQ:
                    _cmd = ALEXA_CMD_SET_TEMP;
                    break;
                case ALEXA_CMD_GET_TEMP_REQ:
                    _cmd = ALEXA_CMD_GET_TEMP;
                    break;
                case ALEXA_CMD_READ_TEMP_REQ:
                    _cmd = ALEXA_CMD_READ_TEMP;
                    break;
                case ALEXA_CMD_INC_TEMP_REQ:
                    _cmd = ALEXA_CMD_INC_TEMP;
                    break;
                case ALEXA_CMD_DEC_TEMP_REQ:
                    _cmd = ALEXA_CMD_DEC_TEMP;
                    break;
                case ALEXA_CMD_SET_PERC_REQ:
                    _cmd = ALEXA_CMD_SET_PERC;
                    break;
                case ALEXA_CMD_INC_PERC_REQ:
                    _cmd = ALEXA_CMD_INC_PERC;
                    break;
                case ALEXA_CMD_DEC_PERC_REQ:
                    _cmd = ALEXA_CMD_DEC_PERC;
                    break;
                case ALEXA_CMD_SET_LOCK_REQ:
                    _cmd = ALEXA_CMD_SET_LOCK;
                    break;
                case ALEXA_CMD_GET_LOCK_REQ:
                    _cmd = ALEXA_CMD_GET_LOCK;
                    break;
                default:
                    unsupportedOperationError();
                    return;
            }


            try {
                local appInfo = _extract(_payload, ALEXA_APPLIANCE_STR);

                // extract applianceId and additionalApplianceDetails
                _applianceId = _extract(appInfo, ALEXA_APP_ID);

            } catch (error) {
                unexpectedInformationReceivedError(error);
                return;
            }

            if (!(_applianceId in _appliances)) {
                noSuchTargetError();
                return;
            }

            {
                local app = _appliances[_applianceId];

                // check if device declared the command support
                if (null == app[ALEXA_APP_ACTIONS].find(_cmd)) {
                    unsupportedOperationError();
                    return;
                }

                // cache callback
                _cb = app.callback;
            }

            switch (_ns) {
                case ALEXA_CONTROL_NS:
                    _handleControl();
                    break;
                case  ALEXA_QUERY_NS:
                    _scheduleCallback();
                    break;
                default:
                    unexpectedInformationReceivedError(ALEXA_NAMESPACE_STR);
                    break;
            }
        }

        // Send lock state
        // Parameters:
        //      state - current lock state (LOCKED, UNLOCKED)
        function _sendLockStateResponse(name, state) {
            if (state != ALEXA_LOCKED_STR &&
                state != ALEXA_UNLOCKED_STR) {
                local err = "Invalid lock state: " + state;
                log(err);
                return err;
            }

            local payload = {};
            payload[ALEXA_LOCK_STATE_STR] <- state;

            return _sendOK(name, payload);
        }


        // Format and send response common for temperature set, increment and decrement command
        // Parameters:
        //          name        - response name
        //          temp        - current target temperature
        //          mode        - current target mode
        //          prevTemp    - previous target temperature
        //          prevMode    - previous target mode
        function _sendTempConfirm(name, temp, mode, prevTemp, prevMode) {
            if (!_isIn(mode, _shortHeatModeList) || !_isIn(prevMode, _shortHeatModeList)) {
                _log(WRONG_HEAT_MODE);
                return;
            };

            local state = {};
            state[ALEXA_TEMP_STR] <- _createValueTable(temp);
            state[ALEXA_TARGET_MODE_STR] <- _createValueTable(mode);

            {
                local prevState = {};
                prevState[ALEXA_TEMP_STR] <- _createValueTable(prevTemp);
                prevState[ALEXA_MODE_STR] <- _createValueTable(prevMode);
                state[ALEXA_PREV_STATE_STR] <- prevState;
            }

            _sendOK(name, state);

            return null;
        }


        // Checks if a list contains the object specified
        // Parameters:
        //          value       - object to to be checked
        //          list        - list to search in for the value
        // Return:
        //        True if value is present in the list, False othersise
        function _isIn(value, list) {
            return (list.find(value) != null);
        }

        // Checks if application calls right response function.
        function _checkResponse(response) {
            if (_cmd != response) {
                local err = "Application sends unexpected response: " + response;
                _log(err);
                return err;
            }
            return null;
        }

        // Creates table with single 'value' field
        // Parameters:
        //      value -  value to be assigned to the field
        // Return:
        //      created table
        function _createValueTable(value) {
            local tab = {};
            tab[ALEXA_VALUE_STR] <- value;
            return tab;
        }

        // Checks the table for the field presence
        // Parameters:
        //            table - lookup table
        //            field - table key
        // Throw:    exception if the field is absent,
        // Returns:  field payload
        function _extract(table, field) {
            if (field in table) {
                return table[field];
            } else {
                throw field;
            }
        }


        // Response to Discovery request
        function _handleDiscovery() {
            local appliances = [];

            foreach (key, value in _appliances) {
                appliances.push(value);
            }

            local payloads = {};
            payloads[ALEXA_DISCOVERED_APP] <- appliances;

            _sendOK(ALEXA_DISCOVERY_RES_NAME, payloads);
        }

        // Response to System request
        function _handleSystem() {
            // so far only HealCheck
            local payload = {
                "description": "The system is currently healthy",
                "isHealthy": true
            };
            _sendOK(ALEXA_HEALTH_RES, payload);
        }

        // Response to Control request
        function _handleControl() {
            switch (_cmd) {
                case  ALEXA_CMD_SET_TEMP:
                    try {
                        _param = _extract(_extract(_payload, ALEXA_TEMP_STR), ALEXA_VALUE_STR);
                    } catch (error) {
                        unexpectedInformationReceivedError(error);
                        return;
                    }
                    break;
                case ALEXA_CMD_INC_TEMP:
                case ALEXA_CMD_DEC_TEMP:
                    try {
                        _param = _extract(_extract(_payload, ALEXA_DELTA_TEMP_STR), ALEXA_VALUE_STR);
                    } catch (error) {
                        unexpectedInformationReceivedError(error);
                        return;
                    }
                    break;
                case ALEXA_CMD_SET_PERC:
                    try {
                        _param = _extract(_extract(_payload, ALEXA_PERC_STATE_STR), ALEXA_VALUE_STR);
                    } catch (error) {
                        unexpectedInformationReceivedError(error);
                        return;
                    }
                    break;
                case ALEXA_CMD_INC_PERC:
                case ALEXA_CMD_DEC_PERC:
                    try {
                        _param = _extract(_extract(_payload, ALEXA_PERC_DELTA_STR), ALEXA_VALUE_STR);
                    } catch (error) {
                        unexpectedInformationReceivedError(error);
                        return;
                    }
                    break;
                case ALEXA_CMD_SET_LOCK:
                    try {
                        _param = _extract(_payload, ALEXA_LOCK_STATE_STR);
                        if (_param != ALEXA_LOCKED_STR) {
                            _log("Alexa request unexpected lock state: " + _param);
                        }
                    } catch (error) {
                        unexpectedInformationReceivedError(error);
                        return;
                    }
                    break;
                default:
                    break;
            }
            _scheduleCallback();
        }

        // Schedules execution of application callback.
        function _scheduleCallback() {
            _log("Executing " + _cmd + " for " + _applianceId);

            imp.wakeup(0, _executeCallback.bindenv(this));
        }

        // Executes application callback.
        // All arguments must be prepared and cached at this time.
        function _executeCallback() {
            try {
                _cb(this, _applianceId, _cmd, _param);
            } catch (error) {
                _log("Callback execution error: " + error);
            }
        }

        // Sends Control operation error status
        // Parameters:
        //      name - operation name
        //      payload - optional details
        function _sendAppError(name, payload = {}) {
            return _sendResponse(400, name, payload, ALEXA_CONTROL_NS);
        }

        // Send success status
        // Parameters:
        //      name - operation name
        //      payload - optional details
        function _sendOK(name, payload = {}) {
            return _sendResponse(200, name, payload, _ns);
        }

        // Construct and send response to Alexa
        // Parameters:
        //      errorCode - HTTP error code
        //      name      - operation name
        //      payload   - operation details
        //      ns        - operation namespace
        function _sendResponse(errorCode, name, payload, ns) {

            local headers = {};

            headers[ALEXA_NAME_STR]        <- name;
            headers[ALEXA_MESS_ID_STR]     <- _messId;
            headers[ALEXA_NAMESPACE_STR]   <- ns;
            headers[ALEXA_PAYLOAD_VER_STR] <- ALEXA_PAYLOAD_VER;

            local result = {};

            result[ALEXA_HEADER_STR]  <- headers;
            result[ALEXA_PAYLOAD_STR] <- payload;

            local err = null;
            try {
                _http.header("Content-Type", "application/json");
                _http.send(errorCode, http.jsonencode(result));
                _log("Answer was sent:" + http.jsonencode(result));
            } catch (error) {
                err = "Answer was no sent:" + error;
                _log(err);
            }

            return err;
        }

        // Implements debug logging. Sends the log message
        // to the console output if "debug" configuration
        // flag is set
        //
        // Parameters:
        //                      Message to print
        //
        // Returns:             Nothing
        function _log(message) {
            if (_debug) {
                server.log("[AlexaSkill] " + message);
            }
        }
    }

}
