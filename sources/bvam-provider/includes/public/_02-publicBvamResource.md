## Get a BVAM resource


```shell
curl -X GET \
    https://bvam.tokenly.com/T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json



> The above command returns data structured like this:

```json
{
  "asset": "SOUP",
  "name": "Devon's Soup",
  "short_name": "Soup",
  "description": "All soup, all the time",
  "website": "https://devonweller.com",
  "meta": {
    "bvam_version": "1.0.0",
    "generated_by": "Devon"
  }
}
```


Returns the exact BVAM JSON string.  This string can be hashed to match the BVAM hash in the URL.  BVAM JSON is backwards compatible with the enhanced asset info standard.


### HTTP Request

`GET https://bvam.tokenly.com/T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json`

