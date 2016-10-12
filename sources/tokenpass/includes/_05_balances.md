#Balance Lookups

The Tokenpass API allows authorized applications to query the combined balances of a user's addresses.  Applications authorized with the `tca` scope can receive the combined balances of public addresses.  Appllications authorized  with the `private-balances` OAuth permission scope can receive the combined balances of a user's public and private addresses.


##Get Combined Public Balances

```php
<?php
$api = new TokenpassAPI();
$balance_list = $api->getCombinedPublicBalances($oauth_token);
if ($balance_list) {
    foreach ($balance_list as $balance_entry) {
        echo "You have {balance_entry['balance']} of {balance_entry['name']}".PHP_EOL;
    }
}

```

* **Endpoint:** **/api/v1/tca/public/balances**
* **Request Method:** GET
* **Authentication:** `oauth_token`
* **Scopes:** `tca`
* **Returns:** 
   * `result (array of Balance Objects)`
   
The combined balances of public, active and verified addresses are returned.

##Get Combined Protected Balances

```php
<?php
$api = new TokenpassAPI();
$balance_list = $api->getCombinedProtectedBalances($oauth_token);
if ($balance_list) {
    foreach ($balance_list as $balance_entry) {
        echo "You have {balance_entry['balance']} of {balance_entry['name']}".PHP_EOL;
    }
}

```

* **Endpoint:** **/api/v1/tca/protected/balances**
* **Request Method:** GET
* **Authentication:** `oauth_token`
* **Scopes:** `private-balances`
* **Returns:** 
   * `result (array of Balance Objects)`
   
The combined balances of all active and verified addresses are returned, including addresses marked private.


##Balance Object

```
  {
      "asset": "ASSETONE",
      "name": "ASSETONE",
      "balance": 11,
      "balanceSat": "1100000000"
  }

```

Data returned by the balance lookup methods.

**Response variables**

Variable          | Type         | Description
----------------- | ------------ | ------------
**asset**         |  string      | The asset identifier such as `TOKENLY` or `A14212499953269578000`
**name**          |  string      | The short asset name.  For enhanced assets, the name may be different that the identifier
**balance**       |  float       | The conbined balance of this asset as a float
**balanceSat**    |  string      | The balance in satoshis
