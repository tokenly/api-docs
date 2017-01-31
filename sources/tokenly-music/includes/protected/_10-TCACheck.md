## TCA Check


```php
<?php
$statuses = $music_api->tcaCheck(['ALBUMONE'=>1, 'ALBUMTWO'=>1]);
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://music.tokenly.com/api/v1/tca/status\n{\"tokens\": {\"ALBUMONE\":1, \"ALBUMTWO\":1}}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"tokens": {"ALBUMONE":1, "ALBUMTWO":1}}' \
    https://music.tokenly.com/api/v1/tca/status
```

> The above command returns data structured like this:

```json
{
    "access": {
        "ALBUMONE": true,
        "ALBUMTWO": false
    }
}
```

Returns the TCA (Token Controlled Access) status for the current user for multiple tokens.

### HTTP Request

`POST https://music.tokenly.com/api/v1/tca/status`

### POST Parameters

Parameter | Description
--------- | -----------
tokens    | An object of token names and minimum amounts.
refresh   | Skip the cache and reload the balance from Tokenpass. (optional)


