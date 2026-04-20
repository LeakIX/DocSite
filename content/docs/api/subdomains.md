---
title: 'Subdomains'
weight: 6
description: >
  Subdomains API documentation.
---

The subdomain endpoint allows you to find subdomains for a given domain.

{{< tip >}} Registered and pro users are getting more results. See our various
[plans](https://leakix.net/plans) to get access. {{< /tip >}}

## GET /api/subdomains/:domain

### Parameters

| name    | placement | comment                           |
| ------- | --------- | --------------------------------- |
| accept  | header    | Must be set to `application/json` |
| api-key | header    | Your API key                      |
| domain  | url path  | Must contain the domain           |

### Example

{{< tabs "subdomains-example" >}}

{{< tab "Curl" >}} {{< include-code "examples/api/subdomains.sh" "sh" >}}
{{< /tab >}}

{{< tab "Python" >}} {{< include-code "examples/api/subdomains.py" "python" >}}
{{< /tab >}}

{{< /tabs >}}

### Successful response

Receiving `200` means the request was successful and a JSON array for subdomains
is returned :

{{< include-code "examples/api/responses/subdomains_response.json" "json" >}}

### Rate limiting

All requests to LeakIX.net's API are limited at ~1 request per second.

If the limit is reached, the API will return a `429` http status code and a
`x-limited-for` header.

The client MUST wait for the duration of `x-limited-for` before the next
request.

```http request
HTTP/1.1 429 Rate-limited
Date: Mon, 27 Jul 2009 12:28:53 GMT
x-limited-for: 344.24ms
```
