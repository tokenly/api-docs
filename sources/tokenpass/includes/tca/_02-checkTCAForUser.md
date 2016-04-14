## Check TCA by Username

```php
<?php # pending...
```

```shell
TOKENLY_USERNAME="deweller"
CLIENT_ID="IRXJwBFiIQt00FzU7jw7edPhtxlG9gZM"
CHECK_QUERY="LTBCOIN=1000"
curl -X GET "https://tokenpass.tokenly.com/api/v1/tca/check/$TOKENLY_USERNAME?client_id=$CLIENT_ID&$CHECK_QUERY"
```

> The above command returns data structured like the following.

```json
{
    "result": true
}
```

* **Basic usage:** include a list of assets to check in your query string, in format ASSET=MIN_AMOUNT
* **Advanced usage:** for more complicated rule sets, you may include an ```op``` (logic operator) as well as a ```stackop``` (secondary logic operator) field in your query string. Append with "_0", "_1" etc. to apply different operators to different asset checks (depends on order of asset list).
* Valid ```op``` values are [==, =, !, !=, >, >= (default), <, <=] and valid ```stackop``` values are [AND (default), OR]
* **Advanced usage example:**
 * ```GET https://tokenpass.tokenly.com/api/v1/tca/check/cryptonaut?client_id=MYCLIENTID&LTBCOIN=10000&op_0==&TOKENLY=1&stackop_1=OR```
 * translates to "return true if user Cryptonaut has exactly 10,000 LTBCOIN OR has at least 1 TOKENLY"
* TCA component source code: https://github.com/tokenly/token-controlled-access/blob/master/src/Tokenly/TCA/Access.php
* Any user you query must have authenticated with your client application at least once, with the "tca" scope applied.

### HTTP Request

`GET https://tokenpass.tokenly.com/api/v1/tca/check/{tokenly_username}?client_id={client_id}&{tca_query}`


### URL Parameters

Parameter | Description
--------- | -----------
tokenly_username     | A valid tokenly username.  This user must have authenticated with the client application identified by client_id.


### Query Parameters

Parameter | Description
--------- | -----------
client_id     | The API identifier for your client application.
tca_query     | The TCA query as explained above


