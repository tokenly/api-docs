## Distribution Stages

```
{
    "0": "Initialize",
	"1": "CollectTokens",
	"2": "CollectFuel",
	"3": "PrimeUtxos",
	"4": "PrepareTxs",
	"5": "BroadcastTxs",
	"6": "ConfirmBroadcasts",
	"7": "ConsolidateTxs",
	"8": "CompleteCleanup"
}


```

Each distribution goes through ```9``` stages from start to finish, distributing your tokens as efficiently as possible.

**Details on each stage listed below:**

Name                  | ID      | Description
-----------------     | ------- | ------------
**Initialize**        | 0       | Initial setup and deposit address generated
**CollectTokens**     | 1       | Waits for asset_total to arrive
**CollectFuel**       | 2       | Waits for BTC fees to arrive and/or auto sends fees from fuel address
**PrimeUtxos**        | 3       | Prepares UTXO set for all required transactions
**PrepareTxs**        | 4       | Assigns a confirmed UTXO to each destination address
**BroadcastTxs**      | 5       | Constructs and broadcasts all transactions to network
**ConfirmBroadcasts** | 6       | Waits until all broadcasts have reached at least 1 confirmation
**ConsolidateTxs**    | 7       | Cleans up UTXO set if needed
**CompleteCleanup**   | 8       | Marks complete and forwards leftover change to service as a fee
