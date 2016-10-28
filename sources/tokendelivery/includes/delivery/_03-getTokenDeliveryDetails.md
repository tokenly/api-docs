## Get token delivery details

```shell
DELIVER_UUID="8ccccccc-1234-5678-1234-cccccccc1111"

API_TOKEN="Txxxxxxxxxxxxxxx"
API_SECRET_KEY="Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
NONCE=`date +%s`
SIGNATURE=$(echo -en "GET\nhttps://deliver.tokenly.com/api/v1/delivery/${DELIVER_UUID}\n{}\n${API_TOKEN}\n${NONCE}" \
    | openssl dgst -sha256 -hmac "${API_SECRET_KEY}" -binary | base64)

curl -X GET \
    -H "X-TOKENLY-AUTH-API-TOKEN: ${API_TOKEN}" -H "X-TOKENLY-AUTH-NONCE: ${NONCE}" -H "X-TOKENLY-AUTH-SIGNATURE: ${SIGNATURE}" \
    https://deliver.tokenly.com/api/v1/delivery/$DELIVER_UUID
```

> The above command returns data structured like the following:

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
    "state": "0",
    "complete": false,
    "updatedAt": "2016-10-21T18:43:21+0000",
    "createdAt": "2016-10-21T18:43:21+0000"
}
```

Gets details and current status of a delivery.  State is 0, 1 or 2.  0 is pending, 1 is ready and 2 is sent.

### HTTP Request

`GET https://deliver.tokenly.com/api/v1/delivery/{deliveryId}`


### URL Parameters

Parameter  | Description
---------  | -----------
deliveryId | The UUID of the delivery


