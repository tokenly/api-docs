## Get Artists

```php
<?php
$songs = $music_api->getArtists();
```

```shell
curl -X GET https://music.tokenly.com/api/v1/artists
```

> The above command returns data structured like this:

```json
{
    "count": 2,
    "items": [
        {
            "artist": "Mr. Chips",
            "pictureUrl": "https://music.tokenly.com/path/to/pic.jpg",
            "website": "http://mrchipssite.com",
            "genre": "AI Rock",
            "tags": ["ai","rock","techno"],
            "songCount": 2
        },
        {
            "artist": "The Blue Whiles",
            "pictureUrl": "",
            "website": "",
            "genre": "",
            "tags": [],
            "songCount": 1
        }
    ],
    "page": 0,
    "pageCount": 1,
    "perPage": 50
}
```

Returns a list of all artists

### HTTP Request

`GET https://music.tokenly.com/api/v1/artists`


### Query Parameters

Parameter | Description
--------- | -----------
id        | Fetch a specific artist profile by uuid
limit     | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg        | current page offset (starting with 0)

