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


#require "AlexaSmartHomeSkill.agent.nut:1.0.0"
#require "messagemanager.class.nut:1.0.1"

local smartToasterInfo = {
    "actions": [
        "turnOn",
        "turnOff"
    ],
    "additionalApplianceDetails": {
        "extraDetail1": "pin1",
    },
    "friendlyDescription": "My super smart toaster",
    "friendlyName": "Toaster",
    "manufacturerName": "Mars Industrial",
    "modelName": "Smart Toaster 1.0",
    "version": "1.0"
};

local mm = MessageManager();
local mmHandlers = {
    "onReply" :
        function(msg, response) {
            local action  = msg.metadata.action;
            local session = msg.metadata.session;

            local responseCallback = action == "turnOn"
                ? session.sendTurnOnConfirm.bindenv(session)
                : session.sendTurnOffConfirm.bindenv(session);

            local err;
            if ("OK" == response) {
                err = responseCallback();
            } else {
                err = session.driverInternalError();
            }

            if (null != err) {
                server.error("Unable to send response: " + err);
            }
        }.bindenv(this)
}

// Callback executed upon Alexa request
local actionCallback = function(session, applianceId, action, param) {
    server.log("Got action " + action + " for " + applianceId);
    mm.send("Control", action, mmHandlers, null, {
            "action" : action,
            "session": session
        });
}.bindenv(this);


local alexa = AlexaSmartHomeSkill();
alexa.registerAppliance("SmartToaster", smartToasterInfo, actionCallback);