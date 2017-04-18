##Instant Invoice Object

JSON data returned from Instant Invoice API methods.

```
{
    "uuid": "a78604cc-ca89-4793-b1aa-4ca3d2901084",
    "status": "pending",
    "paymentType": "bitcoin",
    "currency": "BTC",
    "amount": 2089999,
    "received": 0,
    "peg": "USD",
    "pegRate": 122105,
    "pegValue": 2552,
    "customerEmail": "team@tokenly.com",
    "paymentAddress": "12evCwtsAuovEh6p6QpcSEyH1GC5co5Veh",
    "companyLabel": "Token.FM",
    "productLabel": "6 months service",
    "completeMessage": null,
    "returnUrl": null,
    "expires": 1492558124,
    "originHost": "token.fm",
    "createdAt": "2017-04-18T15:28:44-07:00",
    "updatedAt": "2017-04-18T15:28:49-07:00",
    "meta": [],
    "companyLogo": "https://tokenmarkets.com/files/catalog/d1df0df976b9c340725c.png",
    "pegRateFloat": 1221.05,
    "pegValueFloat": 25.52,
    "amountFloat": 0.02089999,
    "receivedFloat": 0
}
```

**Response variables**

Variable            | Type     | Description
------------------- | --------- | ------------
**uuid**            |  string   | Unique reference ID for this invoice
**status**          |  string   | Current status: pending, receiving, complete, expired
**paymentType**     |  string   | Payment method: bitcoin, token or credit
**currency**        |  string   | Currency code or asset ID to pay with
**amount**          |  integer  | Final total in satoshis (or cents) to pay
**amountFloat**     |  float    | Human readable invoice total
**received**        |  integer  | Received amount in satoshis (or cents)
**receivedFloat**   |  float    | Readable version of received amount
**peg**             |  string   | Currency that the amount was pegged to, e.g USD
**pegRate**         |  integer  | Exchange rate used to calculated pegged amount, in cents
**pegRateFloat**    |  float    | Readable version of exchange rate used
**pegValue**        |  integer  | Original requested value for pegged amounts
**pegValueFloat**   |  float    | Readable peg value
**customerEmail**   |  string   | Customer email address to send receipt
**paymentAddress**  |  string   | Bitcoin deposit payment address
**companyLabel**    |  string   | Custom company label, defaults to merchant catalog title
**productLabel**    |  string   | Short invoice description
**completeMessage** |  string   | Custom text to include on completion
**returnUrl**       |  string   | Custom URL to redirect customer on complete
**expires**         |  integer  | Unix timestamp of when this invoice expires if pending and unreceived (defaults 2 hours)
**originHost**      |  string   | Host domain name that made the API request
**createdAt**       |  datetime | Timestamp of when invoice was created
**updatedAt**       |  datetime | Timestamp of when invoice was last updated
**meta**            |  array    | Additional custom metadata that can be included for reference


