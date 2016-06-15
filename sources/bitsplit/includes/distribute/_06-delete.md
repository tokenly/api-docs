## Delete Distribution

Removes distribution from the system.  

Cannot delete non-completed distributions which have received funds and are in progress.

**HTTP Method**  
```DELETE https://bitsplit.tokenly.com/api/v1/distribute/{id}```

```php
<?php

$address = '1FhemSGz1FkRmAs8QhYTaDUztpMv16ki9D';
$delete = $client->deleteDistribution($address);
if($delete){
    //success
}
else{
    //failure
}

```

**Authentication:** ```key``` + ```request_hash```

**URL Parameters:**

Parameter   | Description
----------- | -------------
id          | distribution ID or deposit address


**Returns:** ```result (boolean)```
