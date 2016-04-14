## All Events by bot ID

```php
<?php
$bot_id = '8baabb48-8250-4184-8342-e540244bda5b';
$bot_data = $api->getAllBotEvents($bot_id);
```

```shell
BOT_ID="8baabb48-8250-4184-8342-e540244bda5b"
curl -X GET https://swapbot.tokenly.com/api/v1/public/botevents/$BOT_ID
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
[
    {
        "createdAt": "2016-04-10T18:20:07+0000",
        "event": {
            "name": "swap.stateChange",
            "state": "confirming"
        },
        "id": "27d0ea71-fabd-4cfb-a2c5-c00b9ade70b9",
        "level": 100,
        "message": "Entered state confirming",
        "serial": 1460312407689,
        "swapUuid": "aa57ec51-d7e3-4588-a13c-50fd12dd2d1d"
    },
    {
        "createdAt": "2016-04-10T18:20:07+0000",
        "event": {
            "assetIn": "XCP",
            "assetOut": "TOKENLY",
            "changeOut": 0,
            "changeOutAsset": "BTC",
            "confirmations": 1,
            "destination": "12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe",
            "isComplete": false,
            "isError": false,
            "name": "swap.confirming",
            "quantityIn": 7.53422725,
            "quantityOut": 2,
            "state": "confirming",
            "txidIn": "44072a2a3c92cc88ce918a2ae3903abe1b6aa9fb417215a6cf822d75b0accf1c"
        },
        "id": "64b6f8f3-7dd9-4b30-b62b-31bd0d312916",
        "level": 200,
        "message": "Received 7.53422725 XCP  from 12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe with 1 confirmation.",
        "serial": 1460312407670,
        "swapUuid": "aa57ec51-d7e3-4588-a13c-50fd12dd2d1d"
    }
]
```


Returns a list of all bot events.  This is the firehose of all events for this bot.  This is useful for loading recent activity about a bot.  Newer events are returned first.

For real time updates of events, see the Websocket section.

### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/botevents/{botId}`


### URL Parameters

Parameter | Description
--------- | -----------
botId     | The bot identifier.

