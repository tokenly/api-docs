## All Bot Events Websocket

```php
<?php # see the html example
```

```shell
# see the html example
```

```html
<head><title>Bot Events Example</title></head>
<body>
    <pre id="Events"></pre>
    <script src="https://pusher.tokenly.com/public/client.js"></script>
    <script>
        var BOT_ID = '8baabb48-8250-4184-8342-e540244bda5b';
        var client = new window.Faye.Client("https://pusher.tokenly.com/public");
        var el = document.getElementById('Events');
        var sep = "\n--------------------------------\n";
        client.subscribe("/swapbot_events_"+BOT_ID, function (data) {
            el.innerHTML = el.innerHTML + (new Date()) + ": " + window.JSON.stringify(data) + sep;
        });
        el.innerHTML = el.innerHTML + (new Date()) + ": BEGIN " + sep;
    </script>
</body>
```

> The websocket returns events that look like this:

```json
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
```


Returns a realtime feed of all bot events via a websocket connection.  This is the firehose of all events for this bot.

### Websocket Client Library

`https://pusher.tokenly.com/public/client.js`

### Channel Name

`/swapbot_events_{botId}`
