## Delete a source address

```shell
SOURCE_ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "DELETE\nhttps://deliver.tokenly.com/api/v1/source/${SOURCE_ADDRESS_UUID}\n{\"sweep_address\": \"1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j\"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"sweep_address": "1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j"}' \
    https://deliver.tokenly.com/api/v1/source/$SOURCE_ADDRESS_UUID
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$uuid          = "8ccccccc-1234-5678-1234-cccccccc1111";
$sweep_address = '1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j';

$response = $client->shutdownSourceAddress($uuid, $sweep_address);

```


> The above command returns data structured like this:

```json
{
    "result": true
}
```

Shutdown and archive an existing source address.  Any pending deliveries tied to this source address must be canceled first or this request will fail.  Sweeps all funds to `backup_address` if provided.


### HTTP Request

`DELETE https://deliver.tokenly.com/api/v1/source/{addressId}`


### URL Parameters

Parameter       | Description
---------       | -----------
addressId       | The UUID of the source address.  This is not the bitcoin address.


### Body Parameters

Parameter     | Description
------------  | -----------
sweep_address | (string, Optional)  An address to send all tokens and BTC.  If not provided, the user's `backup address` is used.


