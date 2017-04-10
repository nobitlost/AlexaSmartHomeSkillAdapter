# Demo Notes

**Important Note**:
The provided example is for illustration purposes. It can be used as a starting point for use-case specific integrations. 

## 1. Set Up An Electric Imp Model

1. Create a new Model in the [Electric Imp IDE](https://ide.electricimp.com), and copy and paste the device and agent code from [device.nut](device.nut) and [agent.nut](agent.nut) files, respectively.
2. The remaining steps require your device's agent URL to configure AWS Lambda. To locate it:
    1. In the IDE, switch to the device list
    2. Select the device that will run the demo
    3. Press its setting (gearwheel) icon
    4. Copy its agent URL

## 2. Set Up Amazon Services

### Prerequisites

An Amazon Web Services (AWS) account is required to run AWS Lambda-based Smart Home Adapter. The account must be verified, ie. billing information entered and accepted. Account verification may take up to 12 hours, and no service is available prior to verification.

To interact with Alexa services the user need a device like the Amazon Echo. The [EchoSim](https://echosim.io/) emulator is good for testing too. Both device or emulator have to be available to the Alexa account that will be used for development.

### Create a new Skill

The steps below will guide you through the creation of a new Smart Home Skill. These steps will guide you through the AWS Lambda and OAuth configuations for this demo example. For more general instuctions on creating a new Smart Home Skill, you can visit [Amazon's developer website](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/steps-to-create-a-smart-home-skill).

#### Register as an Amazon Developer and create a Skill

1. Open the Amazon [Developer Portal](https://developer.amazon.com/home.html) in a browser and log in.
2. Navigate to the [Alexa section](https://developer.amazon.com/edw/home.html#/) by clicking ‘Apps & Services’ and then clicking ‘Alexa’ in the top navigation bar.
3. In the Alexa Skills Kit box, click ‘Get Started’.
4. Click the ‘Add a New Skill’ button.
5. On the ‘Skill Information’ page, select ‘Smart Home Skill API’, and enter the Name for your skill.
    Note that your Skill’s name must not indicate that its functionality is limited. For example, you should not use “basic”, “reduced” or “simple” in the name of your Skill.
6. Select the language for your Skill. You can select additional languages later.
7. Click ‘Save’ then copy the ‘Application ID’ for the Skill to the clipboard.

![Application Id](images/applicationid.png)

#### Create a Lambda Function

1. In a new browser tab, log into your [AWS account](https://aws.amazon.com/console/).
2. Lambda functions are only available in limited regions. In the top right navigation bar, select the ‘N.Virginia’ for English (US) Skills or the ‘EU (Ireland)’ region for English (UK) and German Skills. Providing your Lambda function in the correct region prevents latency issues.
3. Click the ‘Services’ tab in the upper left navigation, and on the AWS Console, select ‘Lambda’ (under ‘Compute’).
4. Click ‘Create a Lambda function’.
5. On the ‘Select blueprint’ page, type “home” in the filter box. Select the ‘alexa-smart-home-skill-adapter’ option.
6. On the ‘Configure triggers’ page, the Alexa Smart Home trigger will already be configured. Add the Application ID from the developer portal.
7. Check ‘Enable trigger’. This enables the Amazon Alexa service to call your Lambda function. If you prefer, you can enable the trigger later, once you have completed your implementation and tested it in the Lambda portal.
8. Click ‘Next’.
9. On ‘Step 3: Configure function’, enter the following:
    * ‘Name’: A name for your Lambda function. This name is appears in the AWS console and is also returned by the
    AWS command-line interface (CLI) [ListFunctions](http://docs.aws.amazon.com/lambda/latest/dg/API_ListFunctions.html) API. It should be unique across your Lambda functions.
    * ‘Description’: Optionally provide a description.
    * ‘Runtime’: Select ‘Node.js 4.3’.
10. For ‘Lambda function code’, make sure ‘Edit code inline’ is selected.
11. The Lambda script is a request forwarder and requires the URL of a server that implements Smart Home Skill API. The  AlexaSmartHomeSkill library turns the agent into a server, so we will use the Lambda script to forward requests to the agent URL. Copy and paste the following code into the code editor: [AwsLambda/passthrough.js](../AwsLambda/passthrough.js). Then in the ‘Enviornmental variables’ section, under the code window, enter `EI_AGENT_URL` as the key and your agent URL as the value:
![Agent URL](./images/agent-url.png)
12. The ‘Handler’ should be set to “index.handler”.
13. For ‘Role’, select a role with “lambda_basic_execution” policy attached. To create a new role, see the
[Create the Execution Role](http://docs.aws.amazon.com/lambda/latest/dg/with-s3-example-create-iam-role.html) topic in the Lambda documentation.
14. Leave the ‘Advanced settings’ set to the defaults and click ‘Next’.
15. Click ‘Create function’.
16. On the summary page, copy the Amazon Resource Name (ARN) for your Lambda function, which is found in the upper
right corner. You will use this value when you configure the Smart Home Skill in the developer
portal. The ARN should be similar to the following: `ARN - arn:aws:lambda:us-east-1:025463977285:function:myAdapter`.
17. If you want to perform a quick test of the Lambda function, you can click on ‘Test’, and for the sample event template, leave the default “Hello World”. Replace the entire contents of the text editor with the following code [AwsLambda/test.js](../AwsLambda/test.js). When the test runs its status can be checked at:
    * AWS CloudWatch at `/aws/lambda/<lambda name>`
    * The Electric Imp IDE’s log window.
18. If you did not do so in step 7, return to the ‘Triggers’ tab and enable your trigger.

#### Finish registering your Skill in the Developer Portal

1. Navigate back to your Skill in the [Developer Portal](https://developer.amazon.com/home.html). If you closed this tab you will need to log in and navigate to the Alexa section by clicking ‘Apps & Services’ and then clicking ‘Alexa’ in the top navigation bar. Select your Skill from the displayed list. This should bring you back to the ‘Skill Information’ page, where we left off in the **Register as an Amazon Developer and Create a Skill** section, above.
2. On the ‘Skill Information’ page, click ‘Next’.
3. On the ‘Interaction Model’ page, click ‘Next’. The interaction model, which is what a user can say to invoke the Smart Home Skill API, is predefined so does not need to be specified. For details of the smart home voice interaction model,
see the utterances listed with each reference entry in the [Smart Home Skill API Reference](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference).
4. On the ‘Configuration’ page, under the ‘Endpoint’ heading, click the checkbox to select the geographical region closest to your target customers, then copy in the ARN number from the Lambda function you created.
5. To set up account linking authortizaion, you need to create a security profile. The steps below will guide you through this. Click [here](https://developer.amazon.com/blogs/post/Tx3CX1ETRZZ2NPC/Alexa-Account-Linking-5-Steps-to-Seamlessly-Link-Your-Alexa-Skill-with-Login-wit) for more information about Alexa Account Linking.
    1. Copy the redirect URLs from the ‘Skill Configuration’ page.
    2. In a new tab open up [‘Apps & Services’ and then click ‘Login with Amazon’](https://developer.amazon.com/lwa/sp/overview.html).
    3. Click ‘Create a New Security Profile’.
    4. Fill out the Security Profile Name, Description and Consent Privacy Notice URL then click ‘Save’.
    5. Click on the ‘Manage’ icon in the ‘Web Settings’ menu item, then click ‘Edit’.
    6. Use `https://amazon.com` for ‘Allowed Origins’.
    7. In the ‘Allowed Return URLs’ section, enter the Redirect URLs from step 5-1, above.
    8. Click ‘Save’.
    9. Switch back to the ‘General’ tab and copy the Client ID and the Client Secret.
    9. Navigate back to the ‘Smart Home Skill Configuration’ page, locate the ‘Account Linking’ section and fill it in as follows:
        * ‘Authorization URL’: `https://www.amazon.com/ap/oa`
        * ‘Client Id’ with the Client ID from the Security Pofile.
        * ‘Scope’: `profile:user_id`.
        * ‘Access Token URI’ with `https://api.amazon.com/auth/o2/token`.
        * ‘Client Secret’ with the Client Secret from the Security Pofile.
6. Press the ‘Next’ button and ensure the ‘Configuration’ tab is marked as green.
7. On the ‘Test’ page, set the ‘Show this skill in the Alexa App’ toggle to ‘Yes’.

## Use Your New Skill with Your Alexa Account

The newly created **Alexa Skill** should now be available via the Alexa web configurator:

1. Login to [alexa.amazon.com](https://alexa.amazon.com) with your developer account.
2. Go to the ‘Skills’ section and click on ‘Your Skills’ in the upper-right corner of the page.
3. Select the Skill and push the ‘Enable’ button.
4. The imp-enabled device that implements the Skill is now discoverable on the ‘Smart Home’ tab.
5. Verify its functionality with the voice command: `"Alexa, discover my devices"`
6. If everything is OK, ask Alexa to turn your device on or off: `"Alexa, turn on the smart toaster"`
