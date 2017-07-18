## Send Password Reset Email


```php
<?php
$email = "user@test.com";
$profile = $music_api->sendPasswordResetEmail($email);
```

```shell
curl -X POST -H "Content-Type: application/json" https://music.tokenly.com/api/v1/password/reset-email \
    -d '{"email": "user@test.com"}'
```

> The above command returns data structured like this:

```json
{
    "success": true
}
```

Sends an email to reset the user's password via email.

### HTTP Request

`POST https://music.tokenly.com/api/v1/password/reset-email`

### Body Parameters

Parameter | Description
--------- | -----------
email     | The email address of the user to reset

