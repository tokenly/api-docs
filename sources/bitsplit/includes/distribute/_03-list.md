## List Distributions

Obtain a list of distributions made by your account, ordered newest to oldest.

```php
<?php

$list = $client->listDistributions();
if($list){
    foreach($list as $distro){
        //do something
    }
}


```

**HTTP Method**  
```GET https://bitsplit.tokenly.com/api/v1/distribute```

**Authentication:** ```key```

**Returns:** ```result (array of Distribution List Objects)```
