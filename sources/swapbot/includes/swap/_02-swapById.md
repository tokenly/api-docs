## Swaps by Bot ID

```php
<?php
$bot_id = '8baabb48-8250-4184-8342-e540244bda5b';
$swaps_data = $api->getSwapsByBotId($bot_id);
```

```shell
BOT_ID="8baabb48-8250-4184-8342-e540244bda5b"
curl -X GET https://swapbot.tokenly.com/api/v1/public/swaps/$BOT_ID
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
[
    {
        "completedAt": "2016-04-10T18:20:23+0000",
        "createdAt": "2016-04-10T18:00:25+0000",
        "id": "aa57ec51-d7e3-4588-a13c-50fd12dd2d1d",
        "receipt": {
            "assetIn": "XCP",
            "assetOut": "TOKENLY",
            "changeOut": 0,
            "completedAt": 1460312420,
            "confirmations": 2,
            "confirmationsOut": 1,
            "conversionRate": 1.6616331972,
            "destination": "12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe",
            "quantityIn": 7.53422725,
            "quantityOut": 2,
            "timestamp": 1460312420,
            "txidIn": "44072a2a3c92cc88ce918a2ae3903abe1b6aa9fb417215a6cf822d75b0accf1c",
            "txidOut": "4e6609b8a8f014469364d14a68e78169d1b9c10fa8162b13dadfb84c5102573f",
            "type": "swap"
        },
        "state": "complete",
        "txid": "44072a2a3c92cc88ce918a2ae3903abe1b6aa9fb417215a6cf822d75b0accf1c",
        "updatedAt": "2016-04-10T18:23:58+0000"
    }
]
```


Fetches all of the swaps for the given bot.  The swaps may be in progress or complete.

### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/swaps/{botId}`


### URL Parameters

Parameter | Description
--------- | -----------
botId     | The bot identifier.


