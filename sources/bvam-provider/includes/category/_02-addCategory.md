## Add a New BVAM Category Schema


```shell
curl -X POST \
    -H "Content-Type: application/json" \
    -d '{"category":{"category_id":"Acme Rewards Program 201609a","properties":{"program_name":{"label":"Program Name","maxLength":127,"type":"string"}},"title":"Acme Rewards Program","version":"1.0.0"}}' \
    https://bvam.tokenly.com/api/v1/category
```



> The above command returns data structured like this:

```json
{
    "uri": "http://bvam-provider.dev/S3m1rrzBemasRcti5vAvrFW3yL9Fa.json",
    "filename": "S3m1rrzBemasRcti5vAvrFW3yL9Fa.json",
    "categoryId": "Acme Rewards Program 201609a",
    "title": "Acme Rewards Program",
    "version": "1.0.0",
    "updatedAt": "2016-09-02T15:57:32+0000"
}
```

Validates the BVAM Category Schema, adds it to the database and calculates the BVAM hash.


### HTTP Request

`POST https://bvam.tokenly.com/api/v1/category`


### Body Parameters

Parameter | Description
--------- | -----------
category  | A structured BVAM Category Schema data object.  This field can also be a JSON formatted string.
