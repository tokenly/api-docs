## Get Chat Privileges


```php
<?php
$playlists = $music_api->getChatPrivileges($chat_id);
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
CHAT_ID="Up82G5kgDRElHMgx775F149"
SIGNATURE=$(echo -en "GET\nhttps://music.tokenly.com/api/v1/messenger/chat/${CHAT_ID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X GET \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://music.tokenly.com/api/v1/messenger/chat/${CHAT_ID}
```

> The above command returns data structured like this:

```json
{
    "authorized": true,
    "isGlobal": false,
    "tokenAuthorization": [
        {
            "asset": "MYTOKEN",
            "amount": 100000000
        },
        {
            "asset": "OTHERTOKEN",
            "amount": 500000000
        }
    ]
}
```

Retrieves authorization information about a chat.  Determines if the current user is eligible to read or participate in a chat.

### HTTP Request

`GET https://music.tokenly.com/api/v1/messenger/chat/{chatId}`

### URL Parameters

Parameter | Description
--------- | -----------
chatId    | The chat identifier

