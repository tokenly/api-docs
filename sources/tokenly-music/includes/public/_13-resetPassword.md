## Reset Password


```php
<?php
$email = "user@test.com";
$token = "ABCD23";
$new_password = "S3creTpA55w0rd!!";
$profile = $music_api->resetPassword($email, $token, $new_password);
```

```shell
curl -X POST -H "Content-Type: application/json" https://music.tokenly.com/api/v1/password/reset \
    -d '{"email": "user@test.com", "token": "ABCD23", "password": "S3creTpA55w0rd!!"}'
```

> The above command returns data structured like this:

```json
{
    "success": true
}
```

Resets the user's password.

### HTTP Request

`POST https://music.tokenly.com/api/v1/password/reset`

### Body Parameters

Parameter | Description
--------- | -----------
email     | The email address of the user to reset the password
token     | The reset token assigned to the user 
password  | The new password

