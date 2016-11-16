## Delete a delivery

```shell
DELIVERY_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "DELETE\nhttps://deliver.tokenly.com/api/v1/source/${DELIVERY_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://deliver.tokenly.com/api/v1/source/${DELIVERY_UUID}
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$uuid = "93f5de16-693b-416e-8d63-2368f2b34a44";
$response = $client->cancelDelivery($uuid);

```

> The above command returns data structured like this:

```json
{
    "result": true
}
```

Cancels an unfulfilled delivery and removes any related Tokenpass promise. 


### HTTP Request

`DELETE https://deliver.tokenly.com/api/v1/source/{deliveryId}`


### URL Parameters

Parameter  | Description
---------  | -----------
deliveryId | The UUID of the delivery


