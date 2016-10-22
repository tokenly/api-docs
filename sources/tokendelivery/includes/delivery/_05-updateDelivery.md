## Update an existing delivery

```shell
DELIVERY_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "PATCH\nhttps://deliver.tokenly.com/api/v1/source/${DELIVERY_UUID}\n{\"quantity\": 600000000}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X PATCH \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"quantity": 600000000}' \
    https://deliver.tokenly.com/api/v1/source/${DELIVERY_UUID}
```


> The above command returns data structured like this:

```json
{
    "id": "93f5de16-693b-416e-8d63-2368f2b34a44",
    "sourceUuid": "9793f526-d01b-4a48-9569-0a72a3096b06",
    "destination": "1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j",
    "token": "SOUP",
    "quantity": 600000000,
    "deliveryDate": "2016-10-22T20:00:00+0000",
    "refData": "test ref data",
    "pseudo": false,
    "holdPromise": false,
    "promiseId": 123,
    "state": "0",
    "complete": false,
    "updatedAt": "2016-10-21T18:43:21+0000",
    "createdAt": "2016-10-21T18:43:21+0000"
}
```

Update an existing delivery.  Some fields are allowed to be changed.


### HTTP Request

`PATCH https://deliver.tokenly.com/api/v1/source/{deliveryId}`


### URL Parameters

Parameter  | Description
---------  | -----------
deliveryId | The UUID of the delivery


### Body Parameters

Parameter     | Description
------------  | -----------
quantity      | (integer) in satoshis.  The changed amount must still be available in the source address
delivery_date | (timestamp | null) change the scheduled delivery date
ref_data      | (string) update optional extra reference data
ready         | (boolean) mark this delivery as ready for fulfillment

