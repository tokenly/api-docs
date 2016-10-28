## Distribution Webhook Object

When using the ```webhook``` field in your distributions, the endpoint provided will be queried
during each stage of the distribution process, and a final time on completion.

Example webhook payload data:

```
{
  "id": "faacb1a4-86e5-45d4-ae66-29ba7f38543b",
  "time": "2016-10-28T18:43:16Z",
  "attempt": 1,
  "apiToken": "Tfje2CDQNzyckWKM",
  "signature": "0f6ecaecaa304319cdbeace4dc34d11a1a98791c8aaa34914b6a3f0f9d333964",
  "payload": "{\"event\":\"update\",\"notificationId\":\"faacb1a4-86e5-45d4-ae66-29ba7f38543b\",\"distributionId\":\"760a99d5-2a3b-4fa7-88ab-5ad1f31ce514\",\"label\":\"test distro webhooks\",\"createdAt\":{\"date\":\"2016-10-28 18:41:59\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"updatedAt\":{\"date\":\"2016-10-28 18:43:16\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"stage\":1,\"stageMessage\":\"receiving\",\"complete\":0,\"depositAddress\":\"1HrvqVSJMfZJ1WU2JZfpYFeJE6kJcFQaMu\",\"network\":\"btc\",\"asset\":\"LTBCOIN\",\"assetTotal\":300000000,\"feeTotal\":82220,\"assetReceived\":0,\"feeReceived\":0,\"hold\":0,\"use_fuel\":1,\"webhook\":\"http:\\\/\\\/earnfreebitcoins.com\\\/test-bitsplit-webhook.php\",\"assetTotalFloat\":3,\"feeTotalFloat\":0.0008222,\"assetReceivedFloat\":0,\"feeReceivedFloat\":0,\"stageName\":\"CollectTokens\"}"
}

```

**Notification variables**

Variable      | Type       | Description
------------- | ---------  | ------------
**id**        |  string    | Unique ID for this notification
**time**      |  timestamp | Time received
**attempt**   |  integer   | How many times this notification has been attempted
**apiToken**  |  string    | API client ID that this belongs to
**signature** |  string    | HMAC signature of request using API client secret
**payload**   |  string    | JSON encoded string with the actual payload data


**Payload variables**

Variable               | Type       | Description
-----------------------| ---------  | ------------
**event**              |  string    | Type of notification, either ```complete``` or ```update```
**notificationId*      |  string    | Unique ID of this webhook notification
**distributionId**     |  string    | Unique ID of this distribution
**label**              |  string    | Distribution label
**createdAt**          |  timestamp | Date distribution created
**updatedAt**          |  timestamp | Time distribution last updated
**stage**              |  integer   | Processing stage ID
**stageMessage**       |  string    | Status message of current stage, e.g 'receiving'
**depositAddress**     |  string    | Distribution bitcoin address
**network**            |  string    | Cryptocurrency network (btc)
**asset**              |  string    | Token to distribute
**assetTotal**         |  integer   | Total amount of tokens to distribute, in satoshis
**feeTotal**           |  integer   | Total BTC fuel cost, in satoshis
**assetReceived**      |  integer   | Tokens received, in satoshis
**feeReceived**        |  integer   | Fee received, in satoshis
**hold**               |  boolean   | True if distribution paused / on hold
**use_fuel**           |  boolean   | True if automatically sourcing fuel from account fuel address
**webhook**            |  string    | Distribution webhook field
**assetTotalFloat**    |  float     | Human readable total token quantity
**feeTotalFloat**      |  float     | Human readable total fuel cost
**assetReceivedFloat** |  float     | Human readable tokens received
**feeReceivedFloat**   |  float     | Human readable fuel received
**stageName**          |  string    | Alias of the current processing stage, e.g 'CollectTokens'


