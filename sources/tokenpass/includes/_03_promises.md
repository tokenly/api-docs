#Token Promises

A token promise (also called a *provisional transaction*) is a temporary modification to a user or bitcoin address's internally tracked balance
within Tokenpass. A promise must be made from a **source address** which contains a minimum balance of 
the amount to be promised. For TCA purposes, any promised balances are subtracted from the source address,
effectively lending access rights from one address or user to another. Source addresses go through a
proof of ownership process before they can be used (user verified addresses can be used as well). 

Token promises can be used to give customers instant access without waiting for bitcoin network confirmations,
and can be used for more advanced use cases such as access lending and rental systems.

##Register Source Address

```php
<?php
$api = new TokenpassAPI();
$address = '1CPM4nnf9sjD7aU46gQki8moNdxwwkfjbf';
$message = $address.'_'.hash('sha256', TOKENPASS_CLIENT);
$xchain_client = new Tokenly\XChainClient\Client(env('XCHAIN_URL'), env('XCHAIN_API_TOKEN'), env('XCHAIN_API_KEY'));
$proof = $xchain_client->signMessage($address, $message);
$register = $api->registerProvisionalSource($address, $proof, null);
if($register){
    //success
}
else{
    //failed
}

```

Registers a bitcoin address to the provisional source whitelist, allowing it to be used as a source for promises/provisional transactions.

0-conf transactions coming from source addresses are automatically registered as promises. 

* **Endpoint:** **/api/v1/tca/provisional/register**
* **Request Method:** POST
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Scopes required:** none
* **Returns:** ```result``` (boolean)

**Request Parameters:**

Parameter   | Type     | Description
----------- | ---------| ------------
**address** |  string  | Bitcoin address
**proof**   |  string  | Verification message signed by address
**assets**  |  mixed   | Array or comma separated string of assets to limit promises to (optional)

The ```proof``` parameter should be a signature of the following message format: ```<btc_address>_<sha256 hash of client_id>```

You may resubmit request with proof again to update list of restricted assets (or leave null to allow all).

##Delete Source Address

```php
<?php
$address = '1CPM4nnf9sjD7aU46gQki8moNdxwwkfjbf';
$delete = $api->deleteProvisionalSource($address);
if($delete){
    //success
}
else{
    //failed
}

```

Removes an address which you have previously registered from the provisional source whitelist.

* **Endpoint:** **/api/v1/tca/provisional/register/{address}**
* **Request Method:** DELETE
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** `result` (boolean)


##List Source Addresses

```php
<?php
$source_addresses = $api->getProvisionalSourceList();
if($source_addresses){
    foreach($source_addresses as $source_address){
        $address = $source_address['address'];
        $restricted_assets = $source_address['assets'];
        //do something
    }
}
```

Lists all source addresses you have registered using your API key.

* **Endpoint:** **/api/v1/tca/provisional**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * ```result (boolean)```
   * ```proof_suffix (string)```
   * ```whitelist (array of Source Address Objects)```


##Submit Provisional TX

```php
<?php
$source = '1CPM4nnf9sjD7aU46gQki8moNdxwwkfjbf';
$token = 'TOKENLY';
$amount = 1*100000000; //1 token converted to satoshi measurement
$destination = 'user:cryptonaut';
//lend this token for 1 hour
$promise = $api->promiseTransaction($source, $destination, $token, $amount, time()+3600);

if($promise){
    //success, save data somewhere
    $saved_data = $promise;
}
else{
    //failed
}

```

Submits a token promise to a desired username or address.

Note that you cannot submit promise transactions which would exceed the source address's real balance.

If a real txid/fingerprint is set, tokenpass will automatically remove this provisional tx after 2 confirmations (or when expiration hits).

* **Endpoint:** **/api/v1/tca/provisional/tx**
* **Request Method:** POST
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * ```result (boolean)```
   * ```tx (Provisional TX Object)```

**Request Parameters:**

Parameter       | Type        | Description
----------------| ------------| ------------
**source**      |  string     | Source address to use
**destination** |  string     | Destination bitcoin address or ```user:{username}```
**asset**       |  string     | Token to promise
**quantity**    |  integer    | Amount, in satoshis
**expiration**  |  timestamp  | Time that the promise expires, can be set to null
**txid**        |  string     | (optional) transaction ID of the real bitcoin transaction in-flight
**fingerprint** |  string     | (optional) xchain transaction fingerprint of the real btc tx
**ref**         |  string     | (optional) extra reference data
**note**        |  string     | (optional) note to display to user


##List Provisional TXs

```php
<?php
$list = $api->getPromisedTransactionList();
if($list){
    foreach($list as $promise){
        //do something
    }
}

```

Gives you a list of all token promises you have made with your API key. 

* **Endpoint:** **/api/v1/tca/provisional/tx**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * ```result (boolean)```
   * ```list (array of Provisional TX Objects)```

##Get Provisional TX

```php
<?php
$promise_id = $saved_data['promise_id'];
$get = $api->getPromisedTransaction($promise_id);
if($get){
    //promise tx found
}

```

Get details on a specific provisional transaction you have made.

* **Endpoint:** **/api/v1/tca/provisional/tx/{promise_id|txid|fingerprint}**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * ```result (boolean)```
   * ```tx (Provisional TX Object)```

##Cancel Provisional TX

```php
<?php
$promise_id = $saved_data['promise_id'];
$delete = $api->deletePromisedTransaction($promise_id);
if($delete){
    //success
}

```

Removes a promise you have made from the system.

* **Endpoint:** **/api/v1/tca/provisional/tx/{promise_id|txid|fingerprint}**
* **Request Method:** DELETE
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * ```result (boolean)```
   

##Update Provisional TX

```php
<?php
$id = $saved_data['promise_id'];
$new_time = time()+7200;
$new_data = array('expiration' => $new_time);
$update = $api->updatePromisedTransaction($id, $new_data);
if($update){
    //update success
}
else{
    //failed
}

```

Update details for a promise you have made, such as bumping the expiration time or including the real on-chain transaction ID.

* **Endpoint:** **/api/v1/tca/provisional/tx/{promise_id|txid|fingerprint}**
* **Request Method:** PATCH
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * ```result (boolean)```
   * ```tx (Provisional TX Object)```  
   
**Request Parameters:**

Parameter       | Type        | Description
----------------| ------------| ------------
**quantity**    |  integer    | (optional) Amount, in satoshis
**expiration**  |  timestamp  | (optional) Time that the promise expires, can be set to null
**txid**        |  string     | (optional) transaction ID of the real bitcoin transaction in-flight
**fingerprint** |  string     | (optional) xchain transaction fingerprint of the real btc tx
**ref**         |  string     | (optional) extra reference data 
**note**        |  string     | (optional) note to display to user

##Source Address Object

```
    {
        "address": "1CPM4nnf9sjD7aU46gQki8moNdxwwkfjbf",
        "assets": null
    }
```

Response data for addresses registered to the provisional source whitelist.

**Response variables**

Variable    | Type     | Description
----------- | -------- | ------------
**address** |  string  | Bitcoin address
**assets**  |  array   | Assets this address is restricted to for promises, can be null.


##Provisional TX Object

```
{
    "source": "1CPM4nnf9sjD7aU46gQki8moNdxwwkfjbf",
    "destination": "14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7",
    "asset": "WALMART",
    "quantity": 52500000000,
    "fingerprint": null,
    "txid": null,
    "ref": null,
    "expiration": 1472456354,
    "created_at": "2016-08-28 07:35:04",
    "updated_at": "2016-08-28 07:35:04",
    "pseudo": 0,
    "note": null,
    "promise_id": 42
}
```

Response data for individual provisional transactions / token promises.

**Response variables**

Variable        | Type        | Description
--------------- | ------------| ------------
**source**      |  string     | Source bitcoin address
**destination** |  string     | Destination user or address
**asset**       |  string     | Promised token
**quantity**    |  integer    | Amount promised, in satoshis
**fingerprint** |  string     | XChain transaction fingerprint, if available
**txid**        |  string     | Bitcoin transaction ID, if available
**ref**         |  string     | Optional reference data
**expiration**  |  integer    | Unix timestamp when this expires, or null
**created_at**  |  timestamp  | Time the promise was created
**updated_at**  |  timestamp  | Last time updated
**pseudo**      |  boolean    | If this is a "pseudo" token promise or not
**note**        |  string     | Optional note to display to user
**promise_id**  |  integer    | Internal ID for tracking this transaction.
