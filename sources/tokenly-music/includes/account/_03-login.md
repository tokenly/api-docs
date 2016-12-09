## Login

```php
<?php
$username = 'leroyjenkins';
$password = 'ASecretP4$$w0RD';
$user_data = $music_api->login($username, $password);
```

```shell
EXISTING_USERNAME='leroyjenkins'
EXISTING_PASSWORD='ASecretP4$$w0RD'

curl -H "Content-Type: application/json" -X POST \
  -d '{"username":"'$EXISTING_USERNAME'","password":"'$EXISTING_PASSWORD'"}' \
  https://music.tokenly.com/api/v1/account/login 

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

Get a user's API credentials with a username and password.

This muser must exist in Tokenly Music or TokenPass.  If the user with these credentials exists in TokenPass but not in Tokenly Music, then Tokenly Music will create a new account based on the TokenPass account.

### HTTP Request

`POST https://music.tokenly.com/api/v1/account/login`


### POST Parameters

Parameter | Description
--------- | -----------
username  | The existing username
password  | The existing password

<aside class="notice">The POST data should be a json encoded string</aside>

