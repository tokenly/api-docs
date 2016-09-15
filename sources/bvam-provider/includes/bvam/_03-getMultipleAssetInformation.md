## Get multiple asset information


```shell
curl -X GET \
    https://bvam.tokenly.com/api/v1/assets?assets=SOUP,TOKENLY



> The above command returns data structured like this:

```json
[
    {
        "asset": "SOUP",
        "filename": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json",
        "hash": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ",
        "uri": "https://bvam.tokenly.com/T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ.json",
        "txid": "4a06b9889f7553983cd2d4edc196ec9bc9abd52b955885238932c3d718952ead",
        "lastUpdated": "2016-09-13T19:47:16+0000",
        "assetInfo": {
            "issuer": "1AuTJDwH6xNqxRLEjPB7m86dgmerYVQ5G1",
            "supply": 10000000000000,
            "locked": false,
            "owner": "1AuTJDwH6xNqxRLEjPB7m86dgmerYVQ5G1",
            "asset": "SOUP",
            "description": "T2JAC8ix9g6PhsmKbeiXjtd2yEfCZ",
            "divisible": true,
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
    },
    {
        "asset": "TOKENLY",
        "filename": null,
        "hash": null,
        "uri": null,
        "txid": null,
        "lastUpdated": null,
        "assetInfo": {
            "description": "Tokenly.co",
            "issuer": "12717MBviQxttaBVhFGRP1LxD8X6CaW452",
            "owner": "12717MBviQxttaBVhFGRP1LxD8X6CaW452",
            "supply": 10000000000000,
            "divisible": true,
            "asset": "TOKENLY",
            "locked": false,
            "status": "valid",
            "tx_hash": "a1d34271d7ebc983d37d351759e8a195605db2a9e8bef3ad50320005807e1062",
            "block_index": 310637
        },
        "metadata": {
            "asset": "TOKENLY",
            "name": "TOKENLY",
            "description": "Tokenly.co",
            "meta": {
                "bvam_version": "1.0.0"
            }
        },
        "bvamString": null,
        "validated": false
    }
]
```

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

Returns an array of information for multiple assets.  See <a href="#get-all-information-for-an-asset">Get all information for an asset</a> for details about the asset information type.


### HTTP Request

`https://bvam.tokenly.com/api/v1/assets`


### Query Parameters

Parameter | Description
--------- | -----------
assets    | A comma separated list of asset names

