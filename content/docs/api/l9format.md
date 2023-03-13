---
title: "l9format"
weight: 2
description: >
  l9format documentation.
---

l9format is a schema declaration targeted at interoperability between network recon tools used at LeakIX. 

It is the default format returned by our API and various tools.

Its definition can be found on [GitHub](https://github.com/LeakIX/l9format/).

## l9event schema

```json
{
  "event_type": "leak",
  "event_source": "DotEnvConfigPlugin",
  "event_pipeline": [
    "ip4scout",
    "l9tcpid",
    "l9explore",
    "DotEnvConfigPlugin"
  ],
  "event_fingerprint": "ab2848eed8451d0ea0d48a691126d1aeab2848eed8451d0ea0d48a691126d1ae",
  "ip": "127.0.0.1",
  "host": "site1.example.com",
  "reverse": "ptr1.example.com",
  "port": "8080",
  "mac": "",
  "vendor": "",
  "transport": [
    "tcp",
    "tls",
    "http"
  ],
  "protocol": "https",
  "http": {
    "root": "/site1",
    "url": "/site1/.env",
    "status": 200,
    "length": 12423,
    "header": {
      "Content-Type": "application/text",
      "Server": "Apache"
    },
    "title": "Apache welcome page",
    "favicon_hash": "e7bc546316d2d0ec13a2d3117b13468f5e939f95"
  },
  "summary": "GET /... qwerqwer",
  "time": "0001-01-01T00:00:00Z",
  "ssl": {
    "detected": true,
    "enabled": true,
    "jarm": "29d29d00029d29d21c41d41d00041dba71dd2df645850cf5f0b5af18a5fdcf",
    "cypher_suite": "TLS_AES_128_GCM_SHA256",
    "version": "TLSv1.3",
    "certificate": {
      "cn": "example.com",
      "domain": [
        "site.example.com",
        "admin.example.com"
      ],
      "fingerprint": "e998e371dd4678c9113e196bc5e4a5e901455750c6dbc9985c84403b91055260",
      "key_algo": "RSA",
      "key_size": 2048,
      "issuer_name": "Rapid SSL",
      "not_before": "0001-01-01T00:00:00Z",
      "not_after": "0001-01-01T00:00:00Z",
      "valid": false
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
      "noauth": true,
      "username": "",
      "password": "",
      "key": "",
      "raw": "SSBhbSBhIGtleQo="
    },
    "software": {
      "name": "Apache",
      "version": "2.2.4",
      "os": "Ubuntu",
      "modules": [
        {
          "name": "PHP",
          "version": "4.4.2",
          "fingerprint": "php-4-4-2"
        }
      ],
      "fingerprint": "apache-2-2-4"
    }
  },
  "leak": {
    "stage": "open",
    "type": "configuration",
    "severity": "medium",
    "dataset": {
      "rows": 4,
      "files": 1,
      "size": 13223,
      "collections": 1,
      "infected": false,
      "ransom_notes": [
        "Do this",
        "Don't do that",
        "We love GDPR"
      ]
    }
  },
  "tags": [
    "plc"
  ],
  "geoip": {
    "continent_name": "",
    "region_iso_code": "",
    "city_name": "",
    "country_iso_code": "",
    "country_name": "",
    "region_name": "",
    "location": {
      "lat": 0,
      "lon": 0
    }
  },
  "network": {
    "organization_name": "",
    "asn": 0,
    "network": ""
  }
}
```
