## List all active BVAM Category Schemas


```shell
curl -X GET \
    https://bvam.tokenly.com/api/v1/category/all



> The above command returns data structured like this:

```json
{
    "count": 1,
    "items": [
        {
            "categoryId": "DWCGDS",
            "filename": "S3GEQCrn48HG8vfKzA9GqueuQgSwA.json",
            "lastUpdated": "2016-09-13T17:34:16+0000",
            "title": "Canned Goods",
            "txid": "45d491e49ce6ef3debbd853f2639b50f4db7369450e6b42a4a802cc5a22f9990",
            "uri": "https://bvam.tokenly.com/S3GEQCrn48HG8vfKzA9GqueuQgSwA.json",
            "version": "1.0.0"
        }
    ]
}
```

Returns a list of all validated BVAM categories.


### HTTP Request

`GET https://bvam.tokenly.com/api/v1/category/all`
