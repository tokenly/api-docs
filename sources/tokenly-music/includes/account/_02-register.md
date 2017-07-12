## Register

```php
<?php
$username = 'leroyjenkins';
$password = 'ASecretP4$$w0RD';
$email = 'leroyjenkins@test.com';
$invite_code = 'I9XDJ1';
$user_data = $music_api->registerAccount($username, $password, $email, $invite_code);
```

```shell
NEW_USERNAME='leroyjenkins'
NEW_PASSWORD='ASecretP4$$w0RD'
NEW_EMAIL='leroyjenkins@test.com'
INVITE_CODE='I9XDJ1'

curl -H "Content-Type: application/json" -X POST \
  -d '{"username":"'$NEW_USERNAME'","password":"'$NEW_PASSWORD'","email":"'$NEW_EMAIL'","code":"'$INVITE_CODE'"}' \
  https://music.tokenly.com/api/v1/account/register 

```

> The above command returns data structured like this:

```json
{
    "id": "7a000000-8000-a000-b000-cc0000000000",
    "username": "leroyjenkins",
    "email": "leroyjenkins@test.com",
    "apiSecretKey": "Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "apiToken": "Txxxxxxxxxxxxxxx"
}
```

Registers a new username and password.

This username must not exist in Tokenly Music or Tokenpass.  If the user already exists in Tokenpass, use the <a href="#login">login</a> method instead.

### HTTP Request

`POST https://music.tokenly.com/api/v1/account/register`


### POST Parameters

Parameter | Description
--------- | -----------
username  | The new username
password  | The new password
email     | The new email address
code      | The invitation code

<aside class="notice">The POST data should be a json encoded string</aside>

