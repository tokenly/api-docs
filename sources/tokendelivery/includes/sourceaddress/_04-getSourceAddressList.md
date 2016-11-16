## Get a list of source addresses

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://deliver.tokenly.com/api/v1/source\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://deliver.tokenly.com/api/v1/source
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$response = $client->getSourceAddressList();

```

> The above command returns data structured like the following:

```json
{
    "count": 2,
    "items": [
        {
            "id": "b1817e08-6537-4685-8435-ca9987d927f8",
            "joinCode": "Fenq762M2AHEBYUbnZGUweKxRocmqszNNZwzAWnj3ETR9Up3ThUPJqQ5vBq3f7eA2RL7obxoC6L",
            "joinCallback": "http://my-app.com/joinedhook",
            "complete": false,
            "label": "Game Fountain",
            "type": "2:2",
            "webhook": "http://my-app.com/transactionhook",
            "autoFulfill": false,
            "active": true,
            "createdAt": "2016-10-21T15:38:36+0000",
            "updatedAt": "2016-10-21T15:38:36+0000",
            "desiredUtxoPrimes": 12
        },
        {
            "id": "10a0fd56-3b14-4de0-9f11-dbdd8fd8721c",
            "joinCode": "Fabc123456789012aMTHjrXkEbpzdfmAAMjmNJaw3RGE9Hc3GuHCWdD5iOd3s7rN2EY7bokbP6Y",
            "joinCallback": "http://my-app.com/joinedhook2",
            "complete": false,
            "label": "Other Source",
            "type": "2:2",
            "webhook": "http://my-app.com/transactionhook2",
            "autoFulfill": true,
            "active": true,
            "createdAt": "2016-10-21T15:38:36+0000",
            "updatedAt": "2016-10-21T15:38:36+0000",
            "desiredUtxoPrimes": 12
        }
    ]
}
```

Returns a list of all source addresses owned by the authenticated user.

### HTTP Request

`GET https://deliver.tokenly.com/api/v1/source`


