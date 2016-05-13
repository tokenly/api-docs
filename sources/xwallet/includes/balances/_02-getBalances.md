## Get balances for an address

```php
<?php
$address_uuid = '8ccccccc-1234-5678-1234-cccccccc1111';
$bot_data = $api->getBalances($address_uuid);
```

```shell
ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://xwallet.tokenly.com/api/v1/balances/${ADDRESS_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://xwallet.tokenly.com/api/v1/balances/$ADDRESS_UUID
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "id": "8ccccccc-1234-5678-1234-cccccccc1111",
    "active": true,
    "balances": {
        "unconfirmed": {
            "BTC": 0.05
        },
        "confirmed": {
            "BTC": 0.12,
            "TOKENLY": 10
        },
        "sending": []
    }
}
```




Returns an array of balances for this address.  Balances are considered unconfirmed until 2 confirmations are received.  Sent balances are immediately deducted from the confirmed amount and are reported as sending for 2 confirmations.

### HTTP Request

`GET https://xwallet.tokenly.com/api/v1/balances/{addressId}`


### URL Parameters

Parameter       | Description
---------       | -----------
addressId       | The UUID of the address to send from.  This is not the bitcoin address.


