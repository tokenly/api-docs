## Add a New BVAM Document


```shell
curl -X POST \
    -H "Content-Type: application/json" \
    -d '{"bvam": {"asset": "MYTOKEN", "name": "My Token", "meta": {"bvam_version": "1.0.0"}}}' \
    https://bvam.tokenly.com/api/v1/bvam
```



> The above command returns data structured like this:

```json
{
  "uri": "http://bvam-provider.dev/T2XRkYJQz7xjUt6HeDoFxTLSMywak.json",
  "filename": "T2XRkYJQz7xjUt6HeDoFxTLSMywak.json",
  "asset": "MYTOKEN",
  "updatedAt": "2016-09-02T11:52:19+0000"
}
```

Validates the BVAM data, adds it to the database and calculates the BVAM hash.


### HTTP Request

`POST https://bvam.tokenly.com/api/v1/bvam`


### Body Parameters

Parameter | Description
--------- | -----------
bvam      | A structured BVAM data object.  This field can also be a JSON formatted string.
