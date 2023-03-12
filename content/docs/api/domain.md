---
title: "Domain details"
weight: 5
description: >
  This page tells you how to get started with the Compose theme.
---


The domain details endpoint allows you to get information about a specific domain and its subdomains.

## GET /domain/:domain

### Parameters

| name    | placement | comment                           |
|---------|-----------|-----------------------------------|
| accept  | header    | Must be set to `application/json` |
| api-key | header    | Your API key                      |
| domain  | url path  | Must contain the domain           |

### Curl example

```sh
curl -H 'accept: application/json' "https://leakix.net/domain/leakix.net"
```

### Successful response

Receiving `200` means the request was successful.

The response will contain two field, `Services` and `Leaks` both being an array of [l9events](/docs/api/l9format/#l9event-schema).

They can be `null` if no information was found.

```json
{
  "Services": [
    {
      "event_type": "service",
      "event_source": "HttpPlugin",
      "event_pipeline": [
        "CertStream",
        "l9scan",
        "tcpid",
        "HttpPlugin"
      ],
      "event_fingerprint": "6d1f2e7ca5e9923a7028676ebb61f31f953e09cfa2883d1a5560acfc769e213c",
      "ip": "157.90.211.37",
      "host": "leakix.org",
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
        "url": "",
        "status": 0,
        "length": 0,
        "header": {
          "content-length": "169",
          "location": "https://leakix.net/",
          "server": "nginx/1.19.0"
        },
        "title": "301 Moved Permanently",
        "favicon_hash": ""
      },
      "summary": "Content-Length: 169\r\nContent-Type: text/html\r\nDate: Fri, 20 Jan 2023 11:25:44 GMT\r\nLocation: https://leakix.net/\r\nServer: nginx/1.19.0\r\nConnection: close\r\n\nPage title: 301 Moved Permanently\n\n<html>\r\n<head><title>301 Moved Permanently</title></head>\r\n<body>\r\n<center><h1>301 Moved Permanently</h1></center>\r\n<hr><center>nginx/1.19.0</center>\r\n</body>\r\n</html>\r\n",
      "time": "2023-01-20T11:25:41.135469289Z",
      "ssl": {
        "detected": false,
        "enabled": true,
        "jarm": "3fd21b20d3fd3fd21c3fd21b21b3fd02f2ce530964392ff49a9ba1e4931ee9",
        "cypher_suite": "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
        "version": "TLSv1.2",
        "certificate": {
          "cn": "www.leakix.net",
          "domain": [
            "leakix.com",
            "leakix.org",
            "leaks.nobody.run",
            "www.leakix.com",
            "www.leakix.net",
            "www.leakix.org"
          ],
          "fingerprint": "408f41c899c9a75c6f71b70fec08f1d19f0c230ad55cb1ff8b69bf6bf1e7465d",
          "key_algo": "RSA",
          "key_size": 4096,
          "issuer_name": "R3",
          "not_before": "2023-01-20T10:23:55Z",
          "not_after": "2023-04-20T10:23:54Z",
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
          "name": "nginx",
          "version": "1.19.0",
          "os": "",
          "modules": null,
          "fingerprint": ""
        }
      },
      "leak": {
        "stage": "",
        "type": "",
        "severity": "",
        "dataset": {
          "rows": 0,
          "files": 0,
          "size": 0,
          "collections": 0,
          "infected": false,
          "ransom_notes": null
        }
      },
      "tags": [],
      "geoip": {
        "continent_name": "Europe",
        "region_iso_code": "",
        "city_name": "",
        "country_iso_code": "DE",
        "country_name": "Germany",
        "region_name": "",
        "location": {
          "lat": 51.2993,
          "lon": 9.491
        }
      },
      "network": {
        "organization_name": "Hetzner Online GmbH",
        "asn": 24940,
        "network": "157.90.0.0/16"
      }
    }
  ],
  "Leaks": null
}
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

