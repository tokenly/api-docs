## Bot Events by Bot ID

```php
<?php
$bot_id = '8baabb48-8250-4184-8342-e540244bda5b';
$bot_data = $api->getBotEventStream($bot_id);
```

```shell
BOT_ID="8baabb48-8250-4184-8342-e540244bda5b"
curl -X GET https://swapbot.tokenly.com/api/v1/public/boteventstream/$BOT_ID
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
[
  {
      "createdAt": "2015-07-29T01:08:16+0000",
      "event": {
          "assetOut": "BTC",
          "destination": "14ap1ewpdBPQZSZAcAtvy6nWyJCZ75ubHQ",
          "isActive": true,
          "name": "income.forwarded",
          "quantityOut": 0.09,
          "state": "active",
          "txid": "e03dc38d0598607d1fb7214ce37d6933f6b6098f55b23e1d504f5287f8ce9946"
      },
      "id": "1bca2e06-e85b-47a0-81a8-3118d01466f3",
      "level": 200,
      "message": "Sent an income forwarding payment of 0.09 BTC to 14ap1ewpdBPQZSZAcAtvy6nWyJCZ75ubHQ with transaction ID e03dc38d0598607d1fb7214ce37d6933f6b6098f55b23e1d504f5287f8ce9946.",
      "serial": 1438132096384
  },
  {
      "createdAt": "2015-07-29T11:31:15+0000",
      "event": {
          "assetOut": "BTC",
          "confirmations": 1,
          "destination": "14ap1ewpdBPQZSZAcAtvy6nWyJCZ75ubHQ",
          "isActive": true,
          "name": "income.forwardSent",
          "quantityOut": 0.09,
          "state": "active",
          "txid": "e03dc38d0598607d1fb7214ce37d6933f6b6098f55b23e1d504f5287f8ce9946"
      },
      "id": "56428ec5-383f-4fb7-847d-977137a6ac65",
      "level": 100,
      "message": "Income of 0.09 BTC was forwarded to 14ap1ewpdBPQZSZAcAtvy6nWyJCZ75ubHQ with 1 confirmation.",
      "serial": 1438169475505
  }
]
```


Returns a list of 'Bostream' events for this bot.  Botstream events are events related to the configuration and lifecycle of the Swapbot.  Older events are returned first.

Despite its name, this is not a websocket endpoint.  For real time updates of events, see the Websocket section.

### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/botevents/{botId}`


### URL Parameters

Parameter | Description
--------- | -----------
botId     | The bot identifier.

