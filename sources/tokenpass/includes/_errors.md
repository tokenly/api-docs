# Errors


The Tokenpass API uses the following error codes:


Error Code | Name | Meaning
---------- | ------- | -------
403 | Forbidden | The credentials are wrong or missing
404 | Not Found | The resource is not found
405 | Method Not Allowed | You tried to access an endpoint with an invalid method
410 | Gone | The requested resource is no longer present
429 | Too Many Requests | Too Many Requests
500 | Internal Server Error | We had a problem with our server. Try again later.
503 | Service Unavailable | We're temporarially offline for maintanance. Please try again later.
