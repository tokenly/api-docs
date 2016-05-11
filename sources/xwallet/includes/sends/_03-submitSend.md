## Submits an unsigned send transaction to the bitcoin network

```php
<?php
$send_uuid = '8ccccccc-1234-5678-1234-cccccccc1111';
$signed_transaction_hex = '0000113111deadbeef0000aaabcdef1111110000113111deadbeef';
$sent_data = $api->submitSend($send_uuid, $signed_transaction_hex);
```

```shell
SEND_UUID="1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb"
SIGNED_TX_HEX="0000113111deadbeef0000aaabcdef1111110000113111deadbeef"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://xwallet.tokenly.com/api/v1/signed/sends/${SEND_UUID}\n{\"signedTx\":\"$SIGNED_TX_HEX\"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
  -d '{"signedTx":"'$SIGNED_TX_HEX'"}' \
  https://xwallet.tokenly.com/api/v1/signed/sends/$SEND_UUID
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "txid": "a123456789123456789123456789123456789123456789123456789aaabbbccc"
}
```


Broadcasts the send to the bitcoin network.

### HTTP Request

`POST https://xwallet.tokenly.com/api/v1/signed/sends/{sendId}`


### URL Parameters

Parameter  | Description
---------  | -----------
sendId     | The UUID of the Send Transaction

### Body Parameters

Parameter  | Description
---------  | -----------
signedTx   | The signed transaction, encoded as a hexadecimal string

<aside class="notice">The POST data should be a json encoded string</aside>
