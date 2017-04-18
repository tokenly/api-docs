##Pay Invoice with Credit Card

Pay a ```credit``` type invoice using Stripe. For retrieving the correct payment input, see the [Stripe Elements documentation](https://stripe.com/docs/elements).

**HTTP Method**  
```POST https://tokenmarkets.com/api/v1/instant-invoice/{uuid}/pay```

**Authentication:** valid ```api_key``` query parameter

###Request Parameters

Parameter            | Type     | Description
-------------------- | ---------| ------------
**stripeToken**      |  string  | Obtained via stripe.js - **required**

**Returns:** ```(Instant Invoice Object)```
