# Errors


The BVAM Provider API uses the following error codes:


Error Code | Name                  | Meaning
---------- | --------------------- | -------------------------------------------------
400        | Bad Request           | The data contained a syntax error or was invalid
404        | Not Found             | The resource is not found
405        | Method Not Allowed    | You tried to access an endpoint with an invalid method
410        | Gone                  | The requested resource is no longer present
422        | Unprocessable Entity  | The data was valid, but violated one or more validation rules
429        | Too Many Requests     | Too Many Requests
500        | Internal Server Error | We had a problem with our server. Try again later.
503        | Service Unavailable   | We're temporarially offline for maintanance. Please try again later.
