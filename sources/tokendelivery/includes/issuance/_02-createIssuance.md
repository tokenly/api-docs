## Create a new issuance

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SOURCE="9793f526-d01b-4a48-9569-0a72a3096b06"
SIGNATURE=$(echo -en "POST\nhttps://deliver.tokenly.com/api/v1/issuance/${SOURCE}\n{\"asset\": \"MYNEWTOKEN\", \"divisible\": true, \"quantity\": 50, \"description\": \"About my new token\"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"asset": "MYNEWTOKEN", "divisible": true, "quantity": 50, "description": "About my new token"}' \
    https://deliver.tokenly.com/api/v1/issuance/${SOURCE}
```

```php
<?php

$client = new Tokenly\DeliveryClient\Client('https://deliver.tokenly.com', $API_TOKEN, $API_SECRET_KEY);

$source      = "9793f526-d01b-4a48-9569-0a72a3096b06";
$asset       = "MYNEWTOKEN";
$divisible   = true;
$quantity    = 50;
$description = "About my new token";

$response = $client->createIssuance($source, $asset, $quantity, $divisible, $description);

```


> The above command returns data structured like this:

```json
{
    "id": "24de3274-8415-46e1-9d48-6964982970ed",
    "quantity": 10,
    "asset": "A1000000555555560001",
    "copayTransaction": {}
}
```

Creates a new token issuance.


### HTTP Request

`POST https://deliver.tokenly.com/api/v1/issuance/{source}`

### URL Parameters

Parameter  | Description
---------  | -----------
source     | The UUID of the source address


### Body Parameters

Parameter     | Description
------------  | -----------
source        | (string) uuid OR bitcoin address of source to retrieve and send token inventory from
token         | (string) token or pseudo token to issuance
quantity      | (integer) quantity of token to deliver, in satoshis
divisible     | (boolean) Whether the token is divisible or not
description   | (string) A text description or BVAM hash

