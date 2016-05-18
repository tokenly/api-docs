## Add a new address

```php
<?php
$api = new XWalletAPI(); # note - The PHP API client doesn't exist just yet
$address = '1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb';
$bot_data = $api->newAddress($address);
```

```shell
ADDRESS="1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb"
WEBHOOK_ENDPOINT="http://mysite.com/callback"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://xwallet.tokenly.com/api/v1/addresses\n{"address":"$ADDRESS","webhookEndpoint":"$WEBHOOK_ENDPOINT"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"address":"'$ADDRESS'","webhookEndpoint":"'$WEBHOOK_ENDPOINT"}' \
    https://xwallet.tokenly.com/api/v1/addresses
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "address": "1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb",
    "id": "8baaaaaa-1234-5678-1234-aaaaaaaa1111",
    "sendMonitorId": "3bcccccc-1234-5678-1234-cccccccc2222",
    "receiveMonitorId": "4bdddddd-1234-5678-1234-dddddddd3333"
}
```


Add a bitcoin address to be managed by this user.

### HTTP Request

`POST https://xwallet.tokenly.com/api/v1/addresses`


### Body Parameters

Parameter       | Description
---------       | -----------
address         | A bitcoin address
webhookEndpoint | An optional URL endpoint to post address events (such as send or receive)

<aside class="notice">The POST data should be a json encoded string</aside>
