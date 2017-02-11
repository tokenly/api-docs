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
            "artist": "Mr. Chips",
            "artistProfileId": "32c999ec-2cd4-427f-b60c-000000000001",
            "description": "Description of song 1",
            "isTokenlyMusic": true,
            "tokens": ["MRCHIPSALBUM"]
        },
        {
            "id": "740e4e3e-438e-45be-b98d-000000000002",
            "name": "Another Song",
            "artist": "Other Artist",
            "artistProfileId": null,
            "description": "Description of other song",
            "isTokenlyMusic": false,
            "tokens": []
        }
    ]
}

```

Returns a list of search results

### HTTP Request

`GET https://music.tokenly.com/api/v1/library`


### Query Parameters

Parameter | Description
--------- | -----------
name      | Album name to find. This search uses a keyword search.
artist    | Artist name to find. This search uses a keyword search.
genre     | Genre to find
tag       | Tag to find
token     | Token to find (must be a valid token name like MYTOKEN or A1234567890)
operator  | 'OR' or 'AND' search.  Defaults to OR.
limit     | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg        | current page offset (starting with 0)


