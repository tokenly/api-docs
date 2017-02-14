## Get source address details

```shell
SOURCE_ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://deliver.tokenly.com/api/v1/source/${SOURCE_ADDRESS_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://deliver.tokenly.com/api/v1/source/$SOURCE_ADDRESS_UUID
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$uuid = "b1817e08-6537-4685-8435-ca9987d927f8";

$response = $client->getSourceAddress($uuid);

```

> The above command returns data structured like the following:

```json
{
    "id": "b1817e08-6537-4685-8435-ca9987d927f8",
    "joinCode": "Fenq762M2AHEBYUbnZGUweKxRocmqszNNZwzAWnj3ETR9Up3ThUPJqQ5vBq3f7eA2RL7obxoC6L",
    "joinCallback": "http://my-app.com/joinedhook",
    "complete": false,
    "label": "Game Fountain",
    "type": "2:2",
    "webhook": "http://my-app.com/transactionhook",
    "address": "3AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j",
    "autoFulfill": false,
    "active": true,
    "createdAt": "2016-10-21T15:38:36+0000",
    "updatedAt": "2016-10-21T15:38:36+0000",
    "desiredUtxoPrimes": 12,
    "balances": [],
    "availableBalances": [],
    "unconfirmedBalances": [],
    "pendingDeliveries": []
}
```


Returns the details for this address.  Includes current balances and pending delivery balances.  `unconfirmedBalances` includes pending transactions with 0 or 1 confirmations.  Pending transactions over 4 days old are not included in the unconfirmed balances.

### HTTP Request

`GET https://deliver.tokenly.com/api/v1/source/{addressId}`


### URL Parameters

Parameter       | Description
---------       | -----------
addressId       | The UUID of the source address.  This is not the bitcoin address.


