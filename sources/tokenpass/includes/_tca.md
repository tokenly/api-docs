#Token Controlled Access

Token Controlled Access (TCA) is the concept where access to content, features or special permissions within
an application are granted to a user based on the contents of their bitcoin (or other cryptocurrency) wallet. 
A user first registers one or more bitcoin addresses to their Tokenpass account and goes through a "proof of ownership" process, 
which involves signing a random message with the private key associated with their address. Your application then
makes requests to the Tokenpass API to check if a users' "inventory" contains the appropriate type and balance of the access tokens.
A simple true/false is returned indicating if the user meets the balance requirements or not.

##TCA Rules

When making a TCA request, it is possible to ask for more complicated combinations of requirements rather than just "does this user have at least X amount of MYTOKEN".
For instance, you can ask something like "does the user have 10,000 LTBCOIN OR 1 LTBSTAFF". Combinations and logic operators are defined in your query string
and come together to form the "TCA rule stack". The rule stack has three main types of fields, ```asset=balance```, ```op_x``` and ```stackOp_x```. 
Where ```x``` is the index of the ```asset=balance``` field to modify in the stack.

The following logic operators are available:

| op  | Description                        |
|-----|------------------------------------|
| >=  | Greater than or equal to (default) |
| >   | Greater than                       |
| =   | Equal to                           |
| ==  | Equal to                           |
| !=  | Does not equal                     |
| !   | Does not equal                     |
| <   | Less than                          |
| <=  | Less than or equal to              |

The following stack grouping operators are available:

| stackOp  | Description                                                          |
|-----------|----------------------------------------------------------------------|
| AND       | (default)                                                            |
| OR        | Rules previous to this are grouped together, e.g (AND AND) OR (this) |

An example TCA query looks like this:

``` /api/v1/tca/check/cryptonaut?LTBCOIN=10000&LTBSTAFF=1&op_0=>stack_Op_1=OR ```

The source code for the component which processes the TCA rule stack can be found [here](https://github.com/tokenly/token-controlled-access/blob/master/src/Tokenly/TCA/Access.php). 

##Check Token Access (User)

```php
<?php
$api = new TokenpassAPI();
$user = 'cryptonaut';
$rules = array('TOKENLY' => 1, 'LTBCOIN' => 100000, 'stackOp_0' => 'OR');
$check = $api->checkTokenAccess($user, $rules);
if($check){
    //grant access
}
else{
    //access denied
}

```

Check if a user holds the appropriate tokens for TCA. 

* **Endpoint:** **/api/v1/tca/check/{username}**
* **Request Method:** GET
* **Authentication:** ```client_id```
* **Scopes required:** ``tca```
* **Returns:** ```result``` (boolean)

##Check Token Access (Address)

```php
<?php
$address = '1CPM4nnf9sjD7aU46gQki8moNdxwwkfjbf';
$rules = array('TOKENLY' => 1, 'LTBCOIN' => 100000, 'stackOp_0' => 'OR');
$check = $api->checkAddressTokenAccess($address, $rules);
if($check){
    //grant access
}
else{
    //access denied
}

```

Check if a specific bitcoin address holds a certain combination of tokens for TCA, no account necessary.

* **Endpoint:** **/api/v1/tca/check-address/{address}**
* **Request Method:** GET
* **Authentication:** ```client_id```
* **Scopes required:** none
* **Returns:** ```result``` (boolean)
