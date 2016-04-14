## Load a bot by ID

```php
<?php
$bot_id = '8baabb48-8250-4184-8342-e540244bda5b';
$bot_data = $api->getBotById($bot_id);
```

```shell
BOT_ID="8baabb48-8250-4184-8342-e540244bda5b"
curl -X GET https://swapbot.tokenly.com/api/v1/public/bot/$BOT_ID
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "id": "8baabb48-8250-4184-8342-e540244bda5b",
    "name": "The Official TOKENLY 'bot",
    "state": "active",
    "address": "1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb",
    "description": "This bot sells **TOKENLY**, a digital gift certificate...",
    "descriptionHtml": "<p>This bot sells <strong>TOKENLY</strong>, a digital gift certificate...",
    "logoImageDetails": {
        "fullUrl": "https://s3.amazonaws.com/tokenly-swapbot/images/d6c9594065c361575afab0229d49015e6872793ebf870875f89aa0b0b86dbfc7/full.png",
        "mediumUrl": "https://s3.amazonaws.com/tokenly-swapbot/images/d6c9594065c361575afab0229d49015e6872793ebf870875f89aa0b0b86dbfc7/medium.png",
        "thumbUrl": "https://s3.amazonaws.com/tokenly-swapbot/images/d6c9594065c361575afab0229d49015e6872793ebf870875f89aa0b0b86dbfc7/thumb.png"
    },
    "urlSlug": "the-official-tokenly-bot",
    "username": "adam",
    "hash": "0e28460cb598d6d9235554e89734fd3c4c620833e7c6c90d84ca120890bb813d",
    "lastChangedAt": "2016-03-21T12:19:45+0000",
    "balances": {
        "BTC": 0.06300014,
        "TOKENLY": 1672.98906687
    },
    "confirmationsRequired": 2,
    "swapRules": [
        {
            "discounts": [
                {
                    "moq": "4",
                    "pct": 0.05
                }
            ]
        }
    ],
    "swaps": [
        {
            "cost": "5",
            "direction": "sell",
            "divisible": false,
            "fiat": "USD",
            "in": "BTC",
            "min_out": "2",
            "out": "TOKENLY",
            "source": "bitcoinAverage",
            "strategy": "fiat"
        },
        {
            "direction": "buy",
            "in": "TOKENLY",
            "min": "1",
            "out": "LTBCOIN",
            "price": null,
            "rate": "15000",
            "strategy": "rate"
        }
    ]
}
```


Fetches all information about a bot by its id.

### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/bot/{botId}`


### URL Parameters

Parameter | Description
--------- | -----------
botId     | The bot identifier.


