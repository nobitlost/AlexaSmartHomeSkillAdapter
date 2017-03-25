# Demo Installation Notes

## Setup Electric Imp project

1. Create new Model at Electric Imp  IDE and copy-paste device/agent code from [device.nut](device.nut) and [agent.nut](agent.nut) correspondingly
1. Next steps require agent URL to configure AWS Lambda. To find it out:
    1. Switch to device list
    2. Select device intended to run the model
    3. Press its setting button
    4. Copy **Agent URL**

## Setup Amazon services

### Prerequisites

Amazon Web Services account is required to run AWS Lambda-based Smart Home Adapter.  The account must be verified, i.e. billing information is entered and accepted.  Account verification may take up to 12 hours.  No service is available prior to this step completion.
To interact with Alexa services the user need devices like Amazon Echo.  "https://echosim.io/" emulator is good for testing as well. Both device or emulator have to be available for Alexa with the account that will be used for development.

### Create new Skill

Most of the details of how to create new Smart Home Skill are described at
[Steps to Create a Smart Home Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/steps-to-create-a-smart-home-skill). 
However, there are a few changes to the process that need to be applied regarding the OAuth and AWS Lambda configurations.

#### Register as an Amazon Developer and Create a Skill

1. Open the Amazon [Developer Portal](https://developer.amazon.com/home.html) in a browser and log in.
2. Navigate to the [Alexa section](https://developer.amazon.com/edw/home.html#/) 
by clicking **Apps & Services** and then clicking **Alexa** in the top navigation.
3. In the Alexa Skills Kit box, click **Get Started**.
4. Click the **Add a New Skill** button.
5. On the **Skill Information** page, select **Smart Home Skill API**, and enter the Name for your skill. 
Note that your skill’s name must not indicate that it’s functionality is limited. 
For example, you should not use “basic”, “reduced” or “simple” in the name of your skill.
6. Select the language for your skill. You can select additional languages later.
7. Click **Save**. and copy the **Application Id** for the skill to the clipboard.

![Application Id](images/applicationid.png)

#### Create a Lambda Function

1. On the AWS Console, under **Compute**, select **Lambda**.
2. Make sure you’ve selected the **N.Virginia** for English (US) skills or the **EU (Ireland)** region 
for English (UK) and German skills. The region is displayed in the upper right corner. Providing 
your Lambda function in the correct region prevents latency issues.
3. Click **Create a Lambda function**.
4. On the **Select blueprint page**, type **home** in the filter box. Select the **alexa-smart-home-skill-adapter**.
5. On the **Configure triggers page**, the **Alexa Smart Home** trigger will already be configured. 
Add the **Application Id** from the developer portal.
6. Optionally check **Enable trigger**. This enables the Amazon Alexa service to call your Lambda function. 
It’s recommended that you enable the trigger later, once you have completed your implementation 
and testing in the Lambda portal.
7. Click **Next**.
8. On **Step 3: Configure function**, enter the following:
    * **Name**: A name for your Lambda function. This name is appears in the AWS console and is also returned by the 
    AWS command-line interface (CLI) [ListFunctions](http://docs.aws.amazon.com/lambda/latest/dg/API_ListFunctions.html) API. 
    It should be unique across your Lambda functions.
    * **Description**: Optionally provide a description.
    * **Runtime**: Select **Node.js 4.3**.
9. For **Lambda function code**, make sure **Edit code inline** is selected.
10. Copy and paste the following code into the code editor: [AwsLambda/passthrough.js](../AwsLambda/passthrough.js)
The Lambda script is nothing more but just request forwarder and requires URL of a server that implements 
Smart Home Skill API. In our case the **Agent URL** needs to be provided in the `EI_AGENT_URL` environment variable:
![Agent URL](./images/agent-url.png)
11. On the **Configuration** for **Handler**, **index.handler** in this case.
12. For **Role**, select a role with lambda_basic_execution policy attached. 
To create a new role see, 
[Create the Execution Role](http://docs.aws.amazon.com/lambda/latest/dg/with-s3-example-create-iam-role.html) 
topic in the Lambda documentation
13. Leave the **Advanced settings** set to the defaults and click **Next**.
14. Click **Create function**.
15. On the summary page, copy the **Amazon Resource Name (ARN)** for your Lambda function, which is found in the upper 
right corner, into your clipboard. You will use this value when you configure the smart home skill in the developer 
portal. The ARN should be similar to the following:  **ARN - arn:aws:lambda:us-east-1:025463977285:function:myAdapter**
16. If you want to perform a quick test of the Lambda function, you can click on Test and for the 
Sample event template, leave the default Hello World. Replace the entire contents of the text editor with the 
following code [AwsLambda/test.js](../AwsLambda/test.js). When the test runs its status can be checked at:
    * **AWS CloudWatch** -> `/aws/lambda/<lambda name>`
    * **Agent console** in the Electric Imp Web IDE
    
#### Finish Registering Your Skill in the Developer Portal

1. Navigate back to your skill in the Developer Portal. To do this, log in, and navigate to the Alexa section by 
clicking **Apps & Services** and then clicking **Alexa** in the top navigation. Select your skill from the displayed list.
2. You can click past the Interaction model tab. The interaction model, which is what a user can say to invoke the Smart 
Home Skill API, is predefined so does not need to be specified. For details of the smart home voice interaction model, 
see the utterances listed with each reference entry in the 
[Smart Home Skill API Reference](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/smart-home-skill-api-reference).
3. On the **Configuration** page, select the language tab for your skill, and in the **Endpoint** field, copy in the 
ARN number from the Lambda function you created.
4. Also copy **Redirect URLs** URLs from the Skill configuration page.
5. Amazon Skill setup document might be confusing on the OAuth 2.0 configuration. 
It provides very few notes about how to use the **Login With Amazon (LWA)** as an OAuth provider. 
Here are a little bit more detailed steps:
   1. Create a new security profile by going to **APPS & SERVICES** and then clicking **Security Profiles** section
    at **Amazon Developer Console**.
   2. In the **Web Settings** tab and add "Return URLs" with URLs from step 4. 
   3. Use `https://amazon.com` for **Allowed Origins**
   4. Remember **Client ID** and **Client Secret** from the main page
   5. Go back to the *Smart Home Skill* configuration page for the newly created skill
   6. Use `https://api.amazon.com/auth/o2/token` for **Access Token URI** field and 
   `https://www.amazon.com/ap/oa` for **Authorization URL**
   7. Paste previously gathered "Client ID" and "Client Secret" at corresponding fields
6. Press "Next" button and ensure "Configuration" tab is marked as green
7. Check "Yes" against " Show this skill in the Alexa App" at "Test" tab

## Use new Skill with your Alexa Account

Now the newly created **Alexa Skill** should be available at Alexa web configurator:

1. Login at [alexa.amazon.com](https://alexa.amazon.com) with the developer account
2. Goto **Skills** section and click on **Your Skills** button at upper-right corner of the page
3. Select the Skill and push the **Enable** button
4. Electric Imp powered device that implements the Skill is now discoverable at **Smart Home** tab
5. Verify it's functionality with the voice command: `"Alexa, discover my devices"`
6. If everything is OK, ask Alexa to turn your device on or off: `"Alexa, turn on the smart toaster"`

## License

AlexaSmartHomeSkill library is licensed under the [MIT License](../LICENSE).

