## Search the Music Library

```php
<?php
$songs = $music_api->searchLibrary(['artist' => 'Mr. Chips']);
```

```shell
curl -X GET https://music.tokenly.com/api/v1/library?artist=Mr.%20Chips
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

Returns a list of search results

### HTTP Request

`GET https://music.tokenly.com/api/v1/library`


### Query Parameters

Parameter    | Description
---------    | -----------
name         | Song name to find. This search uses a keyword search.
artist       | Artist name to find. This search uses a keyword search.
genre        | Genre to find
tag          | Tag to find
token        | Token to find (must be a valid token name like MYTOKEN or A1234567890)
operator     | 'OR' or 'AND' search.  Defaults to OR.
sort         | Specify 'top' to sort by the most streamed tracks first 
topTimeframe | when sorting by top, specify '1h', '1d', '7d' or '30d' to change the timeframe of the streaming count.  The default is 1 day.
limit        | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg           | current page offset (starting with 0)


