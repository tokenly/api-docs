## Get all information for an asset


```shell
curl -X GET \
    https://bvam.tokenly.com/api/v1/asset/SOUP



> The above command returns data structured like this:

```json
{
  "asset": "SOUP",
  "filename": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json",
  "hash": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ",
  "uri": "https://bvam.tokenly.com/T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json",
  "txid": "4a06b9889f7553983cd2d4edc196ec9bc9abd52b955885238932c3d718952ead",
  "lastUpdated": "2016-09-10T15:43:18+0000",
  "assetInfo": {
    "locked": false,
    "description": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ",
    "divisible": true,
    "asset": "SOUP",
    "owner": "1AuTJDwH6xNqxRLEjPB7m86dgmerYVQ5G1",
    "issuer": "1AuTJDwH6xNqxRLEjPB7m86dgmerYVQ5G1",
    "supply": 10000000000000,
    "status": "valid",
    "tx_hash": "4a06b9889f7553983cd2d4edc196ec9bc9abd52b955885238932c3d718952ead",
    "block_index": 428929
  },
  "metadata": {
    "asset": "SOUP",
    "name": "Devon's Soup",
    "short_name": "Soup",
    "description": "All soup, all the time",
    "website": "https://devonweller.com",
    "meta": {
      "bvam_version": "1.0.0",
      "generated_by": "Devon"
    }
  },
  "bvamString": "{\n    \"asset\": \"SOUP\",\n    \"name\": \"Devon's Soup\",\n    \"short_name\": \"Soup\",\n    \"description\": \"All soup, all the time\",\n    \"website\": \"https://devonweller.com\",\n    \"meta\": {\n        \"bvam_version\": \"1.0.0\",\n        \"generated_by\": \"Devon\"\n    }\n}\n",
  "validated": true
}```

> Here is an example with enhanced asset information

```json
{
  "asset": "DEVON",
  "filename": null,
  "hash": null,
  "uri": null,
  "txid": null,
  "lastUpdated": null,
  "assetInfo": {
    "locked": false,
    "description": "tokens.devonweller.com/DEVON.json",
    "divisible": true,
    "asset": "DEVON",
    "owner": "1AuTJDwH6xNqxRLEjPB7m86dgmerYVQ5G1",
    "issuer": "1AuTJDwH6xNqxRLEjPB7m86dgmerYVQ5G1",
    "supply": 100000000,
    "status": "valid",
    "tx_hash": "2abe5ead8ca17d57ab6857faa24b257371af7da2e74b5e7f8d525b307a09a984",
    "block_index": 312851
  },
  "metadata": {
    "asset": "DEVON",
    "name": "DEVON",
    "description": "There can only be one.",
    "meta": {
      "bvam_version": "1.0.0"
    },
    "website": "http://www.devonweller.com",
    "images": [
      {
        "data": "data:image/png;base64,iVBORw0KGgoAA...",
        "size": "48x48"
      }
    ]
  },
  "bvamString": null,
  "validated": false
}
```

Returns all asset information.  The assetInfo object includes data from the counterparty network.  If there is validated BVAM data, it is returned in the metadata object.  If BVAM data does not exist, then the metadata includes the enhanced asset info if it exists formatted as BVAM data.  If there is no enhanced asset info, then the basic asset info formatted as BVAM data is returned in the metada object.


### HTTP Request

`GET https://bvam.tokenly.com/api/v1/asset/SOUP`
