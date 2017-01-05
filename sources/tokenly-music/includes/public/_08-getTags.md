## Get Tags

```php
<?php
$songs = $music_api->getTags();
```

```shell
curl -X GET https://music.tokenly.com/api/v1/tags
```

> The above command returns data structured like this:

```json
{
    "count": 2,
    "items": [
        {
            "tag": "instrumental",
            "songCount": 250
        },
        {
            "tag": "FLAC",
            "songCount": 50
        }
    ],
    "page": 0,
    "pageCount": 1,
    "perPage": 50
}
```

Returns a list of all tags

### HTTP Request

`GET https://music.tokenly.com/api/v1/tags`


### Query Parameters

Parameter | Description
--------- | -----------
limit     | Limit the number of results returned per page (optional, defaults to 50, maximum is 50)
pg        | current page offset (starting with 0)

