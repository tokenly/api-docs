## Get Distribution

Get details on an individual distribution.

```php
<?php

$address = '1FhemSGz1FkRmAs8QhYTaDUztpMv16ki9D';
$get = $client->getDistributions($address);


```

**HTTP Method**  
```GET https://bitsplit.tokenly.com/api/v1/distribute/{id}```

**Authentication:** ```key```

**URL Parameters:**

Parameter   | Description
----------- | -------------
id          | distribution ID or deposit address


**Returns:** ```result (Distribution Object)```
