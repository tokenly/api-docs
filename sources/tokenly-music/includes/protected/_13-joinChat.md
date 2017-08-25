## Join a Chat Roster


```php
<?php
$playlists = $music_api->joinChatRoster($chat_id);
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
CHAT_ID="Up82G5kgDRElHMgx775F149"
SIGNATURE=$(echo -en "POST\nhttps://music.tokenly.com/api/v1/messenger/roster/${CHAT_ID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://music.tokenly.com/api/v1/messenger/roster/${CHAT_ID}
```

> The above command returns data structured like this:

```json
{
    "success": true
}
```

Adds the current user to the chat roster.  This is required in order to send any messages to the chat.

### HTTP Request

`POST https://music.tokenly.com/api/v1/messenger/roster/{chatId}`

### URL Parameters

Parameter | Description
--------- | -----------
chatId    | The chat identifier

