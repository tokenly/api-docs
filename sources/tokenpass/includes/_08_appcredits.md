#App Credits

*App credit groups* are custom types of points, or "credits" (database only), that your apps can use and
assign either arbitrarily, or to a Tokenpass user account. Useful for selling or rewarding non-token,
on-site credit and debiting or crediting for different types of interactions.

Use the API methods below to manage types of credits, create accounts and credit or debit balances. 
A double entry accounting system is used, so every debit has a corresponding credit etc. to keep the ledger balanced.

        
##Create New Credit Group

Register a new App Credit Group under your API user. Each credit group can be used by one or more OAuth client apps
by including the Client ID portion of their API keys to the ```app_whitelist``` field.

Note: Credit groups can only be deleted via the developer web interface.

```php
<?php
$name = "Bob's Credits";
$app_whitelist = array(TOKENPASS_CLIENT_ID);
$credit_group = $api->newAppCreditGroup($name, $app_whitelist);
if($credit_group){
    //success!
}
else{
    //failed
}


```

* **Endpoint:** **/api/v1/credits**
* **Request Method:** POST
* **Returns:** 
   * `credit_group (Credit Group Object)`

**Request Parameters:**

Parameter           | Type        | Description
--------------------| ------------| ------------
**name**            |  string     | Name of the credit group, e.g 'Streaming Credits'
**app_whitelist**   |  array      | Array of tokenpass api client ID's that can use and access these credits



##Update Credit Group

Update an existing App Credit Group.

```php
<?php
$new_name = "Bob's Store Credits";
$update = $api->updateAppCreditGroup($credit_group['uuid'], array('name' => $new_name));
if($update){
    //success
}
else{
    //failed
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}**
* **Request Method:** PATCH
* **Returns:** 
   * `credit_group (Credit Group Object)`

**Request Parameters:**

Parameter           | Type        | Description
--------------------| ------------| ------------
**name**            |  string     | Name of the credit group, e.g 'Streaming Credits'
**app_whitelist**   |  array      | Array of tokenpass api client ID's that can use and access these credits


##List Credit Groups

Retrieve a list of App Credit Groups under your API user.

```php
<?php
$credit_groups = $api->listAppCreditGroups();
if($credit_groups){
    foreach($credit_groups as $credit_group){
        //do something
    }
}

```

* **Endpoint:** **/api/v1/credits**
* **Request Method:** GET
* **Returns:** 
   * `list (array of Credit Group Objects)`


##Get Credit Group

Get basic details on a given App Credit Group

```php
<?php
$credit_group = $api->getAppCreditGroup($group_uuid);
if($credit_group){
    //do something
}
else{
    //not found
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}**
* **Request Method:** GET
* **Returns:** 
   * `credit_group (Credit Group Object)`


##Credit Group History

Get full credit/debit transaction history for a App Credit Group

```php
<?php
$tx_history = $api->getAppCreditGroupHistory($group_uuid);
if($tx_history){
    foreach($tx_history['transactions'] as $tx){
        //do something
    }
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}/history**
* **Request Method:** GET
* **Returns:** 
   * `balance (integer)` - should always be balanced at 0
   * `count (integer)` - number of entries
   * `transactions (array of Credit Transaction Objects)`


##List Credit Accounts

List all accounts registered under an App Credit Group

```php
<?php
$accounts = $api->listAppCreditAccounts($group_uuid);
if($accounts){
    foreach($accounts as $account){
        //do something
    }
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}/accounts**
* **Request Method:** GET
* **Returns:** 
   * `balance (integer)` - should always be balanced at 0
   * `count (integer)` - number of entries
   * `list (array of Credit Account Objects)`



##New Credit Account

Register a new account for a App Credit Group. Accounts can be either arbitrary or tied to a Tokenpass user.

To tie a credit account to a Tokenpass user, simply set the ```name``` field to the ```uuid``` of the Tokenpass account. 

```php
<?php
$name = '83468000-fc94-4016-8b54-27814c188980'; //tokenpass account UUID
$account = $api->newAppCreditAccount($group_uuid, $name);
if($account){
    //success
}


```

* **Endpoint:** **/api/v1/credits/{group_uuid}/accounts**
* **Request Method:** POST
* **Returns:** 
   * `account (Credit Account Object)`
   
**Request Parameters:**

Parameter           | Type        | Description
--------------------| ------------| ------------
**name**            |  string     | Name of the credit account, either tokenpass UUID or other


##Get Credit Account

Get details including balance for a given credit account.

```php
<?php
$account = $api->getAppCreditAccount($group_uuid, $account_uuid);
if($account){
    //do something
}
else{
    //not found
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}/accounts/{account_uuid}**
* **Request Method:** GET
* **Returns:** 
   * `account (Credit Account Object)`

##Credit Account History

Retrieve full credit/debit transaction history specifically for an app credit account.


```php
<?php
$tx_history = $api->getAppCreditAccountHistory($group_uuid, $account_uuid);
if($tx_history){
    $balance = $tx_history['account']['balance'];
    foreach($tx_history['transactions'] as $tx){
        //do something
    }
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}/accounts/{account_uuid}/history**
* **Request Method:** GET
* **Returns:** 
   * `account (Credit Account Object)`
   * `count (integer)` - number of entries
   * `transactions (array of Credit Transaction Objects)`   


##Give App Credits (credit)

Assign app credits to one or more accounts. Each account must be valid and already made.

A corresponding debit transaction is created for each credit entry in order to keep the ledger balanced.
The ```source``` parameter allows you to choose which credit account the debit tx applies to, otherwise the
default internal account ```_```` is used. 

```php
<?php
$accounts_amounts = array();
$accounts_amounts[] = array('account' => '83468000-fc94-4016-8b54-27814c188980', 'amount' => 5000):
$credit_txs = $api->giveMultipleAppCredit($group_uuid, $accounts_amounts);
if($credit_txs){
    //success
    foreach($credit_txs['transactions'] as $tx){
        $credit_entry = $tx['credit'];
        $debit_entry = $tx['debit'];
        
        //do something
    }
}
else{
    //failed
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}/accounts/credit**
* **Request Method:** POST
* **Returns:** 
   * `transactions (array)`
      * `credit (Credit Transaction Object)`
      * `debit (Credit Transaction Object)`
      
**Request Parameters:**

Parameter           | Type       | Description
--------------------| -----------| ------------
**accounts**        |  array     | List of one or more accounts to create credit tx entries for

**```accounts``` Field Array Parameters:**

Parameter          | Type       | Description
-------------------| -----------| ------------
**account**        | string     | Account name or UUID to credit
**amount**         | integer    | Number of credits to give them
**ref**            | string     | Optional custom reference data.
**source**         | string     | Optional account name or UUID to apply corresponding debit tx
      

##Take App Credits (debit)

Take away / debit app credits from one or more accounts. 

A corresponding credit transaction is created for each credit entry in order to keep the ledger balanced.
The ```destination``` parameter allows you to choose which credit account the credit tx applies to, otherwise the
default internal account ```_```` is used. 

```php
<?php
$accounts_amounts = array();
$accounts_amounts[] = array('account' => '83468000-fc94-4016-8b54-27814c188980', 'amount' => 2500):
$debit_txs = $api->takeMultipleAppCredit($group_uuid, $accounts_amounts);
if($debit_txs){
    //success
    foreach($debit_txs['transactions'] as $tx){
        $debit_entry = $tx['debit'];
        $credit_entry = $tx['credit'];
        
        //do something
    }
}
else{
    //failed
}

```

* **Endpoint:** **/api/v1/credits/{group_uuid}/accounts/debit**
* **Request Method:** POST
* **Returns:** 
   * `transactions (array)`
      * `debit (Credit Transaction Object)`
      * `credit (Credit Transaction Object)`
      
**Request Parameters:**

Parameter           | Type       | Description
--------------------| -----------| ------------
**accounts**        |  array     | List of one or more accounts to create debit tx entries for

**```accounts``` Field Array Parameters:**

Parameter               | Type       | Description
------------------------| -----------| ------------
**account**             | string     | Account name or UUID to debit
**amount**              | integer    | Number of credits to take from them
**ref**                 | string     | Optional custom reference data.
**destination**         | string     | Optional account name or UUID to apply corresponding credit tx


##Credit Group Object

Details returned for credit group methods.

```
{
  "name": "Store Credits",
  "uuid": "6b63093b-c7ab-40fc-b9e1-e26bd3258f69",
  "active": true,
  "app_whitelist": [
    "APITOKEN_001"
  ],
  "created_at": "2017-01-14 23:07:46",
  "updated_at": "2017-01-14 23:07:46"
}

```

**Response variables**

Variable            | Type        | Description
------------------- | ------------| ------------
**name**            |  string     | Name of the App Credit Group
**uuid**            |  string     | Credit group unique ID
**active**          |  boolean    | Active and available for use
**app_whitelist**   |  array      | Array of Tokenpass API Client IDs
**created_at**      |  timestamp  | Timestamp of date group was created
**updated_at**      |  timestamp  | Timestamp of last data update



##Credit Account Object

Details returned for credit account detail methods.

```
{
  "name": "6d206ea5-26b9-498f-b86c-ab990f7808e0",
  "uuid": "b40e8d61-728a-4ede-882c-65702daa820d",
  "balance": 2500,
  "tokenpass_user": {
    "uuid": "6d206ea5-26b9-498f-b86c-ab990f7808e0",
    "slug": "bob",
    "username": "Bob"
  },
  "created_at": "2017-01-14 23:06:22",
  "updated_at": "2017-01-14 23:06:22"
}

```

**Response variables**

Variable            | Type        | Description
------------------- | ------------| ------------
**name**            |  string     | Name of the App Credit Group
**uuid**            |  string     | Credit account unique ID
**balance**         |  integer    | Credit account balance
**tokenpass_user**  |  array      | Either ```false``` or array with fields ```username```, ```slug```, ```uuid```
**created_at**      |  timestamp  | Timestamp of date account was registered
**updated_at**      |  timestamp  | Timestamp of last account entry update



##Credit Transaction Object

Details returned for credit transaction history methods.

```
{
  "credit_group": "3a4572d5-c7b4-4b50-9594-5c31b4bafc45",
  "account": "82ff57d2-ebf3-40ad-982e-1133a2ea2214",
  "tokenpass_user": "air_casual_39",
  "account_uuid": "b0c36575-1c33-4123-8a08-e5d34c2d9274",
  "tx_uuid": "d4ceaa37-1863-4d25-8036-b958e0336427",
  "amount": "500",
  "created_at": "2017-01-14 23:04:04",
  "updated_at": "2017-01-14 23:04:04",
  "ref": null
}

```

**Response variables**

Variable                  | Type        | Description
------------------------- | ------------| ------------
**uuid**                  |  string     | Credit transaction unique ID
**app_credit_group_uuid** |  string     | Credit group ID
**account_uuid**          |  string     | Credit account ID
**account_name**          |  string     | Credit account name
**amount**                |  integer    | Amount to adjust account balance
**ref**                   |  string     | Optional extra reference data
**created_at**            |  timestamp  | Timestamp of when tx was created
**updated_at**            |  timestamp  | Timestamp of when entry was last updated

