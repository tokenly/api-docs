# TCA Messenging

The TCA Messenging API supports returns data used to determine privileges when sending messages to token owners.


## Get Messaging Permission Status

```php
<?php
// not implemented in the PHP API yet
```


```javascript
// not implemented in the javascript API yet
```

> The API call  returns data structured like this:

```json
{
    "token": "TOKENLY",
    "canMessage": true
}

```


Get information about a specific token for the current user

* **Endpoint:** **/api/v1/tca/messenger/privileges/{token}**
* **Request Method:** GET
* **Authentication:** `oauth_token`
* **Scopes:**  `tca`
* **Returns: the token name and a canMessage flag.  `canMessage` is true if the user can send messages for this token** 

