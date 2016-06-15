## Fuel Info Object

```
{
  "result": {
    "fuel_address": "16K4Xh3798pizCJxyY8QY5M4jZjZ6ESuAP",
    "fuel_balance": 2381949,
    "fuel_pending": 0,
    "fuel_spent": 0,
    "fuel_balanceFloat": 0.02381949,
    "fuel_pendingFloat": 0,
    "fuel_spentFloat": 0
  }
}

```

Response object returned by Get Fuel Info method. 

**Response variables**

Variable              | Type     | Description
-------------------   | -------- | ------------
**fuel_address**      | string   | BTC fuel address
**fuel_balance**      | integer  | Current fuel balance, in satoshis
**fuel_pending**      | integer  | BTC pending confirmation
**fuel_spent**        | integer  | Total BTC fuel spent
**fuel_balanceFloat** | float    | Balance as a float, human readable
**fuel_pendingFloat** | float    | Pending as a float
**fuel_spentFloat**   | float    | Spent total as a float
