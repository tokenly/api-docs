## Create Distribution

This method will initiate a new token distribution to a desired set of addresses.
A deposit address will be generated and the system will wait for the tokens to arrive before continuing to next stage.

Must send to at least ```3``` or more unique addresses. 

**HTTP Method**  
```POST https://bitsplit.tokenly.com/api/v1/distribute/create```

**Authentication:** ```key``` + ```request_hash```

```php
<?php

$asset = 'LTBCOIN';
$send_list = array();
$send_list['1AnxkFGEwjN4XL4ZWpbQ36wubFcxnwTU5K'] = 100000;
$send_list['1CTKPjRMiMAcyywy1KRs9JZShWiRUudqnS '] = 100000;
$send_list['19ADjZ2CUKP2kkh2qzmpGd5CYAMJNQ896V '] = 250000;
$use_fuel = true;
$label = 'My test distribution';

$client = new BitsplitClient(BITSPLIT_HOST, BITSPLIT_KEY, BITSPLIT_SECRET);
$create = $client->createDistribution($asset, $send_list, $use_fuel, array('label' => $label));

if($create){
    //success
    $id = $create['id'];
    $address = $create['deposit_address'];
}

```

###Request Parameters

Parameter         | Type     | Description
-----------       | ---------| ------------
**asset**         |  string  | Token to distribute - required
**address_list**  |  array   | List of addresses and amounts to send - required
**use_fuel**      |  boolean | Automatically source bitcoin fees from fuel address
**value_type**    |  string  | fixed or percent
**asset_total**   |  float   | Total amount to split if using percent value_type
**label**         |  string  | Reference label, shows up on notifications
**webhook**       |  string  | Endpoint to receive webhook notifications.
**hold**          |  boolean | Start the distribution in hold mode.


**Returns:** ```result (Distribution Object)```
