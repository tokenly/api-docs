## Store Playlists


```php
<?php
$music_api->storePlaylists($playlists);
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "PUT\nhttps://music-stage.tokenly.com/api/v1/playlists\n{\"playlist_1\":[{\"id\":\"songid1\"},{\"id\":\"songid2\"}]}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X PUT \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"playlist_1":[{"id":"songid1"},{"id":"songid2"}]}' \
    https://music-stage.tokenly.com/api/v1/playlists
```

> The above command returns data structured like this:

```json
{
    "id": "3767d136-7ef4-4112-9dfe-71a0b6261caf"
}
```

Stores playlist data for the user owning the API token.  The data returned is only an id.

### HTTP Request

`PUT https://music-stage.tokenly.com/api/v1/playlists`


### PUT Parameters

The playlist data formatted as a JSON encoded string
