## Distribution TX Object

Data shown in the ```address_list``` response variable from the ```Distribution Object```.

```
      {
        "destination": "19ADjZ2CUKP2kkh2qzmpGd5CYAMJNQ896V",
        "quantity": 550010000000,
        "utxo": "2c330171bdf32d60c6aaa98493abb084c799887df8fb507908fbb231de8323c9:0",
        "txid": null,
        "confirmed": 0,
        "updated_at": "2016-06-09 08:21:26",
        "quantity_float": 5500.1
      }

```

**Response variables**

Variable            | Type       | Description
------------------- | ---------  | ------------
**destination**     |  string    | Destination address
**quantity**        |  integer   | Quantity to send, in satoshis
**utxo**            |  string    | UTXOs to use, in format &lt;txid&gt;:&lt;n&gt; (comma separated)
**txid**            |  string    | TX ID, if sent
**confirmed**       |  integer   | If confirmed on blockchain
**updated_at**      |  timestamp | Last updated
**quantity_float**  |  float     | Quantity to send as a human readable float

