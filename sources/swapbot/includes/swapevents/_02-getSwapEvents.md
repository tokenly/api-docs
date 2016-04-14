## Swap Events by Bot ID

```php
<?php
$bot_id = '8baabb48-8250-4184-8342-e540244bda5b';
$swap_data = $api->getSwapEvents($bot_id);
```

```shell
BOT_ID="8baabb48-8250-4184-8342-e540244bda5b"
curl -X GET https://swapbot.tokenly.com/api/v1/public/swapevents/$BOT_ID
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
[
    {
        "createdAt": "2016-04-09T10:10:41+0000",
        "event": {
            "assetIn": "BTC",
            "assetOut": "TOKENLY",
            "changeOut": 5.695e-05,
            "changeOutAsset": "BTC",
            "completedAt": 1460193013,
            "confirmations": 2,
            "confirmationsOut": 6,
            "destination": "1Na5Z6ZsKrD6TyhGZNRxsK75caiWqpwTCK",
            "isComplete": true,
            "isError": false,
            "name": "send.confirmed",
            "quantityIn": 0.0358522,
            "quantityOut": 3,
            "state": "complete",
            "txidIn": "9a2f970fcc4fc3ab2589d3f2cb51c05395cd44f516dccc0d362597b5921828b3",
            "txidOut": "5797cccee227cfbba1418dfcd78bdda2bd96a8f7ee9359fbd019a8ff710d724c",
            "type": "swap"
        },
        "id": "0399775b-57f8-470b-a008-bd8410203210",
        "level": 200,
        "message": "Sent 3 TOKENLY and 5695 satoshis (0.00005695) BTC in change to 1Na5Z6ZsKrD6TyhGZNRxsK75caiWqpwTCK with 6 confirmations.",
        "serial": 1460196641136,
        "swapUuid": "6a1df577-5c93-4faf-a393-72a8784191a6"
    },
    {
        "createdAt": "2016-04-10T18:48:49+0000",
        "event": {
            "assetIn": "XCP",
            "assetOut": "TOKENLY",
            "changeOut": 0,
            "changeOutAsset": "BTC",
            "completedAt": 1460312420,
            "confirmations": 2,
            "confirmationsOut": 6,
            "destination": "12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe",
            "isComplete": true,
            "isError": false,
            "name": "send.confirmed",
            "quantityIn": 7.53422725,
            "quantityOut": 2,
            "state": "complete",
            "txidIn": "44072a2a3c92cc88ce918a2ae3903abe1b6aa9fb417215a6cf822d75b0accf1c",
            "txidOut": "4e6609b8a8f014469364d14a68e78169d1b9c10fa8162b13dadfb84c5102573f",
            "type": "swap"
        },
        "id": "017bfb75-02d2-4522-a1c7-35bff7bd5681",
        "level": 200,
        "message": "Sent 2 TOKENLY to 12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe with 6 confirmations.",
        "serial": 1460314129707,
        "swapUuid": "aa57ec51-d7e3-4588-a13c-50fd12dd2d1d"
    }
]
```


Returns a list of swap events for the given bot.  This is a filtered list of swap events related to the bot.  For each swap, only the latest swap event is returned unless specified otherwise.  Older events are returned first.

For real time updates of events, see the Websocket section.

### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/swapevents/{botId}[?allevents=1]`


### URL Parameters

Parameter | Description
--------- | -----------
botId     | The bot identifier

### URL Query Parameters

Parameter   | Description
----------- | -----------
allevents   | If this is set, then all swap events are returned.  The default is to return only the latest swap event for each swap.
