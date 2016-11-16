## Fulfill a Single Delivery

```shell
DELIVERY_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://deliver.tokenly.com/api/v1/fulfillment/single/${DELIVERY_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{}' \
    https://deliver.tokenly.com/api/v1/fulfillment/single/${DELIVERY_UUID}
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$uuid = "8ccccccc-1234-5678-1234-cccccccc1111";

$response = $client->fulfillSingleDelivery($uuid);

```


> The above command returns data structured like this:

```json
{
  "result": true
}
```

Initiates a multi-sig payment proposal for fulfilling a single delivery on the blockchain. The delivery to send must be marked `ready`. The client holding the remaining multisig keys will need to sign the transaction in their wallet or with their application. After the transaction is created and broadcasted, the `delivery_tx` field is updated and the `sent` field set to true.  After the transaction is confirmed by the network it is marked complete.


### HTTP Request

`POST https://deliver.tokenly.com/api/v1/source/{deliveryId}`


### URL Parameters

Parameter  | Description
---------  | -----------
deliveryId | The UUID of the delivery

