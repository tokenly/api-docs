## Delete an unsigned send transaction

```php
<?php
$send_uuid = '8ccccccc-1234-5678-1234-cccccccc1111';
$bot_data = $api->destroySend($send_uuid);
```

```shell
SEND_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "DELETE\nhttps://xwallet.tokenly.com/api/v1/sends/${SEND_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X DELETE \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://xwallet.tokenly.com/api/v1/sends/$SEND_UUID
```


> The above command returns an empty response with HTTP code 204.


Destroys a pending unsigned send.  This will release any UTXOs marked as spent by XWallet.

### HTTP Request

`DELETE https://xwallet.tokenly.com/api/v1/sends/{sendId}`


### URL Parameters

Parameter  | Description
---------  | -----------
sendId     | The UUID of the Send Transaction
