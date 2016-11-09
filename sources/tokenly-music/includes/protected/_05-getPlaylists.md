## Retrieve Playlists


```php
<?php
$playlists = $music_api->getPlaylists();
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://music-stage.tokenly.com/api/v1/playlists\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X GET \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"playlist_1":[{"songid1","songid2"}]}' \
    https://music-stage.tokenly.com/api/v1/playlists
```

> The above command returns data structured like this:

```json
{
    "playlist_1": [
        {
            "id": "songid1"
        },
        {
            "id": "songid2"
        }
    ]
}
```

Retrieves playlist data for the user owning the API token.

### HTTP Request

`GET https://music-stage.tokenly.com/api/v1/playlists`

