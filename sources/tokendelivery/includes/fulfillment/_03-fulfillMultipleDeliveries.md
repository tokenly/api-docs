## Fulfill Multiple Deliveries from a Source Address


```shell
SOURCE_ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://deliver.tokenly.com/api/v1/fulfillment/multiple/${SOURCE_ADDRESS_UUID}\n{\"tokens\":[\"MYCOIN\",\"YOURCOIN\"]}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"tokens":["MYCOIN","YOURCOIN"]}\n${API_TOKEN}' \
    https://deliver.tokenly.com/api/v1/fulfillment/multiple/${SOURCE_ADDRESS_UUID}
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$source_address_uuid = "8ccccccc-1234-5678-1234-cccccccc1111";
$filters = [
    'tokens' => [ 'MYCOIN', 'YOURCOIN' ]
];
$response = $client->fulfillMultipleDeliveries($source_address_uuid, $filters);

```



> The above command returns data structured like this:

```json
{
  "result": true
}
```

Groups together all ready deliveries from the specified source address and creates the multi-sig payment proposals for delivering the inventory.  The delivery to send must be marked `ready`.  All multisig proposals are initiated and wallets holding the remaining keys must sign the transaction to complete the payments.

An optional array of tokens can be included to limit which tokens are sent.


### HTTP Request

`POST https://deliver.tokenly.com/api/v1/source/{deliveryId}`


### URL Parameters

Parameter  | Description
---------  | -----------
deliveryId | The UUID of the delivery.  This can also be the bitcoin address of the source address.


### Body Parameters

Parameter     | Description
------------  | -----------
tokens        | (string|array) An array of token types to fulfill.  If empty or if set to "all", then all ready deliveries are sent

