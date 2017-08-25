## Search the Music Library for Albums

```php
<?php
$songs = $music_api->searchLibraryForAlbums(['artist' => 'Mr. Chips']);
```

```shell
curl -X GET https://music.tokenly.com/api/v1/library/albums?artist=Mr.%20Chips
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
            "id": "2ad1118b-adaa-4f24-bc12-000000000001",
            "name": "Sample Album One",
            "description": "The description of Sample Album One",
            "songCount": 2,
            "artworkImage": "https://music.tokenly.com/path/to/image.png",
            "artistProfileId": "d149f4ae-0b72-4478-9b8d-5e4207620fdd",
            "duration": 300,
            "formattedDuration": "05:00"
        },
        {
            "id": "2ad1118b-adaa-4f24-bc12-000000000002",
            "name": "Sample Album Two",
            "description": "The description of Sample Album Two",
            "songCount": 2,
            "artworkImage": null,
            "artistProfileId": null,
            "duration": 185,
            "formattedDuration": "03:05"
        }
    ]
}
```

Returns a list of search results

### HTTP Request

`GET https://music.tokenly.com/api/v1/library/albums`


### Query Parameters

Parameter       | Description
---------       | -----------
name            | Album name to find. This search uses a partial match search and not a keyword search.
artistProfileId | Artist profileId used to limit the search
artist          | Artist name to find. This search uses a partial match search and not a keyword search.
operator        | 'OR' or 'AND' search.  Defaults to OR.
limit           | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg              | current page offset (starting with 0)


