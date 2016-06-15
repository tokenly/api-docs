## Distribution Object

This is the response object containing individual distribution details.

```
{
  "result": {
    "id": 7,
    "label": "my test distribution",
    "created_at": "2016-06-09 08:21:26",
    "updated_at": "2016-06-09 08:21:26",
    "stage": 1,
    "stage_message": null,
    "complete": 0,
    "deposit_address": "1FhemSGz1FkRmAs8QhYTaDUztpMv16ki9D",
    "network": "btc",
    "asset": "LTBCOIN",
    "asset_total": 554533140000,
    "fee_total": 77720,
    "asset_received": 0,
    "fee_received": 0,
    "hold": 0,
    "use_fuel": 1,
    "webhook": null,
    "asset_totalFloat": 5545.3314,
    "fee_totalFloat": 0.0007772,
    "asset_receivedFloat": 0,
    "fee_receivedFloat": 0,
    "stage_name": "CollectTokens",
    "address_list": [
      {
        "destination": "1AnxkFGEwjN4XL4ZWpbQ36wubFcxnwTU5K",
        "quantity": 2000000000,
        "utxo": null,
        "txid": null,
        "confirmed": 0,
        "updated_at": "2016-06-09 08:21:26",
        "quantity_float": 20
      },
      {
        "destination": "1CTKPjRMiMAcyywy1KRs9JZShWiRUudqnS",
        "quantity": 2523140000,
        "utxo": null,
        "txid": null,
        "confirmed": 0,
        "updated_at": "2016-06-09 08:21:26",
        "quantity_float": 25.2314
      },
      {
        "destination": "19ADjZ2CUKP2kkh2qzmpGd5CYAMJNQ896V",
        "quantity": 550010000000,
        "utxo": null,
        "txid": null,
        "confirmed": 0,
        "updated_at": "2016-06-09 08:21:26",
        "quantity_float": 5500.1
      }
    ]
  }
}
```

**Response variables**

Variable                | Type     | Description
---------------------   | ---------  | ------------
**id**                  |  integer   | Distribution ID
**label**               |  string    | Reference label
**created_at**          |  timestamp | Date initiated
**updated_at**          |  timestamp | Last updated
**stage**               |  integer   | Current stage ID
**stage_message**       |  integer   | Extra status message from stage
**complete**            |  integer   | If distribution complete or not
**deposit_address**     |  string    | Bitcoin address
**network**             |  string    | Cryptocurrency network
**asset**               |  integer   | Token name
**asset_total**         |  integer   | Total required amount of tokens to send, in satoshis
**fee_total**           |  integer   | BTC fee required, in satoshis
**asset_received**      |  integer   | Tokens received, in satoshis
**fee_received**        |  integer   | BTC fees received, in satoshis
**hold**                |  integer   | If distro on hold
**use_fuel**            |  integer   | Automatically source fees from fuel address
**webhook**             |  integer   | Notify URL with updates
**asset_totalFloat**    |  float     | Total tokens to send as a more human readable value
**fee_totalFloat**      |  float     | Fee total as a float
**asset_receivedFloat** |  float     | Tokens received as a float
**fee_receivedFloat**   |  float     | Fee received as a float
**stage_name**          |  string    | Code name for current stage ID
**address_list**        |  array     | Array of Distribution TX Objects

