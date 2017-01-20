## Authorize Stream


```php
<?php
$song_uuid = "79c78547-ebf2-40d8-bbed-000000000001";
$profile = $music_api->authorizeStream($song_uuid);
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SONG_UUID="79c78547-ebf2-40d8-bbed-000000000001"
SIGNATURE=$(echo -en "POST\nhttps://music.tokenly.com/api/v1/stream/${SONG_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://music.tokenly.com/api/v1/stream/${SONG_UUID}
```

> The above command returns data structured like this:

```json
{
    "authorized": true,
    "balanceFloat": 97,
    "balanceSat": 9700000000
}
```

Retrieves profile data for the user owning the API token.

### HTTP Request

`POST https://music.tokenly.com/api/v1/stream/{songid}`

### URL Parameters

Parameter | Description
--------- | -----------
songid    | The song identifier (UUID)


