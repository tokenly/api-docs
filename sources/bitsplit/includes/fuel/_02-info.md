## Get Fuel Info

```php

$info = $client->getFuelInfo();
$fuel_address = $info['fuel_address'];
$fuel_balance = $info['fuel_balanceFloat'];

```

Gets fuel address and balance info.

**HTTP Method**  
```GET https://bitsplit.tokenly.com/api/v1/self```

**Authentication:** ```key```

**Returns:** ```result (Fuel Info Object)```
