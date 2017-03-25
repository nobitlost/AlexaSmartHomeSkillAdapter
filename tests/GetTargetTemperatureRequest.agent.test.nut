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


const APP_ID = "Toaster";
local APP_CMD = ALEXA_CMD_GET_TEMP;
local TEMP_MODE = ALEXA_COOL_STR;
const TEMP_DESCR = "blabla";

const TEMP1     = 11;
const TEMP21    = 8;
const TEMP22    = 25;

local appInfo = {
    "actions": [
        APP_CMD
    ],
    "friendlyDescription": "My super smart toaster",
    "friendlyName": " Device",
    "manufacturerName": "Mars Industrial",
    "modelName": "Smart Toaster 1.0",
    "version": "1.0"
};

local alexaRequest = {
        "header": {
        "payloadVersion": "2",
        "namespace": ALEXA_QUERY_NS,
        "name": ALEXA_CMD_GET_TEMP_REQ,
        "messageId": 1234567
        },
        "payload": {
        "accessToken": "someaccesstoken",
        "appliance": {
            "applianceId": APP_ID,
            "additionalApplianceDetails": {}
        }
        }
}

local alexaResponse = {
        "header": {
        "payloadVersion": "2",
        "namespace": ALEXA_QUERY_NS,
        "name": ALEXA_CMD_GET_TEMP_RES,
        "messageId": 1234567
        },
        "payload": {
            "targetTemperature": {
                "value": TEMP1
            },
            "temperatureMode": {
                "value": TEMP_MODE,
                "friendlyName": TEMP_DESCR
            }
        }
}


local onFailure = null;
local onSuccess = null;

class GetTargetTemperatureTestCase extends ImpTestCase {

    _alexa = null;
    _http = null;


    function setUp() {

        _http = HttpLoopback();

        _alexa = AlexaSmartHomeSkill();

        _http.onrequest(_alexa._httpRequestHandler.bindenv(_alexa));

        local err = _alexa.registerAppliance(APP_ID, appInfo, alexaReqCb.bindenv(this));
        assertTrue(null == err, "Appliance registration failure:" + err);
    }

    function runCommandAsynchronously() {
       return Promise(function(success, failure) {
            onSuccess = success;
            onFailure = failure;
            _http.sendCmd();
        }.bindenv(this));
    }

    function alexaReqCb(session, appId,  cmd, param) {
        local details = session.getAdditionalDetails();

        if ( !(session instanceof AlexaSmartHomeSkill.Session) ) {
            onFailure("session is not instanceof AlexaSmartHomeSkill.Session");
        } else if (appId != APP_ID) {
            onFailure("applianceId is not correct");
        } else if (null == details || details.len() != 0) {
            onFailure("unexpected additional details");
        } else if (cmd != APP_CMD) {
            onFailure("Invalid command:  " + cmd + " Excpected: " + APP_CMD);
        } else if (param != null) {
            onFailure("unexpected command parameter " + param);
        } else {
            local data = {
                "friendlyName": TEMP_DESCR,
                "targetTemperature" : TEMP1,
                "coolingTargetTemperature" : TEMP21,
                "heatingTargetTemperature" : TEMP22
            };

            local err = session.sendGetTempResponse(TEMP_MODE, data);
            if (null != err) onFailure("Response send error:" + err);
        }
    }
}

class HttpLoopback {
    _cb = null;

    function onrequest(cb) {
        _cb = cb;
    }

    function sendCmd() {
        local request = {
            "method": "POST",
            "body": http.jsonencode(alexaRequest)
        }

        _cb(request, this);
    }

    function header(key, value) {
        // not important this time
    }

    function send(httpCode, body) {
        if (httpCode != 200) {
            onFailure("Wrong HTTP code: " + httpCode);
            return;
        }

        local err = _compareTables(alexaResponse, http.jsondecode(body));
        if (null != err) {
            onFailure("Invalid response body: " + err);
            return;
        }

        onSuccess();
    }

    function _compareTables(sample, testee) {

        if (typeof testee != "table") return http.jsonencode(testee);

        foreach ( key, value in sample) {
            if (key in testee) {
                local tval = testee[key];

                if( typeof value == "table") {

                    local err =_compareTables(value, tval);
                    if (null != err) return err;

                } else if(typeof value == "array") {

                    local err =_compareArrays(value, tval);
                    if (null != err) return err;

                } else if(value != tval) return tval;
            } else {
                return "Not found mandatory key " + key;
            }
        }

        return null;
    }

    function _compareArrays(sample, testee) {

        if (typeof testee != "array") return http.jsonencode(testee);

        foreach (count, value in sample) {
            local index = testee.find(value);

            if (null != index) {
               local  tval = testee[index];

                if( typeof value == "table") {

                    local err =_compareTables(value, tval);
                    if (null != err) return err;

                } else if(typeof value == "array") {

                    local err = _compareArrays(value, tval);
                    if (null != err) return err;

                } else if(value != tval) return tval;
            } else {
                return "Not found mandatory value " + value;
            }
        }

        return null;
    }
}
