## Load a User Profile

```php
<?php
$songs = $music_api->findProfile('musiclover123');
```

```shell
curl -X GET https://music.tokenly.com/api/v1/profiles/musiclover123
```

> The above command returns data structured like this:

```json
{
    "bio": "I luv music."
}
```

Returns the public profile information for a user by username

### HTTP Request

`GET https://music.tokenly.com/api/v1/profiles/{username}`


### URL Parameters

Parameter | Description
--------- | -----------
username  | The username to find

