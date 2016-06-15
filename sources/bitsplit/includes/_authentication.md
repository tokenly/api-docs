# Authentication

```php
<?php

$params = array(); //your input data
$params['key'] = BITSPLIT_KEY;
$query = http_build_query($params);
$request_hash = hash('sha256', $query.BITSPLIT_SECRET);

$url = 'https://bitsplit.tokenly.com/api/v1/endpoint?key='.BITSPLIT_KEY.'&request_hash='.$request_hash;

//make appropriate HTTP request etc.

```

All API methods require a **Client Key** for access, and some methods also require
 signing with the  **API Secret**.

For methods requiring Client Key, include the query parameter ```key=<MY CLIENT KEY>``` in your request.

For methods requiring the API Secret, the ```request_hash``` query parameter must be set.

To obtain the value for the ```request_hash``` parameter, create a hash using the following formula:

``` $request_hash = hash('sha256', $input_string.$api_secret); ```

Where ```$input_string``` is the combined http query string of endpoint query string + any json input, excluding ```request_hash``` itself.

