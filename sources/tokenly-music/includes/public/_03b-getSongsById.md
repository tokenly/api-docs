## Lookup Songs by Id

```php
<?php
$songs = $music_api->getSongsById(['bbb51108-9e89-4863-8b90-000000000001', '740e4e3e-438e-45be-b98d-000000000002']);
```

```shell
curl -X GET https://music.tokenly.com/api/v1/music/catalog/songs?ids=bbb51108-9e89-4863-8b90-000000000001,740e4e3e-438e-45be-b98d-000000000002
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
          "artworkImageThumb": "https://music.tokenly.com/path/to/thubmnail_image.png",
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
          "artworkImageThumb": null,
          "isSingle": true,
          "duration": 180,
          "formattedDuration": "03:00"
      }
  ]
}

```

Returns a list of songs for a given album.

### HTTP Request

`GET https://music.tokenly.com/api/v1/music/catalog/songs`


### Query Parameters

Parameter | Description
--------- | -----------
ids       | A comma separated list of song uuids.  Up to 50 song ids are allowed.

