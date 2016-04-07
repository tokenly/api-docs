## Get All Albums


```php
$albums = $music_api->getAlbums();
```

```shell
curl -X GET https://music-stage.tokenly.com/api/v1/music/catalog/albums
```

> The above command returns data structured like this:

```json
[
  {
    "id": "cc6f8915-a7b3-4da1-aa5f-7e505291a181",
    "name": "A Little Color EP",
    "description": "Released on January 10th, 2016 - A Little Color EP is Adam B. Levine's first release of original music under the name "Mind To Matter" and on the website mindtomatter.org. ",
    "songCount": 5
  }
]
```

Lists all available publicly available albums.

### HTTP Request

`GET https://music-stage.tokenly.com/api/v1/music/catalog/albums`

