## Load an Artist Profile

```php
<?php
$songs = $music_api->getArtistProfile('musiclover123');
```

```shell
curl -X GET https://music.tokenly.com/api/v1/artist/profile/7252c3bf-a672-4cec-80d3-9455d42e66ab
```

> The above command returns data structured like this:

```json
{
    "name": "Sample Artist Profile",
    "website": "http://mysite.foo",
    "bio": "This is a sample profile with __markdown__.",
    "active": true,
    "genre": "Bitcoin Rock",
    "tags": "bitcoin, rock, techno",
    "tagsArray": ["bitcoin", "rock", "techno"]
}

```

Returns the public profile information for an artist by id

### HTTP Request

`GET https://music.tokenly.com/api/v1/artist/profile/{uuid}`


### URL Parameters

Parameter | Description
--------- | -----------
uuid      | The uuid of the artist profile

