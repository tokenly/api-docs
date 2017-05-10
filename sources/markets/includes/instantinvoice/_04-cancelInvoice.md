##Cancel Invoice

Cancel an unpaid pending Pay with Token Markets&trade; invoice, referenced by ```uuid```.

An invoice can only be cancelled if it is in `pending` state with no payment yet received.

**HTTP Method**  
```DELETE https://tokenmarkets.com/api/v1/pay-with/{uuid}```

**Authentication:** valid ```api_key``` query parameter

**Returns:** ```result (boolean)```
