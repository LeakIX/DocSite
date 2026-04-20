---
title: 'Search'
weight: 3
description: >
  Search API endpoint documentation.
---

The search endpoint allows you to search for results in the index and get
results as endpoint.

## GET /search

### Parameters

| name    | placement     | comment                                                   |
| ------- | ------------- | --------------------------------------------------------- |
| accept  | header        | Must be set to `application/json`                         |
| api-key | header        | Your API key                                              |
| scope   | url parameter | Must be either `service` or `leak`                        |
| q       | url parameter | Must be an url encoded [search query](/docs/query/syntax) |
| page    | url parameter | Indicates the page to start at, default is `0`            |

### Example

{{< tabs "search-example" >}}

{{< tab "Curl" >}} {{< include-code "examples/api/search.sh" "sh" >}}
{{< /tab >}}

{{< tab "Python" >}} {{< include-code "examples/api/search.py" "python" >}}
{{< /tab >}}

{{< /tabs >}}

### Successful response

Receiving `200` means the request was successful and array of
[l9events](/docs/api/l9format/#l9event-schema) is returned :

{{< include-code "examples/api/responses/search_response.json" "json" >}}

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
