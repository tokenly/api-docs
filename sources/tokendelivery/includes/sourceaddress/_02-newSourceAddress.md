## Request a new source address

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://deliver.tokenly.com/api/v1/source\n{\"type\": \"2:2\", \"label\": \"Game Fountain\", \"callback_url\": \"http://myapp.com/joinedhook\", \"webhook\": \"http://myapp.com/transactionhook\"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"type": "2:2", "label": "Game Fountain", "callback_url": "http://myapp.com/joinedhook", "webhook": "http://myapp.com/transactionhook"}' \
    https://deliver.tokenly.com/api/v1/source
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$label         = "Game Fountain";
$type          = "2:2";
$webhook       = "http://myapp.com/transactionhook";
$join_callback = "http://myapp.com/joinedhook";

$response = $client->newSourceAddress($label, $type, $webhook, $join_callback);

```



> The above command returns data structured like this:

```json
{
    "id": "1ce9fa7a-5b86-4a88-8aa9-8a17105ad49a",
    "joinCode": "Fenq762M2AHEBYUbnZGUweKxRocmqszNNZwzAWnj3ETR9Up3ThUPJqQ5vBq3f7eA2RL7obxoC6L",
    "joinCallback": "http://my-app.com/joinedhook",
    "webhook": "http://my-app.com/transactionhook",
    "address": null,
    "complete": false,
    "label": "Game Fountain",
    "type": "2:2",
    "autoFulfill": true,
    "active": true,
    "createdAt": "2016-10-21T14:57:37+0000",
    "updatedAt": "2016-10-21T14:57:37+0000"
}
```

When a new source address is requested, a `join_code` is provided which you (the client) can enter in to your
Tokenly Pockets wallet to join as a shared wallet cosigner. If using ```type='2:2'```, all deliveries must be manually
approved via the wallet. If using 2 of 3 types or greater, full automation can be achived via automated cosigner agents
which validate, accept and sign transaction proposals.



### HTTP Request

`POST https://deliver.tokenly.com/api/v1/source`


### Body Parameters

Parameter           | Description
------------------- | -----------
type                | (string, Optional)  Either `2:2` or `2:3`. Default is 2:3
label               | (string, Optional)  label for reference purposes
join_callback       | (string, Optional)  callback URL if using the join_code method. Notifies the desired endpoint of the generated address when the wallet is joined
webhook             | (string, Optional)  webhook URL to notify of sends and receives related to this address.  This overrides the API user level `default_webhook`
auto_fulfil         | (boolean, Optional) Causes deliveries from this source address to be marked ready and fulfilled automatically when delivery_date is triggered. Default is true.
active              | (boolean, Optional) Start this source address off as active or inactive (stops processing deliveries)
desired_utxo_primes | (integer, Optional) Choose how many spare UTXOs you want to keep to facilitate smooth transactions

