---
title: "Bulk"
weight: 7
description: >
  Bulk API endpoint documentation.
---

Bulk search can be used when requesting a bigger volume of events and avoid paging.

{{< tip "warning" >}}
Bulk is available for pro users only. See our various [plans](https://leakix.net/plans) to get access.
{{< /tip >}}

## GET /bulk/search

### Parameters

| name    | placement     | comment                                                   |
|---------|---------------|-----------------------------------------------------------|
| api-key | header        | Your API key                                              |
| q       | url parameter | Must be an url encoded [search query](/docs/query/syntax) |

### wget example

```sh
wget --header="api-key: your-api-key" "https://leakix.net/bulk/search?q=searchquery" -O results.json
```
```
--2023-03-12 22:25:30--  https://leakix.net/
Resolving leakix.net (leakix.net)... 157.90.211.37
Connecting to leakix.net (leakix.net)|157.90.211.37|:443... connected.
HTTP request sent, awaiting response... 200 OK
Saving to: ‘results.json’

results.json       100%[==========================================================>]  399MB  --.-KB/s    in 0.03s   

2023-03-12 22:26:00 (10 MB/s) - ‘results.json’ saved [314572800/314572800]

```

### Successful response

Receiving `200` means the request was successful and a JSONL file containing [l9events](/docs/api/l9format/#l9event-schema) is returned.

### Rate limiting

All requests to LeakIX.net's API are limited at ~1 request per second.

If the limit is reached, the API will return a `429` http status code and a `x-limited-for` header.

The client MUST wait for the duration of `x-limited-for` before the next request.

```http request
HTTP/1.1 429 Rate-limited
Date: Mon, 27 Jul 2009 12:28:53 GMT
x-limited-for: 344.24ms
```
