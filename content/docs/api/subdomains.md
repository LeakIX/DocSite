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

### Curl example

```sh
curl -H 'accept: application/json' "https://leakix.net/api/subdomains/leakix.net"
```

### Successful response

Receiving `200` means the request was successful and a JSON array for subdomains
is returned :

```json
[
  {
    "subdomain": "www.leakix.net",
    "distinct_ips": 1,
    "last_seen": "2023-01-20T11:25:41.243Z"
  },
  {
    "subdomain": "staging.leakix.net",
    "distinct_ips": 1,
    "last_seen": "2023-01-20T11:23:03.404Z"
  },
  {
    "subdomain": "blog.leakix.net",
    "distinct_ips": 1,
    "last_seen": "2021-05-13T06:43:31.441Z"
  },
  {
    "subdomain": "checkout.leakix.net",
    "distinct_ips": 1,
    "last_seen": "2022-09-20T14:05:28.251Z"
  },
  {
    "subdomain": "cftest.leakix.net",
    "distinct_ips": 1,
    "last_seen": "2023-01-20T11:26:07.057Z"
  },
  {
    "subdomain": "scan.leakix.net",
    "distinct_ips": 1,
    "last_seen": "2023-02-23T11:23:57.141Z"
  }
]
```

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
