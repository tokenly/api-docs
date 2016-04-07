## Get Songs for an Album

```php
<?php
$songs = $music_api->getSongs('cc6f8915-a7b3-4da1-aa5f-7e505291a181');
```

```shell
curl -X GET https://music-stage.tokenly.com/api/v1/music/catalog/songs/cc6f8915-a7b3-4da1-aa5f-7e505291a181
```

> The above command returns data structured like this:

```json
[
  {
    "id": "c795531a-23e7-4dd5-aa29-4b670d45158c",
    "name": "Ears on the Ground",
    "tokens": [
      "LITTLECOLOR",
      "MTMYEARONE",
      "MTMCOLLECTOR",
      "MTMPRODUCER"
    ],
    "description": "",
    "performers": "Mind To Matter",
    "composers": "Adam B. Levine",
    "releaseDate": "2016-03-26T20:31:12+0000",
    "lyrics": "",
    "credits": "",
    "copyright": "Adam B. Levine 2016",
    "ownership": "Adam B. Levine",
    "usageRights": "",
    "usageProhbitions": "",
    "bitcoinAddress": "1GJchZwagFFxXMUnRyQFVDe8QSKb9mJKXS",
    "other": ""
  }
]
```

Returns a list of songs for a given album.

### HTTP Request

`GET https://music-stage.tokenly.com/api/v1/music/catalog/songs/{albumid}`


### URL Parameters

Parameter | Description
--------- | -----------
albumid   | The album identifier

