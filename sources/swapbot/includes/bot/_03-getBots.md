## Search for Bots

```php
<?php
$bot_id = '8baabb48-8250-4184-8342-e540244bda5b';
$bot_data = $api->getBotById($bot_id);
```

```shell
curl -X GET "http://swapbot.tokenly.com/api/v1/public/bots?name=tokenly"
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
[
  {
    "id": "e5cb4df3-b85e-4194-a673-c9d45c2b8117",
    "name": "Tokenly's SWAPBOTMONTH Vendor",
    "username": "adam",
    "botUrl": "https://swapbot.tokenly.com/bot/adam/tokenlys-swapbotmonth-vendor",
    "descriptionHtml": "This bot sells <strong>SWAPBOTMONTH</strong>, a digital gift certificate token that is redeemable for...",
    "robohashImage": "https://robohash.tokenly.com/0fbcfc58b9e571bd221710af2d46556c426a47122283a29df460d8ccb6c2169f.png?set=set3",
    "backgroundImage": "https://s3.amazonaws.com/tokenly-swapbot/images/4a0d9687d068e157e5f96974a15794274b5582504684673131e290aa7bd49061/full.jpg",
    "logoImage": "https://s3.amazonaws.com/tokenly-swapbot/images/cdd95d3b306d015442243b5357641c6bc7efcdd721f76c086f04c62dc19f3267/thumb.png",
    "swaps": [
      {
        "strategy": "fiat",
        "direction": "sell",
        "in": "BTC",
        "out": "SWAPBOTMONTH",
        "cost": "7",
        "divisible": false,
        "min_out": "1",
        "type": "buy",
        "fiat": "USD",
        "source": "bitcoinAverage"
      }
    ],
    "balances": {
      "BTC": 0.0009098,
      "SWAPBOTMONTH": 492
    },
    "address": "17B6qaNi6UxjbA8iZp4UAAqFxsd1CYnnSh"
  },
  {
    "id": "8baabb48-8250-4184-8342-e540244bda5b",
    "name": "The Official TOKENLY 'bot",
    "username": "adam",
    "botUrl": "https://swapbot.tokenly.com/bot/adam/the-official-tokenly-bot",
    "descriptionHtml": "<p>This bot sells <strong>TOKENLY</strong>, a digital gift certificate...",
    "robohashImage": "https://robohash.tokenly.com/0e28460cb598d6d9235554e89734fd3c4c620833e7c6c90d84ca120890bb813d.png?set=set3",
    "backgroundImage": "https://s3.amazonaws.com/tokenly-swapbot/images/5b78c3721cdedaa466cb2fe41aeab8ae67364b786e3c74967fe0959312d54e4f/full.jpg",
    "logoImage": "https://s3.amazonaws.com/tokenly-swapbot/images/d6c9594065c361575afab0229d49015e6872793ebf870875f89aa0b0b86dbfc7/thumb.png",
    "swaps": [
      {
        "strategy": "fiat",
        "direction": "sell",
        "in": "BTC",
        "out": "TOKENLY",
        "cost": "5",
        "divisible": false,
        "min_out": "2",
        "type": "buy",
        "fiat": "USD",
        "source": "bitcoinAverage"
      }
    ],
    "balances": {
      "BTC": 0.06300014,
      "TOKENLY": 1672.98906687
    },
    "address": "1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb"
  }
]
```


Fetches all information about a bot by its id.

### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/bots{?parameters}`


### URL Query Parameters

Parameter   | Description
----------- | -----------
name        | Filter by partial bot name match.
description | Filter by partial bot description match.
username    | Filter by partial username match.
inToken     | Filter by exact inToken match.
outToken    | Filter by exact outToken match.
state       | Filter by bot state (brandnew, lowfuel, active, inactive, unpaid).
sort        | Sort the bot by a field.  Allowed sort fields are `name` and `created_at`.

