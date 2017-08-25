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
            "artistProfileId": "31444a77-4267-43bb-8e45-000000000001",
            "pictureUrl": "https://music.tokenly.com/path/to/pic.jpg",
            "website": "http://mrchipssite.com",
            "genre": "AI Rock",
            "tags": ["ai","rock","techno"]
        },
        {
            "artist": "The Blue Whiles",
            "artistProfileId": null,
            "pictureUrl": "",
            "website": "",
            "genre": "",
            "tags": []
        }
    ],
    "page": 0,
    "pageCount": 1,
    "perPage": 50
}
```

Returns a list of all artists, sorted by featured artist rank

### HTTP Request

`GET https://music.tokenly.com/api/v1/artists`


### Query Parameters

Parameter | Description
--------- | -----------
genre     | Search by artist genre.  This is an exact match search.
hero      | Filter the results on the existence of a hero image for the artist.  Leave empty for all featured artists.
limit     | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg        | current page offset (starting with 0)

