## Get Recommendations

```php
<?php
$songs = $music_api->getRecommendations(['songId' => '884599b8-c52e-4145-b5a7-326afc0adf06']);
```

```shell
curl -X GET https://music.tokenly.com/api/v1/recommendations?songId=884599b8-c52e-4145-b5a7-326afc0adf06
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
            "tags": "bitcoin, rock, techno",
            "tagsArray": ["bitcoin", "rock", "techno"],
            "genre": "Alternative",
            "releaseDate": "2016-03-26T20:31:12+0000",
            "artist": "Mr. Chips",
            "artistProfileId": "32c999ec-2cd4-427f-b60c-000000000001",
            "description": "Description of song 1",
            "isTokenlyMusic": true,
            "publicStreamable": true,
            "tokens": ["MRCHIPSALBUM"],
            "albumName": "The Album",
            "albumId": "5f3e69c3-7e6a-4758-9dc2-40a0295afa46",
            "artworkImage": "https://music.tokenly.com/path/to/image.png",
            "isSingle": false,
            "duration": 180,
            "formattedDuration": "03:00"
        },
        {
            "id": "740e4e3e-438e-45be-b98d-000000000002",
            "name": "Another Song",
            "tags": "bitcoin, rock, techno",
            "tagsArray": ["bitcoin", "rock", "techno"],
            "genre": "Alternative",
            "releaseDate": null,
            "artist": "Other Artist",
            "artistProfileId": null,
            "description": "Description of other song",
            "isTokenlyMusic": false,
            "publicStreamable": true,
            "tokens": [],
            "albumName": "The Album",
            "albumId": "5918b2f6-ee00-4d89-89d8-88ffe19331df",
            "artworkImage": null,
            "isSingle": true,
            "duration": 180,
            "formattedDuration": "03:00"
        }
    ]
}
```

Returns a list of recommended songs based on the songId passed to it.  This is currently just the top tracks for the artist profile of the song.

### HTTP Request

`GET https://music.tokenly.com/api/v1/recommendations`


### Query Parameters

Parameter  | Description
---------  | -----------
songId     | The uuid of the song to find recommendations from
pg         | The current page offset (starting with 0)


