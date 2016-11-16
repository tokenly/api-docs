## Update an existing source address

```shell
SOURCE_ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "PATCH\nhttps://deliver.tokenly.com/api/v1/source/${SOURCE_ADDRESS_UUID}\n{\"label\": \"Game River\", \"join_callback\": \"http://my-app.com/updated-joined-hook\"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X PATCH \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"label": "Game River", "join_callback": "http://my-app.com/updated-joined-hook"}' \
    https://deliver.tokenly.com/api/v1/source/$SOURCE_ADDRESS_UUID
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$uuid = "1ce9fa7a-5b86-4a88-8aa9-8a17105ad49a";
$data = [
    'label'         => 'Game River',
    'join_callback' => 'http://my-app.com/updated-joined-hook',
];

$response = $client->updateSourceAddress($uuid, $data);

```


> The above command returns data structured like this:

```json
{
    "id": "1ce9fa7a-5b86-4a88-8aa9-8a17105ad49a",
    "joinCode": "Fenq762M2AHEBYUbnZGUweKxRocmqszNNZwzAWnj3ETR9Up3ThUPJqQ5vBq3f7eA2RL7obxoC6L",
    "joinCallback": "http://my-app.com/updated-joined-hook",
    "webhook": "http://my-app.com/transactionhook",
    "address": "3AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j",
    "complete": false,
    "label": "Game River",
    "type": "2:2",
    "autoFulfill": true,
    "active": true,
    "createdAt": "2016-10-21T14:57:37+0000",
    "updatedAt": "2016-10-21T14:57:37+0000",
    "desiredUtxoPrimes": 12,
    "balances": [],
    "availableBalances": [],
    "pendingDeliveries": []
}
```

Update an existing source address.  Some fields are allowed to be changed.


### HTTP Request

`PATCH https://deliver.tokenly.com/api/v1/source/{addressId}`


### URL Parameters

Parameter       | Description
---------       | -----------
addressId       | The UUID of the source address.  This is not the bitcoin address.

### Body Parameters

Parameter           | Description
------------------- | -----------
label               | (string, Optional)  label for reference purposes
join_callback       | (string, Optional)  callback URL if using the join_code method. Notifies the desired endpoint of the generated address when the wallet is joined
webhook             | (string, Optional)  webhook URL to notify of sends and receives related to this address.  This overrides the API user level `default_webhook`
auto_fulfill        | (boolean, Optional) Causes deliveries from this source address to be marked ready and fulfilled automatically when delivery_date is triggered. Default is true.
active              | (boolean, Optional) Change the active status of this address
desired_utxo_primes | (integer, Optional) Choose how many spare UTXOs you want to keep to facilitate smooth transactions


