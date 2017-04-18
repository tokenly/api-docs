# Token Chats

Create, Edit and Retrieve Token Chat information 


## Create a Token Chat

```php
<?php
$create_vars = [
    'name'     => 'API Chat One',
    'tca_rules' => [
        [
            'token'    => 'COINONE',
            'quantity' => 100000000,
        ],
    ],
    'active'   => true,
];

$new_token_chat = $api->createChat($oauth_token, $create_vars);

```


```javascript
// not implemented in the javascript API yet
```

> The API call returns data structured like this:

```json
{
    "name": "My Chat",
    "active": true,
    "tca_rules": [
        {
            "token": "COINONE",
            "quantity": 100000000
        }
    ]
}

```


Create a new token chat

* **Endpoint:** **/api/v1/chats**
* **Request Method:** POST
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-chats`
* **Returns: the new token chat** 

**Request Parameters:**

Parameter           | Type        | Description
--------------------| ------------| ------------
**name**            |  string     | Chat Name
**active**          |  boolean    | Whether the chat is active
**tca_rules**       |  array      | An array of TCA rules with token and quantity parameters.  If any of the rules are satisfied, access is granted.



## Edit a Token Chat

```php
<?php
$update_vars = [
    'tca_rules' => [
        [
            'token'    => 'COINONE',
            'quantity' => 100000000,
        ],
        [
            'token'    => 'COINTWO',
            'quantity' => 500000000,
        ]
    ]
];

$token_chat = $api->updateChat($oauth_token, $chat_uuid, $update_vars);

```


```javascript
// not implemented in the javascript API yet
```

> The API call returns data structured like this:

```json
{
    "name": "My Chat",
    "active": true,
    "tca_rules": [
        {
            "token": "COINONE",
            "quantity": 100000000
        },
        {
            "token": "COINTWO",
            "quantity": 500000000
        }
    ]
}

```


Update a token chat owned by the current user

* **Endpoint:** **api/v1/chat/{chatId}**
* **Request Method:** POST
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-chats`
* **Returns: the updated token chat** 

**URL Parameters:**

Parameter   | Description
----------- | -------------
chatId      | A token chat UUID


**Request Parameters:**

Parameter           | Type        | Description
--------------------| ------------| ------------
**active**          |  boolean    | Whether the chat is active
**tca_rules**       |  array      | An array of TCA rules with token and quantity parameters.  If any of the rules are satisfied, access is granted.


```


## Retrieve a Token Chat

```php
<?php
$token_chat = $api->getChat($oauth_token, $chat_uuid);

```


```javascript
// not implemented in the javascript API yet
```

> The API call returns data structured like this:

```json
{
    "name": "My Chat",
    "active": true,
    "tca_rules": [
        {
            "token": "COINONE",
            "quantity": 100000000
        },
        {
            "token": "COINTWO",
            "quantity": 500000000
        }
    ]
}

```


Update a token chat owned by the current user

* **Endpoint:** **api/v1/chat/{chatId}**
* **Request Method:** GET
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-chats`
* **Returns: the token chat** 

**URL Parameters:**

Parameter   | Description
----------- | -------------
chatId      | A token chat UUID

