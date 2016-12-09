## Store Profile


```php
<?php
$music_api->storeProfile($profile);
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "PUT\nhttps://music.tokenly.com/api/v1/profile\n{\"bio\":{\"I luve music.\"}}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X PUT \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"bio":{"I luv music."}' \
    https://music.tokenly.com/api/v1/profile
```

> The above command returns data structured like this:

```json
{
    "id": "11513219-9ba7-44c7-b221-707edf2a10b0"
}
```

Stores public profile data for the user owning the API token.  The data returned is only an id.

### HTTP Request

`PUT https://music.tokenly.com/api/v1/profile`


### PUT Parameters

The profile data formatted as a JSON encoded string.  The API will return an error if the data is larger than 4 Kb.
