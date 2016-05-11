## Create a new address

```php
<?php
$address = '1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb';
$bot_data = $api->newAddress($address);
```

```shell
ADDRESS="1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://xwallet.tokenly.com/api/v1/addresses/${ADDRESS}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://xwallet.tokenly.com/api/v1/addresses/$ADDRESS
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "id": "8baaaaaa-1234-5678-1234-aaaaaaaa1111",
    "address": "1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb"
}
```


Adds a bitcoin address to be managed by this client.

### HTTP Request

`POST https://xwallet.tokenly.com/api/v1/addresses`


### Body Parameters

Parameter       | Description
---------       | -----------
address         | A bitcoin address
webhookEndpoint | An optional URL endpoint to post address events (such as send or receive)

<aside class="notice">The POST data should be a json encoded string</aside>
