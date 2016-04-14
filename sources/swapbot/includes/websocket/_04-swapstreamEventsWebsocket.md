## Swapstream Events Websocket

```html
<head><title>Swapstream Events Example</title></head>
<body>
    <pre id="Events"></pre>
    <script src="https://pusher.tokenly.com/public/client.js"></script>
    <script>
        var BOT_ID = '8baabb48-8250-4184-8342-e540244bda5b';
        var client = new window.Faye.Client("https://pusher.tokenly.com/public");
        var el = document.getElementById('Events');
        var sep = "\n--------------------------------\n";
        client.subscribe("/swapbot_swapstream_"+BOT_ID, function (data) {
            el.innerHTML = el.innerHTML + (new Date()) + ": " + window.JSON.stringify(data) + sep;
        });
        el.innerHTML = el.innerHTML + (new Date()) + ": BEGIN " + sep;
    </script>
</body>
```

> The websocket returns events that look like this:

```json
{
    "createdAt": "2016-04-10T18:20:23+0000",
    "event": {
        "assetIn": "XCP",
        "assetOut": "TOKENLY",
        "changeOut": 0,
        "changeOutAsset": "BTC",
        "completedAt": 1460312420,
        "confirmations": 2,
        "confirmationsOut": 0,
        "destination": "12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe",
        "isComplete": false,
        "isError": false,
        "name": "swap.sent",
        "quantityIn": 7.53422725,
        "quantityOut": 2,
        "state": "sent",
        "txidIn": "44072a2a3c92cc88ce918a2ae3903abe1b6aa9fb417215a6cf822d75b0accf1c",
        "txidOut": "4e6609b8a8f014469364d14a68e78169d1b9c10fa8162b13dadfb84c5102573f",
        "type": "swap"
    },
    "id": "9ef23465-4c43-4b0a-a654-063eb0355179",
    "level": 200,
    "message": "Sent 2 TOKENLY to 12DmtEzT9ssUfzwEAShR1qveRQc5gnfxGe.",
    "serial": 1460312423994,
    "swapUuid": "aa57ec51-d7e3-4588-a13c-50fd12dd2d1d"
}
```


Returns a realtime feed of swapstream events via a websocket connection.  Swapstream events are events related to swap events happening on the Swapbot.

### Websocket Client Library

`https://pusher.tokenly.com/public/client.js`

### Channel Name

`/swapbot_swapstream_{botId}`
