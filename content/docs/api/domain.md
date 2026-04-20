---
title: 'Domain details'
weight: 5
description: >
  Domain API endpoint documentation.
---

The domain details endpoint allows you to get information about a specific
domain and its subdomains.

## GET /domain/:domain

### Parameters

| name    | placement | comment                           |
| ------- | --------- | --------------------------------- |
| accept  | header    | Must be set to `application/json` |
| api-key | header    | Your API key                      |
| domain  | url path  | Must contain the domain           |

### Example

{{< tabs "domain-example" >}}

{{< tab "Curl" >}} {{< include-code "examples/api/domain.sh" "sh" >}}
{{< /tab >}}

{{< tab "Python" >}} {{< include-code "examples/api/domain.py" "python" >}}
{{< /tab >}}

{{< /tabs >}}

### Successful response

Receiving `200` means the request was successful.

The response will contain two field, `Services` and `Leaks` both being an array
of [l9events](/docs/api/l9format/#l9event-schema).

They can be `null` if no information was found.

{{< include-code "examples/api/responses/domain_response.json" "json" >}}

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
