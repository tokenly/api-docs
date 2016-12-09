## Retrieve Profile


```php
<?php
$profile = $music_api->getProfile();
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://music.tokenly.com/api/v1/profile\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X GET \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://music.tokenly.com/api/v1/profile
```

> The above command returns data structured like this:

```json
{
    "bio": "I luv music."
}
```

Retrieves profile data for the user owning the API token.

### HTTP Request

`GET https://music.tokenly.com/api/v1/profile`

