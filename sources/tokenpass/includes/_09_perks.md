#Token Perks

*Token Perks* are privileges granted by ownership of this token.
        
##Get Token Perks

Returns the perks enabled by the given token.

```php
<?php
$perks = $api->getTokenPerks('TOKENLY');

```

* **Endpoint:** **/api/v1/perks/{token}**
* **Request Method:** GET
* **Authentication:** `none`
* **Returns:** 
   * `Token Perks Object`

**URL Parameters:**

Parameter           | Type        | Description
--------------------| ------------| ------------
**token**           |  string     | Name of the asset or token


##Token Perks Object

Details returned for token perks

```
{
  "token": "TOKENLY",
  "chatCount": 3
}

```

**Response variables**

Variable                  | Type        | Description
------------------------- | ------------| ------------
**token**                 |  string     | The name of the token or asset
**chatCount**             |  integer    | Number of active chats enabled by this token


