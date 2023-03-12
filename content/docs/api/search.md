---
title: "Search"
weight: 3
description: >
  This page tells you how to get started with the Compose theme.
---


The search endpoint allows you to search for results in the index and get results as endpoint.

## GET /search

### Parameters

| name    | placement     | comment                                                   |
|---------|---------------|-----------------------------------------------------------|
| accept  | header        | Must be set to `application/json`                         |
| api-key | header        | Your API key                                              |
| scope   | url parameter | Must be either `service` or `leak`                        |
| q       | url parameter | Must be an url encoded [search query](/docs/query/syntax) |
| page    | url parameter | Indicates the page to start at, default is `0`            |

### Curl example

```sh
curl -H 'accept: application/json' "https://leakix.net/search?scope=leak&page=0&q=searchquery"
```

### Successful response

Receiving `200` means the request was successful and array of [l9events](/docs/api/l9format/#l9event-schema) is returned :  

```json
[
  {
    "event_type": "leak",
    "event_source": "DotDsStoreOpenPlugin",
    "event_pipeline": [
      "ip4scout",
      "l9tcpid",
      "l9explore",
      "l9dnsextract",
      "l9tcpid",
      "l9explore",
      "DotDsStoreOpenPlugin"
    ],
    "event_fingerprint": "5f32cf5d6962f09c026392ab026392ab2102d61cba3ab5c5373bc7624ba0ddeb",
    "ip": "206.189.154.196",
    "host": "www.ossphinc.com",
    "reverse": "",
    "port": "443",
    "mac": "",
    "vendor": "",
    "transport": [
      "tcp",
      "tls",
      "http"
    ],
    "protocol": "https",
    "http": {
      "root": "",
      "url": "/",
      "status": 200,
      "length": 0,
      "header": {
        "content-type": "text/html; charset=UTF-8",
        "server": "Apache/2.4.18 (Ubuntu)"
      },
      "title": "OSSPHincOpenSource Support",
      "favicon_hash": ""
    },
    "summary": "Found 7 files trough .DS_Store spidering:\n\n/images\n/images/client\n/images/header\n/sched\n/sched/includes\n/sms\n/videos",
    "time": "2021-08-14T16:57:04.387052639Z",
    "ssl": {
      "detected": false,
      "enabled": true,
      "jarm": "29d29d15d29d29d21c29d29d29d29dc7639a2c8ee8049d85e08031e30b69d9",
      "cypher_suite": "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
      "version": "TLSv1.2",
      "certificate": {
        "cn": "ossphinc.com",
        "domain": [
          "ossphinc.com",
          "www.ossphinc.com",
          "ossphinc.com",
          "www.ossphinc.com"
        ],
        "fingerprint": "2a3515620c31ff811d6e6e4e7599213fbe9bec5e35dedd9ac7b4d03d25484db2",
        "key_algo": "RSA",
        "key_size": 2048,
        "issuer_name": "R3",
        "not_before": "2021-07-19T01:07:26Z",
        "not_after": "2021-10-17T01:07:24Z",
        "valid": true
      }
    },
    "ssh": {
      "fingerprint": "",
      "version": 0,
      "banner": "",
      "motd": ""
    },
    "service": {
      "credentials": {
        "noauth": false,
        "username": "",
        "password": "",
        "key": "",
        "raw": null
      },
      "software": {
        "name": "Apache",
        "version": "2.4.18",
        "os": "Ubuntu",
        "modules": null,
        "fingerprint": ""
      }
    },
    "leak": {
      "stage": "open",
      "type": "",
      "severity": "low",
      "dataset": {
        "rows": 0,
        "files": 7,
        "size": 0,
        "collections": 0,
        "infected": false,
        "ransom_notes": null
      }
    },
    "tags": null,
    "geoip": {
      "continent_name": "Asia",
      "region_iso_code": "",
      "city_name": "Singapore",
      "country_iso_code": "SG",
      "country_name": "Singapore",
      "region_name": "",
      "location": {
        "lat": 1.3078,
        "lon": 103.6818
      }
    },
    "network": {
      "organization_name": "DIGITALOCEAN-ASN",
      "asn": 14061,
      "network": "206.189.0.0/16"
    }
  }
]
```

### Rate limiting

All requests to LeakIX.net's API are limited at ~1 request per second.

If the limit is reached, the API will return a `429` http status code and a `x-limited-for` header.

The client MUST wait for the duration of `x-limited-for` before the next request.

```http request
HTTP/1.1 429 Rate-limited
Date: Mon, 27 Jul 2009 12:28:53 GMT
x-limited-for: 344.24ms
```
