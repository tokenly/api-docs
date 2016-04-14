## Search Available Swaps

```php
<?php
$swaps_data = $api->getAvailableSwaps();
```

```shell
curl -X GET "http://swapbot.tokenly.com/api/v1/public/availableswaps?outToken=TOKENLY&sort=cost"
```

```html
<!-- There is no HTML example for this API endpoint -->
```

> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
[
    {
        "swap": {
            "cost": 3.6856237517155,
            "divisible": false,
            "fiat": "USD",
            "in": "XCP",
            "min": "1",
            "out": "TOKENLY",
            "rate": 0.27132449413333
        },
        "bot": {
            "id": "8baabb48-8250-4184-8342-e540244bda5b",
            "name": "The Official TOKENLY 'bot",
            "address": "1YxC7GN6NipW12XLPuCFcTFfkMKYAu1Lb",
            "descriptionHtml": "<p>This bot sells <strong>TOKENLY</strong>, a digital gift certificate token...\n",
            "botUrl": "https://swapbot.tokenly.com/bot/adam/the-official-tokenly-bot",
            "logoImage": "https://s3.amazonaws.com/tokenly-swapbot/images/d6c9594065c361575afab0229d49015e6872793ebf870875f89aa0b0b86dbfc7/thumb.png",
            "robohashImage": "https://robohash.tokenly.com/0e28460cb598d6d9235554e89734fd3c4c620833e7c6c90d84ca120890bb813d.png?set=set3",
            "backgroundImage": "https://s3.amazonaws.com/tokenly-swapbot/images/5b78c3721cdedaa466cb2fe41aeab8ae67364b786e3c74967fe0959312d54e4f/full.jpg",
            "username": "adam"
        }
    }
]
```


Fetches available swaps for all active Swapbots.  The details of the swap are returned in the `swap` object and details of the bot providing the swap are listed for convenience in the `bot` object.

Note that the same bot may be returned multiple times since it may offer multiple swaps that match the search criteria.


### HTTP Request

`GET https://swapbot.tokenly.com/api/v1/public/availableswaps{?parameters}`


### URL Query Parameters

Parameter   | Description
----------- | -----------
inToken     | Filter by exact inToken match.
outToken    | Filter by exact outToken match.
sort        | Sorts the swaps by a field.  Allowed sort fields are `inToken`, `outToken` and `cost`.
