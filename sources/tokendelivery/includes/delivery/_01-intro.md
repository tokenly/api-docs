# Token Delivery Methods

A Token Delivery is the automated or semi-automated movement of tokens from a source address to a destination bitcoin address.  The source address holds the merchant or service's inventory and the destination is typically a client or customer. 

A delivery happens in two stages.  Stage 1 is a Promise and stage 2 is a Fulfillment.

The promise stage happens immediately when registering a new delivery into the system (unless otherwise requested). This allows for any Tokenpass user with the correct verified Bitcoin address to receive the immediate benefits of Token Controlled Access.

Deliveries remain in a promise stage until either manually marked as `ready` by the client application.  If a `delivery_date` timestamp is set, then the delivery is marked `ready when that time is reached. 

Fullfillments can be executed individually or using a mass distribution tool.  For individual fulfillments, the single transaction ID is saved and observed for confirmations.  When the transaction is confirmed, the delivery is markied complete and the client application is notified.

Multiple address fullfillments of the same token use Bitsplit for automated mass distribution.  For fulfillments via Bitsplit, we wait for Bitsplit to inform us when the entire distribution is complete. 
