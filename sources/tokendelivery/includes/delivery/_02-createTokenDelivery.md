## Create a Token Delivery

```shell
API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "POST\nhttps://deliver.tokenly.com/api/v1/delivery\n{\"source\": \"9793f526-d01b-4a48-9569-0a72a3096b06\", \"destination\": \"1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j\", \"token\": \"SOUP\", \"quantity\": 500000000, \"deliveryDate\": 1477166400}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X POST \
    -H "Content-Type: application/json" \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    -d '{"source": "9793f526-d01b-4a48-9569-0a72a3096b06", "destination": "1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j", "token": "SOUP", "quantity": 500000000, "deliveryDate": 1477166400}' \
    https://deliver.tokenly.com/api/v1/delivery
```



> The above command returns data structured like this:

```json
{
    "id": "93f5de16-693b-416e-8d63-2368f2b34a44",
    "sourceUuid": "9793f526-d01b-4a48-9569-0a72a3096b06",
    "destination": "1AAAA1111xxxxxxxxxxxxxxxxxxy43CZ9j",
    "token": "SOUP",
    "quantity": 500000000,
    "deliveryDate": "2016-10-22T20:00:00+0000",
    "refData": "test ref data",
    "pseudo": false,
    "holdPromise": false,
    "promiseId": 123,
    "updatedAt": "2016-10-21T18:43:21+0000",
    "createdAt": "2016-10-21T18:43:21+0000"
}
```

Creates a new token delivery.  Also registers a new Tokenpass promise and provisional transaction unless `hold_promise` is true.  Checks that the source address has enough inventory to cover this quantity.  Pseudo token deliveries skip this check and can use any source address. 


### HTTP Request

`POST https://deliver.tokenly.com/api/v1/delivery`


### Body Parameters

source        | (string) uuid OR bitcoin address of source to retrieve and send token inventory from
destination   | (string) bitcoin address
token         | (string) token or pseudo token to delivery
quantity      | (integer) quantity of token to deliver, in satoshis.
delivery_date | (timestamp, Optional) set to null to fulfill only on manual request, or set a date for automatic delivery
ref_data      | (string, Optional) optional extra reference data you can attach
hold_promise  | (boolean, Optional) default false, true if you want to register a delivery without creating an immediate promise
pseudo        | (boolean, Optional) default false, true if using an un-issued (not real) token, makes delivery stuck in promise form and unfulfillable until swapped for a real token delivery.

