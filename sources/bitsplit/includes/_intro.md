
# Bitsplit API

Welcome to the Bitsplit API. [Bitsplit](https://bitsplit.tokenly.com) is a cryptocurrency mass token distribution and payment routing service.
Currently supporting Counterparty tokens only.

Visit [bitsplit.tokenly.com](https://bitsplit.tokenly.com) and go to your dashboard to obtain an API key pair.

```php
<?php
use Tokenly/BitsplitClient/Client as BitsplitClient;

$base_url = 'https://bitsplit.tokenly.com';
$key = BITSPLIT_KEY;
$secret = BITSPLIT_SECRET;

$client = new BitsplitClient($base_url, $key, $secret);

```

If you are using PHP, we recommend you use the ```BitsplitClient\Client``` class for easier API interaction. 

Download from github [here](https://github.com/tokenly/bitsplit-client) or include it in your
*Composer* compatible project using  
 ```composer require tokenly/bitsplit-client```. 
