## Get Genres

```php
<?php
$songs = $music_api->getGenres();
```

```shell
curl -X GET https://music.tokenly.com/api/v1/genres
```

> The above command returns data structured like this:

```json
{
    "count": 2,
    "items": [
        {
            "genre": "Rock and roll",
            "songCount": 510
        },
        {
            "genre": "Bitcoin rap",
            "songCount": 23
        }
    ],
    "page": 0,
    "pageCount": 1,
    "perPage": 50
}
```

Returns a list of all genres

### HTTP Request

`GET https://music.tokenly.com/api/v1/genres`


### Query Parameters

Parameter | Description
--------- | -----------
limit     | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg        | current page offset (starting with 0)

