##New Invoice

Creates a new Pay with Token Markets&trade; invoice. 

**HTTP Method**  
```POST https://tokenmarkets.com/api/v1/pay-with/new```

**Authentication:** valid ```api_key``` query parameter

###Request Parameters

Parameter            | Type     | Description
-------------------- | ---------| ------------
**customerEmail**    |  string  | Customer email for sending receipt - **required**
**paymentType**      |  string  | What method to pay, valid options: bitcoin, token, credit - **required**
**currency**         |  string  | Currency code/asset name to pay with - **required**
**amount**           |  float   | Required amount to pay - **required**
**peg**              |  string  | Peg the amount to another currency, e.g USD
**product**          |  string  | Product label/short description for this invoice - **required**
**company**          |  string  | Company or merchant label/name for this invoice, defaults to your merchant catalog settings.
**logoURL**          |  string  | Custom logo to attach to this invoice. Must be https:// and domain must match API origin host. Defaults to merchant catalog logo.
**completeMessage**  |  string  | Custom message for when invoice completes.
**returnURL**        |  string  | Custom return URL for when invoice completes.
**meta**             |  array   | Optional JSON metadata
**stripeToken**      |  string  | Include with credit paymentType to attempt payment in the same request.


**Returns:** ```(Instant Invoice Object)```

```json
{
   "meta": {
        "btcQuote": 121904,
        "btcQuoteFloat": 1219.04,
        "quoteType": "USD"
    },
}

```

When using the ```peg``` option, the ```amount``` field in the resulting response is replaced with a calculated real total.
For example, ```{paymentType: bitcoin, currency: BTC, peg: USD, amount: 10}``` will recalculate the amount to $10 worth of BTC.
The original requested value is stored in the ```pegValue``` field and the exchange rate in ```pegRate```.

When using the ```bitcoin``` payment type and **not** using the ```peg``` option, a USD:BTC quote is included in the response ```meta``` object.  
Otherwise use the peg/pegValue/pegRate fields to figure out value.
