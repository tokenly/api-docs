## Get Album by Id

```php
<?php
$songs = $music_api->getAlbumById('79ace09e-07cc-4f4e-a25f-000000000001');
```

```shell
curl -X GET https://music.tokenly.com/api/v1/music/album/79ace09e-07cc-4f4e-a25f-000000000001
```

> The above command returns data structured like this:

```json
  {
    "id": "79ace09e-07cc-4f4e-a25f-000000000001",
    "name": "A Little Color EP",
    "description": "Released on January 10th, 2016 - A Little Color EP is Adam B. Levine's first release of original music under the name "Mind To Matter" and on the website mindtomatter.org. ",
    "songCount": 5,
    "artworkImage": "https://music.tokenly.com/path/to/image.png",
    "artistProfileID": "54fbbba5-7d7b-4fa6-bb91-000000000002"
  }

```

Returns a list of songs for a given album.

### HTTP Request

`GET https://music.tokenly.com/api/v1/music/album/{albumId}`


### URL Parameters

Parameter | Description
--------- | -----------
albumid   | The album identifier

