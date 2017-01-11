## Get Song Download Information


```php
<?php
$song_info = $music_api->getDownloadInfoForSong();
```

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
SONG_ID="d2e5fbb2-ee81-49bc-a791-0464ff01f6a1"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://music.tokenly.com/api/v1/music/song/download/${SONG_ID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)
curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://music.tokenly.com/api/v1/music/song/download/$SONG_ID
```

> The above command returns data structured like this:

```json
{
    "id": "d2e5fbb2-ee81-49bc-a791-0464ff01f6a1",
    "name": "The Banana Stands' Lament",
    "tokens": [
        "LITTLECOLOR",
        "MTMYEARONE",
        "MTMCOLLECTOR",
        "MTMPRODUCER"
    ],
    "description": "",
    "performers": "Mind To Matter",
    "composers": "Adam B. Levine",
    "releaseDate": "2016-03-26T20:31:19+0000",
    "lyrics": "",
    "credits": "",
    "copyright": "Adam B. Levine 2016",
    "ownership": "Adam B. Levine",
    "usageRights": "",
    "usageProhbitions": "",
    "bitcoinAddress": "1GJchZwagFFxXMUnRyQFVDe8QSKb9mJKXS",
    "other": "",
    "downloadUrl": "https://s3.amazonaws.com/tokenly-music/u-xxxxx/a-xxxxx/s-xxxxx/xxxxx.mp3",
    "downloadSize": 3519927,
    "artistProfileId": "4d1bf328-8fb3-4fef-ac65-b4f71b52ce03"
}
```

Retrieves song data for the user owning the API token.  The data returned includes a download URL.

### HTTP Request

`GET https://music.tokenly.com/api/v1/music/song/download/{songid}`


### URL Parameters

Parameter | Description
--------- | -----------
songid    | The song identifier


