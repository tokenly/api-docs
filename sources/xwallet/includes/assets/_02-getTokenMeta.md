## Get token meta information

```php
<?php
$asset_name = 'TOKENLY';
$asset_info = $api->getTokenMeta($asset_name);
```

```shell
TOKEN_NAME="TOKENLY"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://xwallet.tokenly.com/api/v1/assets/${TOKEN_NAME}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://xwallet.tokenly.com/api/v1/assets/$TOKEN_NAME
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "asset": "TOKENLY",
    "description": "Tokenly.co",
    "divisible": true,
    "issuer": "12717MBviQxttaBVhFGRP1LxD8X6CaW452",
    "locked": false,
    "owner": "12717MBviQxttaBVhFGRP1LxD8X6CaW452",
    "supply": 10000000000000
}
```




Returns the asset information for the given token.

### HTTP Request

`GET https://xwallet.tokenly.com/api/v1/assets/{tokenName}`


### URL Parameters

Parameter       | Description
---------       | -----------
tokenName       | The UUID of the address to send from.  This is not the bitcoin address.


