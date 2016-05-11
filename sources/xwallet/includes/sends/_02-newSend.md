## Create a new unsigned send transaction

```php
<?php
$address_uuid = '8ccccccc-1234-5678-1234-cccccccc1111';
$unsigned_send_data = $api->createNewSend($address_uuid, 3, 'TOKENLY', '1TEST1111xxxxxxxxxxxxxxxxxxxtjomkj');
```

```shell
ADDRESS_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

DESTINATION="1TEST1111xxxxxxxxxxxxxxxxxxxtjomkj"
QUANTITY="3"
ASSET="TOKENLY"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://xwallet.tokenly.com/api/v1/sends/${ADDRESS_UUID}\n{"destination":"$DESTINATION","quantity":"$QUANTITY","asset":"$ASSET"}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" \
    -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" \
    -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
  -d '{"destination":"'$DESTINATION'","quantity":"'$QUANTITY'","asset":"'$ASSET'"}' \
  https://xwallet.tokenly.com/api/v1/sends/$ADDRESS_UUID
```


> The above command returns data structured like the following.  Note that there may be more data returned than listed below.

```json
{
    "id": "8ccccccc-1234-5678-1234-cccccccc1111",
    "destination": "1TEST1111xxxxxxxxxxxxxxxxxxxtjomkj",
    "quantity": 3,
    "asset": "TOKENLY",
    "txid": "a123456789123456789123456789123456789123456789123456789aaabbbccc",
    "unsignedTx": "0000113111deadbeef0000aaabcdef1111110000113111deadbeef0000aaabcdef1111110000113111deadbeef0000aaabcdef1111110000113111deadbeef0000aaabcdef111111"
}
```



Creates a new, unsigned transaction.  XWallet will treat UTXOs in this transaction as spent until you either submit or destroy this transaction.

### HTTP Request

`POST https://xwallet.tokenly.com/api/v1/sends/{addressId}`


### URL Parameters

Parameter       | Description
---------       | -----------
addressId       | The UUID of the address to send from.  This is not the bitcoin address.


### Body Parameters

Parameter       | Description
---------       | -----------
destination     | The destination bitcoin address
quantity        | Quantity to send as a float
asset           | The token to send such as BTC or TOKENLY
fee             | The BTC fee to pay as a float (optional)
unconfirmed     | If true, then spend unconfirmed inputs (optional)

<aside class="notice">The POST data should be a json encoded string</aside>
