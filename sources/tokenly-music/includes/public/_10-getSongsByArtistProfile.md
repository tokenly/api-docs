## Get Songs by Artist

```php
<?php
$songs = $music_api->getSongsByArtistProfile('32c999ec-2cd4-427f-b60c-000000000001');
```

```shell
curl -X GET https://music.tokenly.com/api/v1/artist/32c999ec-2cd4-427f-b60c-000000000001/songs
```

> The above command returns data structured like this:

```json
{
    "page": 0,
    "perPage": 50,
    "pageCount": 1,
    "count": 2,
    "items": [
        {
            "id": "bbb51108-9e89-4863-8b90-000000000001",
            "name": "Song 1",
            "artist": "Mr. Chips",
            "artistProfileId": "32c999ec-2cd4-427f-b60c-000000000001",
            "description": "Description of song 1",
            "isTokenlyMusic": true,
            "tokens": ["MRCHIPSALBUM"]
        },
        {
            "id": "740e4e3e-438e-45be-b98d-000000000002",
            "name": "Another Song",
            "artist": "Mr. Chips",
            "artistProfileId": "32c999ec-2cd4-427f-b60c-000000000001",
            "description": "Description of other song",
            "isTokenlyMusic": true,
            "tokens": ["MRCHIPSALBUM"]
        }
    ]
}

```

Returns a list of songs for a given album.

### HTTP Request

`GET https://music.tokenly.com/api/v1/artist/{profileId}/songs`


### URL Parameters

Parameter | Description
--------- | -----------
albumid   | The album identifier

