## Remove an address

```php
<?php
$address_uuid = '8ccccccc-1234-5678-1234-cccccccc1111';
$bot_data = $api->destroyAddress($address_uuid);
```

```shell
ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "DELETE\nhttps://xwallet.tokenly.com/api/v1/addresses/${ADDRESS_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X DELETE \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://xwallet.tokenly.com/api/v1/addresses/$ADDRESS_UUID
```

> The above command returns an empty response with HTTP code 204.



Remove a bitcoin address managed by this client.

### HTTP Request

`DELETE https://xwallet.tokenly.com/api/v1/addresses/{addressId}`


### URL Parameters

Parameter       | Description
---------       | -----------
addressId       | The UUID of the address (not the bitcoin address itself)

