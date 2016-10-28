## List all active BVAM documents


```shell
curl -X GET \
    https://bvam.tokenly.com/api/v1/bvam/all



> The above command returns data structured like this:

```json
{
  "count": 1,
  "items": [
    {
      "filename": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json",
      "uri": "https://bvam.tokenly.com/T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json",
      "asset": "SOUP",
      "txid": "4a06b9889f7553983cd2d4edc196ec9bc9abd52b955885238932c3d718952ead",
      "lastUpdated": "2016-09-10T15:43:18+0000"
    }
  ]
}
```

Returns a list of all validated BVAM files.


### HTTP Request

`GET https://bvam.tokenly.com/api/v1/bvam/all`
