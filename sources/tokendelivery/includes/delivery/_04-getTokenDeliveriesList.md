## Get a list of Deliveries


```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://deliver.tokenly.com/api/v1/delivery\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://deliver.tokenly.com/api/v1/delivery
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$response = $client->getDeliveryList();

```

> The above command returns data structured like the following:

```json
{
    "count": 2,
    "items": [
        {
            "id": "c78bcedc-3c18-4d22-b676-8c1d5f1d207b",
            "sourceUuid": "1f8a1fc4-039a-48ff-a45c-150812044b69",
            "destination": "3LaaKdhrYQHzWxCeB3Kvd3xs3kKJUzqdFn",
            "token": "PIZZA",
            "quantity": "1000000000",
            "deliveryDate": "2016-10-22T20:57:28+0000",
            "refData": "{\"test\": true}",
            "pseudo": false,
            "holdPromise": false,
            "state": 1,
            "complete": false,
            "deliveryTx": null,
            "updatedAt": "2016-10-21T20:57:28+0000",
            "createdAt": "2016-10-21T20:57:28+0000"
        },
        {
            "id": "2ef604c6-ae4e-4905-aa93-de633188019b",
            "sourceUuid": "1f8a1fc4-039a-48ff-a45c-150812044b69",
            "destination": "12Hord1dcvug4r25UXCCNTy12Lhk49JEat",
            "token": "SOUP",
            "quantity": "1000000000",
            "deliveryDate": "2016-10-22T20:57:28+0000",
            "refData": "{\"test\": true}",
            "pseudo": false,
            "holdPromise": false,
            "state": 1,
            "complete": false,
            "deliveryTx": null,
            "updatedAt": "2016-10-21T20:57:28+0000",
            "createdAt": "2016-10-21T20:57:28+0000"
        }
    ]
}
```

Returns a list of all deliveries owned by the authenticated user.

### HTTP Request

`GET https://deliver.tokenly.com/api/v1/delivery`



### Request Parameters

Parameter     | Description
------------- | -----------
source        | (string) optional filter for deliveries from specific source UUID
token         | (string) optional filter for deliveries of a specific token
destination   | (string) optional filter for delivery destination
show_complete | (boolean) default false, set to true to include complete deliveries in list.
