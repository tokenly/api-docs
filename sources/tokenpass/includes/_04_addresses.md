#Address Management

The Tokenpass API allows advanced applications using the `manage-address` and `private-address` OAuth permission scopes to
modify or look at a user's list of registered & verified bitcoin addresses. Addresses are also sometimes referred to as "Pockets", and
token balances as the "inventory".


##Get Personal Address List

```php
<?php
$api = new TokenpassAPI();
$user = 'cryptonaut';
$address_list = $api->getAddressesForAuthenticatedUser($oauth_token);
if($address_list){
    foreach($address_list as $address){
        //do something
    }
}

```

* **Endpoint:** **/api/v1/tca/addresses**
* **Request Method:** GET
* **Authentication:** `oauth_token`
* **Scopes:** `tca`
* **Optional Scopes:** `private-address`, `manage-address`
* **Returns:** 
   * `result (array of User Address Objects)`
   
If the `private-address` scope is not enabled, only public and verified addresses are returned.

If the requested user has connected to your application with the `private-address` scope applied, you will be returned all public, private, verified and non-verified addresses on their account.



##Register Address

```php
<?php

$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$label = 'My test address';
$public = true;
$register = $api->registerAddress($address, $oauth_token, $label, $public);
if($register){
    //success
}
else{
    //failed
}


```

Registers a bitcoin address to the system. 

An address must go through a proof of ownership process before
it can be used for token access purposes.

For security reasons, addresses registered via API cannot be used for logging in or for two-factor authentication.

* **Endpoint:** **/api/v1/tca/address**
* **Request Method:** POST
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-address`
* **Returns:** 
   * `result (User Address Object)`
   
**Request Parameters:**

Parameter   | Type        | Description
------------| ------------| ------------
**address** |  string     | Bitcoin address to register
**label**   |  string     | Optional display label
**public**  |  boolean    | If this address is publicly viewable or not, default false
**active**  |  boolean    | Make this address active for TCA, or not, default true
**type**    |  string     | Network type (only `btc` supported, default)

##Get Personal Address Details

```php
<?php
$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$details = $api->getAddressDetailsForAuthenticatedUser($address, $oauth_token);
if($details){
    //address found, do something
}



```

Get information about a specific registered bitcoin address, including a list of token balances.

* **Endpoint:** **/api/v1/tca/address/{address}**
* **Request Method:** GET
* **Authentication:** `oauth_token`
* **Scopes:**  `tca`
* **Optional Scopes:** `private-address`, `manage-address`
* **Returns:** 
   * `result (User Address Object)`

##Verify Address

```php
<?php
$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$details = $api->getAddressDetailsForAuthenticatedUser($address, $oauth_token);
if($details){
    $message = $details['verify_code'];
    $xchain_client = new Tokenly\XChainClient\Client(env('XCHAIN_URL'), env('XCHAIN_API_TOKEN'), env('XCHAIN_API_KEY'));
    $signature = $xchain_client->signMessage($address, $message);
    $verify = $api->verifyAddress($address, $oauth_token, $signature);
    if($verify){
        //verification success
    }
    else{
        //signature invalid or other error
    }
}

```

Provide Tokenpass a proof-of-ownership signature to verify a registered bitcoin address.

* **Endpoint:** **/api/v1/tca/address/{address}**
* **Request Method:** POST
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-address`
* **Returns:** 
   * `result (boolean)`
   
**Request Parameters:**

Parameter     | Type        | Description
--------------| ------------| ------------
**signature** |  string     | Signed message of the `verify_code` field from the `User Address Object`


##Update Address

```php
<?php
//toggle address inactive
$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$user = 'cryptonaut';
$active = false;
$update = $api->updateAddressDetails($address, $oauth_token, null, null, $active);
if($update){
    //update success
}
else{
    //failed
}


```

Update the basic details on a registered address.

* **Endpoint:** **/api/v1/tca/address/{address}**
* **Request Method:** PATCH
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-address`
* **Returns:** 
   * `result (User Address Object)`
   
**Request Parameters:**

Parameter    | Type        | Description
-------------| ------------| ------------
**label**    |  string     | (optional) Display label
**public**   |  boolean    | (optional) toggle address public/private
**active**   |  boolean    | (optional) toggle active state of address

##Delete Address

```php
<?php
//toggle address inactive
$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$active = false;
$delete = $api->deleteAddres($address, $oauth_token);
if($delete){
    //delete success
}
else{
    //failed
}


```

Remove a registered bitcoin address from the system.

* **Endpoint:** **/api/v1/tca/address/{address}**
* **Request Method:** DELETE
* **Authentication:** `oauth_token`
* **Scopes:**  `manage-address`
* **Returns:** 
   * `result (boolean)`

##Instant Register & Verify

This method allows addresses to be registered and verified on a user account using a single request
and with minimal authentication required. 

The Pockets management section in the Tokenpass user dashboard generates a unique verification code tied to their current browser session.
This code can be read either via browser extension or by scanning the provided QR code, and then used to complete a valid instant verification request.

For browser extensions, look for the HTML element with ID `#instant-address-qr` and then look at the `data-verify-message` property.


* **Endpoint:** **/api/v1/instant-verify/{username}**
* **Request Method:** POST
* **Authentication:** none
* **Scopes:**  none
* **Returns:** 
   * `result (boolean)`
   
   
**Request Parameters:**

Parameter   | Type      | Description
------------| ----------| ------------
**msg**     |  string   | Verification message obtained from QR code
**address** |  string   | Bitcoin address to register
**sig**     |  string   | Signed message of the `msg` field from the bitcoin address.


##Lookup User By Address

```php
<?php
$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$lookup = $api->lookupUserByAddress($address);
if($lookup){
    //send them an email
}
```

Search to see if a bitcoin address belongs to any users in Tokenpass (address must be set to public).

* **Endpoint:** **/api/v1/lookup/address/{address}**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Scopes:**  none
* **Returns:** 
   * `result (User Lookup Object)`


##Get Public Address List

```php
<?php
$api = new TokenpassAPI();
$user = 'cryptonaut';
$address_list = $api->getPublicAddresses($user);
if($address_list){
    foreach($address_list as $address){
        //do something
    }
}

```

* **Endpoint:** **/api/v1/tca/addresses/{username}**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Scopes:** none
* **Returns:** 
   * `result (array of User Address Objects)`
   
Only addresses that are active, verified and marked public are returned.


##Get Public Address Details

```php
<?php
$address = '14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7';
$username = 'cryptonaut';
$details = $api->getPublicAddressDetails($username, $address);
if($details){
    //address found, do something
}



```

Get information about a specific registered bitcoin address, including a list of token balances.  Only active and public addresses are available.

* **Endpoint:** **/api/v1/tca/address/{username}/{address}**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Returns:** 
   * `result (User Address Object)`


##Lookup Address By User

```php
<?php
$user = 'cryptonaut';
$lookup = $api->lookupAddressByUser($user);
if($lookup){
    //send them some tokens to their public address
}


```

Get the first (public) registered bitcoin address owned by this user.

* **Endpoint:** **/api/v1/lookup/user/{username}**
* **Request Method:** GET
* **Authentication:** hmac signature with `client_id` and `client_secret`
* **Scopes:**  none
* **Returns:** 
   * `result (User Lookup Object)`

##User Address Object

```
{
    "address": "14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7",
    "balances": {
        "A11135283252627285275": 100000000,
        "A11147438449329202874": 100000000,
        "WALMART": "52500000000"
    },
    "public": true,
    "label": "Test address",
    "active": true,
    "verified": true
}

```

Details returned for individual registered/verified bitcoin addresses.

**Response variables**

Variable          | Type        | Description
----------------- | ------------| ------------
**address**       |  string     | Bitcoin address
**balances**      |  array      | Array of token balances in format Asset => Quantity
**public**        |  boolean    | If this address is set to public or not
**label**         |  string     | Optional display label
**active** *      |  boolean    | Active toggle
**verified** *    |  boolean    | If this address is verified or not
**verify_code** * |  string     | Verification code to sign

\* only shown if `oauth_token` provided with `manage-address` scope.

`verify_code` is only included if address unverified.

##User Lookup Object

```
{
    "username": "Cryptonaut",
    "address": "14eRVGNPQChSmSmNLH6RPjdwsNPc7rH2Z7",
    "email": "nick@tokenly.com"
}

```

Data returned by the lookup address by user / user by address methods.

**Response variables**

Variable          | Type        | Description
----------------- | ------------| ------------
**username**      |  string     | Tokenpass username
**address**       |  string     | Bitcoin address
**email**         |  string     | Email address of user, depending on their user preferences
