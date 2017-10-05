# Account Registration

Allows direct registration using account credentials.
        
## Register a New Account

Register a new account with the given email, username and password.

```php
<?php
$username = 'leroyjenkins';
$password = 'Sup3r$3K4et';
$email = 'leroy@tokenly.com';
$new_user = $api->registerAccount($username, $password, $email);
if($new_user){
    //success!
}
else{
    //failed
}


```

* **Endpoint:** **/api/v1/register**
* **Request Method:** POST
* **Authentication:** A valid `client_id` only
* **Returns:** 
   * `result (New User Object)`

**Request Parameters:**

Parameter           | Type        | Description
------------------- | ----------- | ------------------------------------
**client_id**       |  string     | A valid Tokenpass application client ID
**username**        |  string     | The username for the new user
**password**        |  string     | The plain text password for the new user
**email**           |  string     | The email address for the new user



## New User Object

Details returned for the new user object

```
{
    "id": "d2dd059f-1a62-4c0b-bc1f-00fce377d936",
    "username": "leroyjenkins",
    "email": "leroy@tokenly.com"
}

```

**Response variables**

Variable            | Type        | Description
------------------- | ----------- | ------------
**id**              |  string     | Unique ID for this user
**username**        |  string     | The username for the new user
**email**           |  string     | The email address for the new user


