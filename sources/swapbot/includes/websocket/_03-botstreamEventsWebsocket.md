## Botstream Events Websocket

```html
<head><title>Botstream Events Example</title></head>
<body>
    <pre id="Events"></pre>
    <script src="https://pusher.tokenly.com/public/client.js"></script>
    <script>
        var BOT_ID = '8baabb48-8250-4184-8342-e540244bda5b';
        var client = new window.Faye.Client("https://pusher.tokenly.com/public");
        var el = document.getElementById('Events');
        var sep = "\n--------------------------------\n";
        client.subscribe("/swapbot_botstream_"+BOT_ID, function (data) {
            el.innerHTML = el.innerHTML + (new Date()) + ": " + window.JSON.stringify(data) + sep;
        });
        el.innerHTML = el.innerHTML + (new Date()) + ": BEGIN " + sep;
    </script>
</body>
```

> The websocket returns events that look like this:

```json
{
    "createdAt": "2016-04-06T15:30:19+0000",
    "event": {
        "assetOut": "BTC",
        "destination": "14ap1ewpdBPQZSZAcAtvy6nWyJCZ75ubHQ",
        "isActive": true,
        "name": "income.forwarded",
        "quantityOut": 0.09,
        "state": "active",
        "txid": "d4184befa330e6c793a04f3ce08b9c56e343eb4df86d5fce7f05a28616de8334"
    },
    "id": "1d21a3b9-db68-4cb8-ac88-031d2df2d61f",
    "level": 200,
    "message": "Sent an income forwarding payment of 0.09 BTC to 14ap1ewpdBPQZSZAcAtvy6nWyJCZ75ubHQ with transaction ID d4184befa330e6c793a04f3ce08b9c56e343eb4df86d5fce7f05a28616de8334.",
    "serial": 1459956619843
}
```


Returns a realtime feed of botstream events via a websocket connection.  Botstream events are events related to the configuration and lifecycle of the Swapbot.

### Websocket Client Library

`https://pusher.tokenly.com/public/client.js`

### Channel Name

`/swapbot_botstream_{botId}`
