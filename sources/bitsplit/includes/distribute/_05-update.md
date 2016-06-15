## Update Distribution

Update (limited) details on a distribution.

**HTTP Method**  
```PATCH https://bitsplit.tokenly.com/api/v1/distribute/{id}```

**Authentication:** ```key``` + ```request_hash```

```php
<?php

//put distribution on hold
$address = '1FhemSGz1FkRmAs8QhYTaDUztpMv16ki9D';
$hold = 1;
$params = array('hold' => $hold);
$update = $client->updateDistribution($address, $params);

```

**URL Parameters:**

Parameter   | Description
----------- | -------------
id          | distribution ID or deposit address

**Request Parameters:**

Parameter   | Type     | Description
----------- | ---------| ------------
**label**   |  string  | Reference label, shows up on notifications
**webhook** |  string  | Endpoint to receive webhook notifications.
**hold**    |  boolean | Toggle hold mode on distribution


**Returns:** ```result (Distribution Object)```
