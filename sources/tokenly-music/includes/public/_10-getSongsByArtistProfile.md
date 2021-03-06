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
            "albumId": "5918b2f6-ee00-4d89-89d8-88ffe19331df",
            "artworkImage": null,
            "artworkImageThumb": null,
            "isSingle": true,
            "duration": 180,
            "formattedDuration": "03:00"
        },
        {
            "id": "740e4e3e-438e-45be-b98d-000000000002",
            "name": "Song Two Preview",
            "tags": "bitcoin, rock, techno",
            "tagsArray": ["bitcoin", "rock", "techno"],
            "genre": "Alternative",
            "releaseDate": null,
            "artist": "Mr. Chips",
            "artistProfileId": "32c999ec-2cd4-427f-b60c-000000000001",
            "description": "Description of other song",
            "isTokenlyMusic": true,
            "publicStreamable": false,
            "tokens": ["MRCHIPSFANS"],
            "albumName": "The Other Album",
            "albumId": "14101af1-f692-4651-87a9-4a228aa4a031",
            "artworkImage": null,
            "artworkImageThumb": null,
            "isSingle": true,
            "duration": 180,
            "formattedDuration": "03:00"
        }
    ]
}

```

Returns a list of songs for a given artist profile.

### HTTP Request

`GET https://music.tokenly.com/api/v1/artist/{profileId}/songs`


### URL Parameters

Parameter | Description
--------- | -----------
profileId | The artist profile identifier

